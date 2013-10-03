include Makefile.platform
include Makefile.ndll

PROJECT=nMagick

ifeq ($(PLATFORM),Windows)
	CCFLAGS+= -I D:\MyProg\_tools\ImageMagick
	LDFLAGS+= D:\MyProg\_tools\ImageMagick\VisualMagick\lib\CORE_RL_wand_.lib 
else
	CCFLAGS+= -I/usr/include/ImageMagick
	LDFLAGS+= -lMagickWand
endif 

