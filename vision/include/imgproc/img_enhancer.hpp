// ©2022 Microchip Technology Inc. and its subsidiaries
//
// Subject to your compliance with these terms, you may use this Microchip
// software and any derivatives exclusively with Microchip products. You are
// responsible for complying with third party license terms applicable to your
// use of third party software (including open source software) that may
// accompany this Microchip software. SOFTWARE IS “AS IS.” NO WARRANTIES,
// WHETHER EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY
// IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, OR FITNESS FOR A
// PARTICULAR PURPOSE. IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT,
// SPECIAL, PUNITIVE, INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE
// OF ANY KIND WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF
// MICROCHIP HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE
// FORESEEABLE.  TO THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP’S TOTAL
// LIABILITY ON ALL CLAIMS LATED TO THE SOFTWARE WILL NOT EXCEED AMOUNT OF
// FEES, IF ANY, YOU PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE. MICROCHIP
// OFFERS NO SUPPORT FOR THE SOFTWARE. YOU MAY CONTACT MICROCHIP AT
// https://www.microchip.com/en-us/support-and-training/design-help/client-support-services
// TO INQUIRE ABOUT SUPPORT SERVICES AND APPLICABLE FEES, IF AVAILABLE.

#ifndef __SHLS_VISION_IMG_ENHANCER_HPP__
#define __SHLS_VISION_IMG_ENHANCER_HPP__

#include "../common/common.hpp"
#include "../common/utils.hpp"
#include <hls/ap_fixpt.hpp>
#include <hls/ap_int.hpp>

