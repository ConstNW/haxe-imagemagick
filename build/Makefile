ifeq ($(shell getconf LONG_BIT),64)
	PLATFORM=Linux64
else
	PLATFORM=Linux
endif

SRC_DIR=src
OBJ_DIR=obj

OBJS=$(OBJ_DIR)/nMagick.o $(OBJ_DIR)/PixelWand.o $(OBJ_DIR)/DrawingWand.o

OUT=../library/ndll/$(PLATFORM)/nMagick.ndll

CC=gcc

CCFLAGS=-shared -fPIC -I/usr/include/ImageMagick
LDFLAGS=-shared -lneko -lMagickWand

build: $(OBJS)
	$(CC) $(OBJS) -o $(OUT) $(LDFLAGS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CCFLAGS) -c -o $@ $<

clean:
	rm -f $(OBJS)
	rm -f $(OUT)

all: clean build
