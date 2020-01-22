include Makefile.platform
include Makefile.ndll

PROJECT=nMagick

ifeq ($(PLATFORM),Windows64)
	WIN_MAGICK_PATH = D:\devel\ImageMagick-6.9.10-Q16-HDRI\x64
	NEKOPATH = D:\devel\neko-win64

	CCFLAGS+= -I$(WIN_MAGICK_PATH)\include
	LDFLAGS+= $(WIN_MAGICK_PATH)\lib\CORE_RL_wand_.lib

else ifeq ($(PLATFORM),Windows)
	WIN_MAGICK_PATH = D:\devel\ImageMagick-6.9.10-Q16-HDRI\x86
	NEKOPATH = D:\devel\neko

	CC=i686-w64-mingw32-gcc

	CCFLAGS+= -I$(WIN_MAGICK_PATH)\include
	LDFLAGS+= $(WIN_MAGICK_PATH)\lib\CORE_RL_wand_.lib

else
	CCFLAGS+= $(shell pkg-config --cflags MagickWand) -m$(MARCH)
	LDFLAGS+= $(shell pkg-config --libs MagickWand)
endif 