namespace hls {
namespace vision {
/*
Image Enhancer: adjust brightness, contrast and color balance of input video feed. 
*/
/*TODO:
 - Check validity of Constants beign unsigned
  */



template <PixelType PIXEL_T, unsigned H, unsigned W, StorageType STORAGE = FIFO,
    NumPixelsPerCycle NPPC = NPPC_1>
void ImgEnhance(vision::Img<PIXEL_T, H, W, STORAGE, NPPC> &InImg,
             vision::Img<PIXEL_T, H, W, STORAGE, NPPC> &OutImg,
             unsigned &common_const, unsigned &r_const,unsigned &g_const,
             unsigned &b_const, unsigned &r_mean, unsigned &g_mean, unsigned &b_mean,
             unsigned &r_var, unsigned &g_var, unsigned &b_var) {
    const unsigned ImgHeight = InImg.get_height(), ImgWidth = InImg.get_width();
    OutImg.set_height(ImgHeight);
    OutImg.set_width(ImgWidth);
    const unsigned FrameSize = (ImgHeight * ImgWidth) / NPPC;

    /*NEW: Could be hardcoded? Is log2 not realistic?*/
    /*Log2 rounds down 20,89 => 20 so result mean is about half of real*/
    /* 1080p=> 21 -- 2k => 22  --  4k => 23*/
    /* const unsigned Pixels_to_avg = log2(FrameSize); */
    const unsigned Pixels_to_avg = 21;

    using PixelT = typename DT<PIXEL_T, NPPC>::T;
    const unsigned ChannelWidth = DT<PIXEL_T, NPPC>::PerChannelPixelWidth;
    using ChannelT = ap_int<ChannelWidth + 3>;


    /*NEW =>*/
    using ChannelSumT = ap_int<ChannelWidth * 4>;

    ChannelSumT r_sum = ChannelSumT(0);
    ChannelSumT g_sum = ChannelSumT(0);
    ChannelSumT b_sum = ChannelSumT(0);
    ChannelSumT r_absdiff = ChannelSumT(0);
    ChannelSumT g_absdiff = ChannelSumT(0);
    ChannelSumT b_absdiff = ChannelSumT(0);

    ChannelT r_out, g_out, b_out;

    /* <= NEW */
    #pragma HLS loop pipeline
    for (unsigned ImgIdx = 0; ImgIdx < FrameSize; ImgIdx++) {
        PixelT InPixelWord = InImg.read(ImgIdx);
        PixelT TmpPixelWord;
        for (int k = 0; k < NPPC; k++){
            // For a NPPC of 4 the pixel is the shape of
            // R-G-B / R-G-B / R-G-B / R-G-B 
            ChannelT r = InPixelWord.byte(3*k,ChannelWidth),
                     g = InPixelWord.byte(3*k+1,ChannelWidth),
                     b = InPixelWord.byte(3*k+2,ChannelWidth);
            ChannelT    r_fixpt = r,
                        g_fixpt = g,
                        b_fixpt = b,
                        r_const_fixpt = r_const,
                        g_const_fixpt = g_const,
                        b_const_fixpt = b_const,
                        common_const_fixpt = common_const;
            /* ChannelT  */
                    r_out = ((common_const_fixpt + r_const_fixpt)*r_fixpt) >> 7;
                    g_out = ((common_const_fixpt + g_const_fixpt)*g_fixpt) >> 7;
                    b_out = ((common_const_fixpt + b_const_fixpt)*b_fixpt) >> 7;

            /* 255 Value for 8 bits channel*/
            const ChannelT MaxChannelVal = ChannelT(255);

            r_out = (r_out > MaxChannelVal) ? MaxChannelVal : r_out;
            g_out = (g_out > MaxChannelVal) ? MaxChannelVal : g_out;
            b_out = (b_out > MaxChannelVal) ? MaxChannelVal : b_out;
            
            TmpPixelWord.byte(3*k,ChannelWidth) = r_out;
            TmpPixelWord.byte(3*k+1,ChannelWidth) = g_out;
            TmpPixelWord.byte(3*k+2,ChannelWidth) = b_out;
        }
        OutImg.write(TmpPixelWord,ImgIdx);

        /*NEW =>*/
        r_sum = r_sum + r_out;
        g_sum = g_sum + g_out;
        b_sum = b_sum + b_out; 
        /* Mean only updated once per img? CL: 104 in vhdl*/
        ChannelSumT r_abs = (r_mean-r_out < 0 ) ? r_out-r_mean : r_mean-r_out;
        ChannelSumT g_abs = (g_mean-g_out < 0 ) ? g_out-g_mean : g_mean-g_out;
        ChannelSumT b_abs = (b_mean-b_out < 0 ) ? b_out-b_mean : b_mean-b_out;
        r_absdiff = r_absdiff + r_abs;
        g_absdiff = g_absdiff + g_abs;
        b_absdiff = b_absdiff + b_abs;
/* 
        if (ImgIdx == 1) {
            std::cout << "r_sum_IDX960 = " << r_sum.to_string(10) << std::endl;
            std::cout << "g_sum_IDX960 = " << g_sum.to_string(10) << std::endl;
            std::cout << "b_sum_IDX960 = " << b_sum.to_string(10) << std::endl;
            std::cout << "r_absdiff_IDX960 = " << r_absdiff.to_string(10) << std::endl;
            std::cout << "g_absdiff_IDX960 = " << g_absdiff.to_string(10) << std::endl;
            std::cout << "b_absdiff_IDX960 = " << b_absdiff.to_string(10) << std::endl;
        }else if(ImgIdx == 1000){
            std::cout << "r_sum_IDX0 = " << r_sum.to_string(10) << std::endl;
            std::cout << "g_sum_IDX0 = " << g_sum.to_string(10) << std::endl;
            std::cout << "b_sum_IDX0 = " << b_sum.to_string(10) << std::endl;
            std::cout << "r_absdiff_IDX0 = " << r_absdiff.to_string(10) << std::endl;
            std::cout << "g_absdiff_IDX0 = " << g_absdiff.to_string(10) << std::endl;
            std::cout << "b_absdiff_IDX0 = " << b_absdiff.to_string(10) << std::endl;
        } */
        /* <= NEW*/
    }
    /*NEW*/
    r_mean = r_sum >> Pixels_to_avg;
    g_mean = g_sum >> Pixels_to_avg;
    b_mean = b_sum >> Pixels_to_avg;

    r_var = r_absdiff >> Pixels_to_avg;
    g_var = g_absdiff >> Pixels_to_avg;
    b_var = b_absdiff >> Pixels_to_avg;
/* 
    std::cout << "r_sum_Final = " << r_sum.to_string(10) << std::endl;
    std::cout << "g_sum_Final = " << g_sum.to_string(10) << std::endl;
    std::cout << "b_sum_Final = " << b_sum.to_string(10) << std::endl; */

    /*std::cout << "r_mean = " << r_mean << std::endl;
    std::cout << "g_mean = " << g_mean << std::endl;
    std::cout << "b_mean = " << b_mean << std::endl;

    std::cout << "r_var = " << r_var << std::endl;
    std::cout << "g_var = " << g_var << std::endl;
    std::cout << "b_var = " << b_var << std::endl; */


}

} // end of namespace vision
} // end of namespace hls
#endif 