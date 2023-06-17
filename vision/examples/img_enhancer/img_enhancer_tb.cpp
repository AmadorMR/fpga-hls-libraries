#include "../../include/vision.hpp"
#include <opencv2/core/matx.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/opencv.hpp>
#include <string>

using namespace std;
using namespace cv;
using namespace hls;
using cv::Mat;
using vision::Img;

// #define SMALL_TEST_FRAME // for faster simulation.
#ifdef SMALL_TEST_FRAME
#define WIDTH 100
#define HEIGHT 56
#define INPUT_IMAGE "toronto_100x56.bmp"
#else
#define WIDTH 1920
#define HEIGHT 1080
#define INPUT_IMAGE "toronto_1080p.bmp"
#define GOLDEN_IMGAE "Golden.png"
#endif
#define SIZE (WIDTH * HEIGHT)

// We have to create a top-level function here even though the function simply
// calls vision::ImgEnhance. This is required by our CoSim flow.
template <vision::PixelType PIXEL_T_I, vision::PixelType PIXEL_T_O,
          unsigned H, unsigned W, vision::StorageType STORAGE_I,
          vision::StorageType STORAGE_O, vision::NumPixelsPerCycle NPPC>
void hlsImgEnhance(Img<PIXEL_T_I, H, W, STORAGE_I, NPPC> &ImgIn,
              Img<PIXEL_T_O, H, W, STORAGE_O, NPPC> &ImgOut,
              unsigned &common_const, unsigned &r_const,unsigned &g_const,
              unsigned &b_const, unsigned &r_mean, unsigned &g_mean, unsigned &b_mean,
              unsigned &r_var, unsigned &g_var, unsigned &b_var) {
#pragma HLS function top
    vision::ImgEnhance(ImgIn, ImgOut, common_const, r_const, g_const, b_const,
    r_mean, g_mean, b_mean, r_var, g_var, b_var);
}

//  Use OpenCV's convertScaleAbs as reference.
void cvImgEnhance(cv::Mat &InMat, cv::Mat &OutMat, unsigned alpha, 
    unsigned beta) {
    cv::convertScaleAbs(InMat, OutMat, alpha, beta);
}

int main() {
    // Load image from file, using OpenCV's imread function.
    Mat BGRInMat = cv::imread(INPUT_IMAGE, cv::IMREAD_COLOR);
    Mat GoldenBGRInMat = cv::imread(GOLDEN_IMGAE, cv::IMREAD_COLOR);
    // By default, OpenCV reads and write image in BGR format, so let's convert
    // to the more traditional RGB format.
    Mat RGBInMat;
    Mat GoldenRGBInMat;
    cv::cvtColor(BGRInMat, RGBInMat, cv::COLOR_BGR2RGB);
    cv::cvtColor(GoldenBGRInMat, GoldenRGBInMat, cv::COLOR_BGR2RGB);
    /*
     * Call the SmartHLS top-level function and the OpenCV reference function,
     * and compare the 2 results.
     */
    // 1. SmartHLS result
    // First, convert the OpenCV `Mat` into `Img`.
    Img<vision::PixelType::HLS_8UC3, HEIGHT, WIDTH, vision::StorageType::FIFO,
        vision::NPPC_4>
        HlsInImg;
    Img<vision::PixelType::HLS_8UC3, HEIGHT, WIDTH, vision::StorageType::FIFO,
        vision::NPPC_4>
        HlsOutImg;
    convertFromCvMat(RGBInMat, HlsInImg);
    // Then, call the SmartHLS top-level function.
    /* PROVISIONAL: First we need to calculate the values of the const from 
        the brightness and constrast values: 
        the OpenCV funct has a form of: beta + alpha*f(i,j) 
        really similar to our ImgEnhance but only capable of 
        modifying all three RGB at the same time */
    unsigned alpha = 2;
    unsigned beta = 0;

    unsigned hls_c_c = 1;

    unsigned hls_r_c = 3;
    unsigned hls_g_c = 1;
    unsigned hls_b_c = 1;
    unsigned r_mean;
    unsigned g_mean;
    unsigned b_mean;
    unsigned r_var;
    unsigned g_var;
    unsigned b_var;
    
    /* TO DO: change manually and individually each const for RGB
    and see if result changes in the .png*/
    hlsImgEnhance(HlsInImg, HlsOutImg, hls_c_c, hls_r_c, hls_g_c, hls_b_c,
                    r_mean, g_mean, b_mean, r_var, g_var, b_var);
    // Finally, convert the `Img` back to OpenCV `Mat`.
    Mat HlsOutMat;
    convertToCvMat(HlsOutImg, HlsOutMat);

    // 2. OpenCV result
    Mat CvOutMat;
    cvImgEnhance(RGBInMat, CvOutMat, alpha, beta);

    // 4. Transform back to BGR before writting because imwrite uses BGR too
    Mat CvOutMatBGR;
    cv::cvtColor(CvOutMat, CvOutMatBGR, cv::COLOR_RGB2BGR);
    Mat HlsOutMatBGR;
    cv::cvtColor(HlsOutMat, HlsOutMatBGR, cv::COLOR_RGB2BGR);
    // 3. Print the HlsOutMat and CvOutMat as pictures for reference.
    cv::imwrite("hls_output.png", HlsOutMatBGR);
    cv::imwrite("cv_output.png", CvOutMatBGR);

    
    // 4. Compare the SmartHLS result and the OpenCV result.
    // Use this commented out line to report location of errors.
    //   vision::compareMatAndReport<unsigned char>(HlsOutMat, CvOutMat, 0);

    float ErrPercent = vision::compareMat(HlsOutMat, CvOutMat, 0);
    printf("Percentage of over threshold: %0.2lf%\n", ErrPercent);

    // Un-comment these lines to compare to the golden image previously generated
    float ErrPercentGolden = vision::compareMat(HlsOutMat, GoldenRGBInMat, 0);
    printf("Percentage of over threshold for Golden Img: %0.2lf%\n", ErrPercentGolden);

    return ErrPercentGolden;
}
