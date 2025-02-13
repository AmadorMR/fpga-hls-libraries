#include "../../include/vision.hpp"
#include <opencv2/opencv.hpp>

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
#endif
#define SIZE (WIDTH * HEIGHT)

template <vision::PixelType PIXEL_T_IN, vision::PixelType PIXEL_T_OUT,
          unsigned H, unsigned W, vision::StorageType STORAGE_IN,
          vision::StorageType STORAGE_OUT, vision::NumPixelsPerCycle NPPC_IN,
          vision::NumPixelsPerCycle NPPC_OUT>
void hlsSobel(Img<PIXEL_T_IN, H, W, STORAGE_IN, NPPC_IN> &InImg,
              Img<PIXEL_T_OUT, H, W, STORAGE_OUT, NPPC_OUT> &OutImg) {
#pragma HLS function top
    vision::Sobel<3>(InImg, OutImg);
}

//  Use OpenCV's Sobel as reference.
void cvSobel(cv::Mat &InMat, cv::Mat &OutMat) {
    // Compute x- and y-direction gradiations first.
    Mat CvGx, CvGy;
    cv::Sobel(InMat, CvGx, CV_16S, 1, 0, 3, 1, 0, cv::BORDER_CONSTANT);
    cv::Sobel(InMat, CvGy, CV_16S, 0, 1, 3, 1, 0, cv::BORDER_CONSTANT);

    // Then combine the absolute values of the X/Y gradients.
    Mat CvGxAbs, CvGyAbs;
    CvGxAbs = cv::abs(CvGx);
    CvGyAbs = cv::abs(CvGy);
    cv::add(CvGxAbs, CvGyAbs, OutMat);
}

int main() {
    // Load image from file, using OpenCV's imread function.
    Mat InMat = cv::imread(INPUT_IMAGE, cv::IMREAD_GRAYSCALE);

    /*
     * Call the SmartHLS top-level function and the OpenCV reference function,
     * and compare the 2 results.
     */
    // 1. SmartHLS result
    // First, convert the OpenCV `Mat` into `Img`.
    Img<vision::PixelType::HLS_8UC1, HEIGHT, WIDTH, vision::StorageType::FIFO,
        vision::NPPC_1>
        InImg;
    Img<vision::PixelType::HLS_16SC1, HEIGHT, WIDTH, vision::StorageType::FIFO,
        vision::NPPC_1>
        OutImg;
    convertFromCvMat(InMat, InImg);
    // Then, call the SmartHLS top-level function.
    hlsSobel(InImg, OutImg);
    // Finally, convert the `Img` back to OpenCV `Mat`.
    Mat HlsOutMat_16SC1, HlsOutMat_8UC1;
    convertToCvMat(OutImg, HlsOutMat_16SC1);
    HlsOutMat_16SC1.convertTo(HlsOutMat_8UC1, CV_8UC1);

    // 2. OpenCV result
    Mat CvOutMat;
    cvSobel(InMat, CvOutMat);
    cv::convertScaleAbs(CvOutMat, CvOutMat);

    // 3. Print the HlsOutMat_8UC1 and CvOutMat as pictures for reference.
    cv::imwrite("hls_output.bmp", HlsOutMat_8UC1);
    cv::imwrite("cv_output.bmp", CvOutMat);

    // 4. Compare the SmartHLS result and the OpenCV result.
    // Use this commented out line to report location of errors.
    // vision::compareMatAndReport<unsigned char>(HlsOutMat_8UC1, CvOutMat, 0);
    float ErrPercent = vision::compareMat(HlsOutMat_8UC1, CvOutMat, 0);
    printf("Percentage of over threshold: %0.2lf%\n", ErrPercent);

    return ErrPercent;
}
