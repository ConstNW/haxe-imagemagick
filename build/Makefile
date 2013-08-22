OUT=../library/ndll/Linux/nMagick.ndll
OBJS=nMagick.o PixelWand.o DrawingWand.o
CC=gcc
CFLAGS=-shared -fPIC -I/usr/lib/neko/include -I/usr/include/ImageMagick
LDFLAGS=-shared -lneko -lMagickWand

nMagick.ndll: $(OBJS)
	$(CC) $(LDFLAGS) -o $(OUT) $(OBJS)

clean:
	rm -f $(OBJS)
	rm -rf $(OUT)
