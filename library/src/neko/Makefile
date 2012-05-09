OBJS	= nMagick.o PixelWand.o DrawingWand.o
CC	= gcc
CFLAGS	= -fPIC -I/usr/lib/neko/include -I/usr/include/ImageMagick
LDFLAGS = -shared -lneko -lMagickWand

nMagick.ndll: $(OBJS)
	$(CC) $(LDFLAGS) -o nMagick.ndll $(OBJS)

clean:
	rm -f $(OBJS)
	rm -rf nMagick.ndll
