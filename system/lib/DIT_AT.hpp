#ifndef _DIT_AT_HPP
#define _DIT_AT_HPP

#include "AT/xditk_AT_Export.h"
#include "AT/DIT_AT_Types.hpp"
#include "stdlib.h"
//#include <string>



class xditk_AT_EXPORT DIT_AT
{
	public:

		DIT_AT( int max_aligned_width, int max_aligned_height, int binfile = -1, int project=0, int sku=0, int mode = 0);

		~DIT_AT();

        void DIT_AT_init(int project, int modulenum, int cameradirection, int mode);

		GetSceneDetectPara dit_SceneDetect( dit_PixelMasterInfo *PM_Info ); 

		bool dit_PostProcess( dit_PixelMasterInfo *PM_Info, GetSceneDetectPara *SceneDetectResult = NULL);
		
		void test_run(unsigned char* irgb,unsigned char* orgb,int w, int h,  float y, float s, float c,float yd,float cd,float ys,float ss,float cs, 
            float NR_S_Flag, float NR_S_Fwt, float NR_S_Fth, float sat, float pgain, float shp, float bkl, float ctr, int wdr);
	
        //void test_run(unsigned char* irgb,unsigned char* orgb,int w, int h,  float y, float s, float c, float NR_S_Flag,float yd,float cd,float ys,float ss,float cs, float *tonetbl, float shp);

		void releaseimagememory();

    private:
		
		void CheckDebugMode();
		void ASUS_3D_Denoise( int  IWidth,
							  int  IHeight,
						      int  aligned_IWidth,
							  int  aligned_IHeight,
							  unsigned char* pYUV_in_Buffer0,
							  unsigned char* pYUV_in_Buffer1,
							  unsigned char* pYUV_in_Buffer2,
							  unsigned char* pYUV_out_Buffer,
						      int   intensity,
							  int   lightintensity
							 );

		void ASUS_HDR3( int  IWidth,
						int  IHeight,
						int  aligned_IWidth,
						int  aligned_IHeight,
						unsigned char* pYUV_in_BufferPosEV,
						unsigned char* pYUV_in_Buffer0EV,
						unsigned char* pYUV_in_BufferNegEV,
						unsigned char* pYUV_out_Buffer,
						int    brightness,
						int    tonemapping
						);
};
#endif