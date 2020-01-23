/*
 * @author Lee McColl Sylvester - lee@designrealm.co.uk
 *
 * Copyright (c) 2005, The haXe Project Contributors
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *   - Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   - Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE HAXE PROJECT CONTRIBUTORS "AS IS" AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE HAXE PROJECT CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
 * DAMAGE.
 */

#if _WINDOWS
	#include <windows.h>
#endif

#include "nMagick.h"

DEFINE_KIND(k_wand);
DEFINE_KIND(k_draw);
DEFINE_KIND(k_pixel);

value *exception_handler = NULL;

static value set_exception_handler(value f)
{
	val_check_function(f, 1); // checks that f has 1 argument
	if (exception_handler == NULL)
		exception_handler = alloc_root(1);
	*exception_handler = f;
	return val_null;
}

value throwWandException(MagickWand* wand)
{
	char *description;
	ExceptionType severity;
	description = MagickGetException(wand, &severity);
	if (exception_handler == NULL)
	{
		(void) fprintf(stderr, "%s %s %ld %s\n", GetMagickModule(), description);
		description = (char *) MagickRelinquishMemory(description);
		exit(-1);
	}
	else
	{
		return val_call1(*exception_handler, alloc_string(description));
	}
}

// ====================================================================================

value nMagick_clear(value magick)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	
	wand = WAND(magick);

	ClearMagickWand(wand);
	
	return val_true;
}

void nMagick_finalize(value magick)
{
	DestroyMagickWand(WAND(magick));
}

value nMagick_destroy(value magick)
{
	val_check_kind(magick, k_wand);
	val_gc(magick, NULL);
	nMagick_finalize(magick);
	return val_true;
}

value nMagick_init()
{
	value v;
	MagickWand *magick_wand;

	magick_wand = NewMagickWand();

	v = alloc_abstract(k_wand, magick_wand);
	val_gc(v, nMagick_finalize);
	return v;
}

value nMagick_new(value magick, value columns, value rows, value background)
{
	MagickWand *wand;
	PixelWand *bg;

	val_check_kind(magick, k_wand);
	val_check_kind(background, k_pixel);
	val_check(columns, int);
	val_check(rows, int);

	wand = WAND(magick);
	bg = PIXEL(background);

	while(MagickGetNumberImages(wand) > 0)
		MagickRemoveImage(wand);

	return alloc_bool(MagickNewImage(wand, val_int(columns), val_int(rows), bg));
}

value nMagick_load(value magick, value image)
{
	MagickWand *wand;
	MagickBooleanType status;

	val_check_kind(magick, k_wand);
	val_check(image, string);

	wand = WAND(magick);

	while(MagickGetNumberImages(wand) > 0)
		MagickRemoveImage(wand);

	status = MagickReadImage(wand, val_string(image));
	if (status == MagickFalse)
		throwWandException(wand);

	return val_true;
}

value nMagick_save(value magick, value file)
{
	MagickWand *wand;
	MagickBooleanType status;

	val_check_kind(magick, k_wand);
	val_check(file, string);

	wand = WAND(magick);

	status = MagickWriteImages(wand, val_string(file), MagickTrue);
	if (status == MagickFalse)
		throwWandException(wand);

	return val_true;
}

value nMagick_resize(value magick, value w, value h, value filter, value blur)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(w, int);
	val_check(h, int);
	val_check(filter, int);
	val_check(blur, number);

	wand = WAND(magick);
	return alloc_bool(MagickResizeImage(wand, val_int(w), val_int(h), val_int(filter), val_number(blur)));
}

value nMagick_adaptive_sharpen(value magick, value radius, value sigma)
{
	MagickWand *wand;
	double r, s;

	val_check_kind(magick, k_wand);
	val_check(radius, number);
	val_check(sigma, number);

	r = val_number(radius);
	s = val_number(sigma);

	wand = WAND(magick);
	return alloc_bool(MagickAdaptiveSharpenImage(wand, r, s));
}

value nMagick_adaptive_threshold(value magick, value width, value height, value offset)
{
	val_check_kind(magick, k_wand);
	val_check(width, int);
	val_check(height, int);
	val_check(offset, int);

	return alloc_bool((BOOL)MagickAdaptiveThresholdImage(WAND(magick), val_int(width), val_int(height), val_int(offset)));
}

value nMagick_add_image(value magick, value magick2)
{
	val_check_kind(magick, k_wand);
	val_check_kind(magick2, k_wand);

	MagickWand *wand = WAND(magick);
	MagickWand *wand2 = WAND(magick2);
	return alloc_bool(MagickAddImage(wand, wand2));
}

value nMagick_add_noise(value magick, value noise_type)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(noise_type, int);

	wand = WAND(magick);
	return alloc_bool(MagickAddNoiseImage(wand, (NoiseType)val_int(noise_type)));
}

value nMagick_affine_transform(value magick, value draw_magick)
{
	MagickWand *wand;
	DrawingWand *drawing_wand;

	val_check_kind(magick, k_wand);
	val_check_kind(draw_magick, k_draw);

	wand = WAND(magick);
	drawing_wand = DRAW(draw_magick);
	return alloc_bool(MagickAffineTransformImage(wand, drawing_wand));
}

value nMagick_annotate(value magick, value draw_magick, value point, value angle, value text)
{
	MagickWand *wand;
	DrawingWand *drawing_wand;
	double a;

	val_check_kind(magick, k_wand);
	val_check_kind(draw_magick, k_draw);
	val_check(point, object);
	val_check(angle, int);
	val_check(text, string);

	a = (double)val_int(angle);

	wand = WAND(magick);
	drawing_wand = DRAW(draw_magick);
	
	return alloc_bool(MagickAnnotateImage(wand, drawing_wand, val_int(val_field(point, val_id("x" ) ) ), val_int( val_field( point, val_id( "y"))), a, val_string(text)));
}

value nMagick_black_threshold(value magick, value threshold)
{
	MagickWand *wand;
	PixelWand *th;

	val_check_kind(magick, k_wand);
	val_check_kind(threshold, k_pixel);
	
	wand = WAND(magick);
	th = PIXEL(threshold);
	
	return alloc_bool(MagickBlackThresholdImage(wand, th));
}

value nMagick_blur(value magick, value radius, value sigma)
{
	MagickWand *wand;
	double r, s;

	val_check_kind(magick, k_wand);
	val_check(radius, int);
	val_check(sigma, int);

	r = (double)val_int(radius);
	s = (double)val_int(sigma);

	wand = WAND(magick);

	return alloc_bool(MagickBlurImage(wand, r, s));
}

value nMagick_border(value magick, value bordercolor, value width, value height)
{
	MagickWand *wand;
	PixelWand *border;

	val_check_kind(magick, k_wand);
	val_check_kind(bordercolor, k_pixel);
	val_check(width, int);
	val_check(height, int);
	
	wand = WAND(magick);
	border = PIXEL(bordercolor);
	
	return alloc_bool(MagickBorderImage(wand, border, val_int(width), val_int(height)));
}

value nMagick_charcoal(value magick, value radius, value sigma)
{
	MagickWand *wand;
	double r, s;
	
	val_check_kind(magick, k_wand);
	val_check(radius, int);
	val_check(sigma, int);

	r = (double)val_int(radius);
	s = (double)val_int(sigma);

	wand = WAND(magick);

	return alloc_bool(MagickCharcoalImage(wand, r, s));
}

value nMagick_chop(value magick, value width, value height, value point)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(point, object);
	val_check(width, int);
	val_check(height, int);

	wand = WAND(magick);
	
	return alloc_bool(MagickChopImage(wand, val_int(width), val_int(height), val_int(val_field(point, val_id("x" ) ) ), val_int( val_field( point, val_id( "y")))));
}

value nMagick_colorfloodfill(value magick, value fill, value fuzz, value bordercolor, value point)
{
	MagickWand *wand;
	PixelWand *fl;
	PixelWand *border;

	val_check_kind(magick, k_wand);
	val_check_kind(fill, k_pixel);
	val_check_kind(bordercolor, k_pixel);
	val_check(point, object);
	val_check(fuzz, number);

	wand = WAND(magick);
	fl = PIXEL(fill);
	border = PIXEL(bordercolor);

	return alloc_bool(MagickColorFloodfillImage(wand, fl, val_number(fuzz), border, val_int(val_field(point, val_id("x" ) ) ), val_int( val_field( point, val_id( "y")))));
}

value nMagick_colorize(value magick, value colorize, value opacity)
{
	MagickWand *wand;
	PixelWand *c;
	PixelWand *o;

	val_check_kind(magick, k_wand);
	val_check_kind(colorize, k_pixel);
	val_check_kind(opacity, k_pixel);

	wand = WAND(magick);
	c = PIXEL(colorize);
	o = PIXEL(opacity);

	return alloc_bool(MagickColorizeImage(wand, c, o));
}

value nMagick_comment(value magick, value comment)
{
	MagickWand *wand;
	val_check(comment, string);
	val_check_kind(magick, k_wand);
	
	wand = WAND(magick);
	
	return alloc_bool(MagickCommentImage(wand, val_string(comment)));
}

value nMagick_composite(value magick, value composite_wand, value compositeOp, value point)
{
	MagickWand *wand;
	MagickWand *wand2;

	val_check_kind(magick, k_wand);
	val_check_kind(composite_wand, k_wand);
	val_check(compositeOp, int);

	wand = WAND(magick);
	wand2 = WAND(composite_wand);
	return alloc_bool(MagickCompositeImage(wand, wand2, val_int(compositeOp), val_int(val_field(point, val_id("x" ) ) ), val_int( val_field( point, val_id( "y")))));
}

value nMagick_contrast(value magick, value sharpen)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(sharpen, int);

	wand = WAND(magick);

	return alloc_bool(MagickContrastImage(wand, val_int(sharpen)));
}

// TODO : write a function to convert an array of values to an array of doubles
value nMagick_convolve(value magick, value order, value kernel)
{
	MagickWand *wand;
	double kernel_float;

	val_check_kind(magick, k_wand);
	val_check(order, int);
	val_check(kernel, number);

	wand = WAND(magick);
	kernel_float = val_number(kernel);

	return alloc_bool(MagickConvolveImage(wand, val_int(order), &kernel_float));
}

value nMagick_crop(value magick, value width, value height, value point)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(width, int);
	val_check(height, int);
	val_check(point, object);

	wand = WAND(magick);

	return alloc_bool(MagickCropImage(wand, val_int(width), val_int(height), val_int(val_field(point, val_id("x" ) ) ), val_int( val_field( point, val_id( "y")))));
}

value nMagick_despeckle(value magick)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	return alloc_bool(MagickDespeckleImage(wand));
}

value nMagick_draw(value magick, value drawing_wand)
{
	MagickWand *wand;
	DrawingWand *dwand;

	val_check_kind(magick, k_wand);
	val_check_kind(drawing_wand, k_draw);
	
	wand = WAND(magick);
	dwand = DRAW(drawing_wand);
	return alloc_bool(MagickDrawImage(wand, dwand));
}

value nMagick_edge(value magick, value radius)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(radius, number);

	wand = WAND(magick);

	return alloc_bool(MagickEdgeImage(wand, val_number(radius)));
}

value nMagick_emboss(value magick, value radius, value sigma)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(radius, number);
	val_check(sigma, number);

	wand = WAND(magick);
	return alloc_bool(MagickEmbossImage(wand, val_number(radius), val_number(sigma)));
}

value nMagick_enhance(value magick)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	return alloc_bool(MagickEnhanceImage(wand));
}

value nMagick_equalize(value magick)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	return alloc_bool(MagickEqualizeImage(wand));
}

value nMagick_evaluate(value magick, value op, value constant)
{
	MagickWand *wand;
	MagickEvaluateOperator meo;

	val_check_kind(magick, k_wand);
	val_check(op, int);
	val_check(	constant, number);

	wand = WAND(magick);

	return alloc_bool(MagickEvaluateImage(wand, val_int(op), val_number(constant)));
}

value nMagick_flatten(value magick)
{
	MagickWand *wand;
	value v;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	v = alloc_abstract(k_wand, MagickFlattenImages(wand));
	val_gc(v, nMagick_finalize);
	return v;
}

value nMagick_flip(value magick)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	return alloc_bool(MagickFlipImage(wand));
}

value nMagick_flop(value magick)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	return alloc_bool(MagickFlopImage(wand));
}

value nMagick_gamma(value magick, value gamma)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(gamma, number);

	wand = WAND(magick);

	return alloc_bool(MagickGammaImage(wand, val_number(gamma)));
}

value nMagick_gaussian_blur(value magick, value radius, value sigma)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(radius, number);
	val_check(sigma, number);

	wand = WAND(magick);

	return alloc_bool(MagickGaussianBlurImage(wand, val_number(radius), val_number(sigma)));
}

value nMagick_get_region(value magick, value width, value height, value point)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(width, int);
	val_check(height, int);
	val_check(point, object);

	wand = WAND(magick);

	return alloc_abstract(k_wand, MagickGetImageRegion(wand, val_int(width), val_int(height), val_int(val_field(point, val_id("x" ) ) ), val_int( val_field( point, val_id( "y")))));
}

value nMagick_get_background_color(value magick)
{
	MagickWand *wand;
	PixelWand *pw;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	MagickGetImageBackgroundColor(wand, pw);
	return alloc_abstract(k_pixel, pw);
}

value nMagick_set_background_color(value magick, value color)
{
	MagickWand *wand;
	PixelWand *pw;

	val_check_kind(magick, k_wand);
	val_check_kind(color, k_pixel);

	wand = WAND(magick);
	pw = PIXEL(color);

	return alloc_bool(MagickSetImageBackgroundColor(wand, pw));
}

value nMagick_get_blob(value magick)
{
	MagickWand *wand;
	value o;
	int l;
	unsigned char* b;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	b = MagickGetImageBlob(wand, &l);
	o = copy_string(b, l);
	MagickRelinquishMemory(b);

	return o;
}

value nMagick_get_red_primary(value magick)
{
	val_check_kind(magick, k_wand);
	
	double x, y; MagickGetImageRedPrimary(WAND(magick), &x, &y);
	value p = alloc_object(NULL);
	alloc_field(p, val_id("x"), alloc_float(x));
	alloc_field(p, val_id("y"), alloc_float(y));
	return p;
}

value nMagick_set_red_primary(value magick, value point)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(point, object);

	wand = WAND(magick);

	return alloc_bool(MagickSetImageRedPrimary(wand, val_number(val_field(point, val_id("x" ) ) ), val_number( val_field( point, val_id( "y")))));
}

value nMagick_get_green_primary(value magick)
{
	val_check_kind(magick, k_wand);
	
	double x, y; MagickGetImageGreenPrimary(WAND(magick), &x, &y);
	value p = alloc_object(NULL);
	alloc_field(p, val_id("x"), alloc_float(x));
	alloc_field(p, val_id("y"), alloc_float(y));
	return p;
}

value nMagick_set_green_primary(value magick, value point)
{
	val_check_kind(magick, k_wand);
	val_check(point, object);

	return alloc_bool(MagickSetImageGreenPrimary(WAND(magick), val_number(val_field(point, val_id("x" ) ) ), val_number( val_field( point, val_id( "y")))));
}

value nMagick_get_blue_primary(value magick)
{
	val_check_kind(magick, k_wand);
	
	double x, y; MagickGetImageBluePrimary(WAND(magick), &x, &y);
	value p = alloc_object(NULL);
	alloc_field(p, val_id("x"), alloc_float(x));
	alloc_field(p, val_id("y"), alloc_float(y));
	return p;
}

value nMagick_set_blue_primary(value magick, value point)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(point, object);

	wand = WAND(magick);

	return alloc_bool(MagickSetImageBluePrimary(wand, val_number(val_field(point, val_id("x" ) ) ), val_number( val_field( point, val_id( "y")))));
}

value nMagick_get_border_color(value magick)
{
	MagickWand *wand;
	PixelWand *pw;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	MagickGetImageBorderColor(wand, pw);
	return alloc_abstract(k_pixel, pw);
}

value nMagick_set_border_color(value magick, value border_color)
{
	MagickWand *wand;
	PixelWand *pw;

	val_check_kind(magick, k_wand);
	val_check_kind(border_color, k_pixel);

	wand = WAND(magick);
	pw = PIXEL(border_color);

	return alloc_bool(MagickSetImageBorderColor(wand, pw));
}

value nMagick_get_colormap_color(value magick, value index, value color)
{
	val_check_kind(magick, k_wand);
	val_check_kind(color, k_pixel);
	val_check(index, int);
	
	return alloc_bool(MagickGetImageColormapColor(WAND(magick), val_int(index), PIXEL(color)));
}

value nMagick_set_colormap_color(value magick, value index, value color)
{
	val_check_kind(magick, k_wand);
	val_check_kind(color, k_pixel);
	val_check(index, int);

	return alloc_bool(MagickSetImageColormapColor(WAND(magick), val_int(index), PIXEL(color)));
}

value nMagick_get_colors_length(value magick)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	return alloc_int(MagickGetImageColors(wand));
}

value nMagick_get_colorspace(value magick)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	return alloc_int(MagickGetImageColorspace(wand));
}

value nMagick_set_colorspace(value magick, value colorspace)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(colorspace, int);

	wand = WAND(magick);

	return alloc_bool(MagickSetImageColorspace(wand, val_int(colorspace)));
}

value nMagick_get_composite(value magick)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	return alloc_int(MagickGetImageCompose(wand));
}

value nMagick_set_composite(value magick, value composite)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(composite, int);

	wand = WAND(magick);

	return alloc_bool(MagickSetImageCompose(wand, val_int(composite)));
}

value nMagick_get_compression(value magick)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	return alloc_int(MagickGetImageCompression(wand));
}

value nMagick_set_compression(value magick, value compression)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(compression, int);

	wand = WAND(magick);

	return alloc_bool(MagickSetImageCompression(wand, val_int(compression)));
}

value nMagick_set_compression_quality(value magick, value quality)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(quality, int);

	wand = WAND(magick);

	return alloc_bool(MagickSetImageCompressionQuality(wand, val_int(quality)));
}

value nMagick_get_depth(value magick)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	return alloc_int(MagickGetImageDepth(wand));
}

value nMagick_set_depth(value magick, value depth)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	return alloc_bool(MagickSetImageDepth(wand, val_int(depth)));
}

value nMagick_get_distortion(value magick, value reference, value metric)
{
	val_check_kind(magick, k_wand);
	val_check_kind(reference, k_wand);
	val_check(metric, int);

	double dist;
	if (!MagickGetImageDistortion(WAND(magick), WAND(reference), val_int(metric), &dist)) return val_null;
	return alloc_float(dist);
}

value nMagick_get_extrema(value magick)
{
	MagickWand *wand;
	unsigned int *min, *max;
	value point = alloc_object(NULL);

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	if (!MagickGetImageExtrema(wand, min, max))
		return val_null;

	alloc_field(point, val_id("x"), alloc_int(min));
	alloc_field(point, val_id("y"), alloc_int(max));

	return point;
}

value nMagick_get_dispose(value magick)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	return alloc_int(MagickGetImageDispose(wand));
}

value nMagick_get_attribute(value magick, value key)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(key, string);

	wand = WAND(magick);

	return alloc_string(MagickGetImageAttribute(wand, val_string(key)));
}

value nMagick_set_attribute(value magick, value key, value attrib)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(key, string);
	val_check(attrib, string);

	wand = WAND(magick);

	return alloc_bool(MagickSetImageAttribute(wand, val_string(key), val_string(attrib)));
}

value nMagick_get_format(value magick)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	return alloc_string(MagickGetImageFormat(wand));
}

value nMagick_set_format(value magick, value format)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(format, string);

	wand = WAND(magick);

	return alloc_bool(MagickSetImageFormat(wand, val_string(format)));
}

value nMagick_get_gamma(value magick)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	return alloc_float(MagickGetImageGamma(wand));
}

value nMagick_set_gamma(value magick, value gamma)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(gamma, number);

	wand = WAND(magick);

	return alloc_bool(MagickSetImageGamma(wand, val_number(gamma)));
}


/*value nMagick_get_histogram(value magick, value num_colors)
{
	MagickWand *wand;
	value v;

	val_check_kind(magick, k_wand);
	val_check(num_colors, int);

	wand = WAND(magick);

	v = alloc_abstract(k_pixel, MagickGetImageHistogram(wand, val_int(num_colors)));
	val_gc(v, nMagick_pixel_close);
	return v;
}*/


value nMagick_get_interlace_scheme(value magick)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	return alloc_int(MagickGetImageInterlaceScheme(wand));
}

value nMagick_set_interlace_scheme(value magick, value interlace)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(interlace, int);

	wand = WAND(magick);

	return alloc_int(MagickSetImageInterlaceScheme(wand, val_int(interlace)));
}

value nMagick_get_matte(value magick)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	return alloc_bool(MagickGetImageMatte(wand) == MagickTrue);
}

value nMagick_set_matte(value magick, value matte)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(matte, bool);

	wand = WAND(magick);

	return alloc_bool(MagickSetImageMatte(wand, val_bool(matte)));
}

value nMagick_get_matte_color(value magick)
{
	MagickWand *wand;
	PixelWand *mc;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	MagickGetImageMatteColor(wand, mc);
	return alloc_abstract(k_pixel, mc);
}

value nMagick_set_matte_color(value magick, value matte_color)
{
	MagickWand *wand;
	PixelWand *mc;

	val_check_kind(magick, k_wand);
	val_check_kind(matte_color, k_pixel);

	wand = WAND(magick);
	mc = PIXEL(matte_color);

	return alloc_bool(MagickSetImageMatteColor(wand, mc));
}

value nMagick_get_pixel_color(value magick, value point)
{
	MagickWand *wand;
	PixelWand *pc;

	val_check_kind(magick, k_wand);
	val_check(point, object);

	wand = WAND(magick);

	MagickGetImagePixelColor(wand, val_int(val_field(point, val_id("x" ) ) ), val_int( val_field( point, val_id( "y"))), pc);
	return alloc_abstract(k_pixel, pc);
}

value nMagick_get_rendering_intent(value magick)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	return alloc_bool(MagickGetImageRenderingIntent(wand));
}

value nMagick_set_rendering_intent(value magick, value rendering)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(rendering, int);

	wand = WAND(magick);

	return alloc_bool(MagickSetImageRenderingIntent(wand, val_int(rendering)));
}

value nMagick_get_resolution(value magick)
{
	MagickWand *wand;
	double x, y;
	value point = alloc_object(NULL);

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	if (!MagickGetImageResolution(wand, &x, &y))
		return val_null;
	
	alloc_field(point, val_id("x"), alloc_float(x));
	alloc_field(point, val_id("y"), alloc_float(y));

	return point;
}

value nMagick_set_resolution(value magick, value x, value y)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(x, int);
	val_check(y, int);

	wand = WAND(magick);

	return alloc_bool(MagickSetImageResolution(wand, val_int(x), val_int(y)));
}

value nMagick_get_size(value magick)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	return alloc_int(MagickGetImageSize(wand));
}

value nMagick_get_type(value magick)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	return alloc_int(MagickGetImageType(wand));
}

value nMagick_set_type(value magick, value type)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(type, int);

	wand = WAND(magick);

	return alloc_bool(MagickSetImageType(wand, val_int(type)));
}

value nMagick_get_units(value magick)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	return alloc_int(MagickGetImageUnits(wand));
}

value nMagick_set_units(value magick, value units)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(units, int);

	wand = WAND(magick);

	return alloc_bool(MagickSetImageUnits(wand, val_int(units)));
}

value nMagick_get_white_point(value magick)
{
	MagickWand *wand;
	double x, y;
	value point = alloc_object(NULL);

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	if (!MagickGetImageWhitePoint(wand, &x, &y));
		return val_null;
	
	alloc_field(point, val_id("x"), alloc_float(x));
	alloc_field(point, val_id("y"), alloc_float(y));

	return point;
}

value nMagick_set_white_point(value magick, value x, value y)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(x, int);
	val_check(y, int);

	wand = WAND(magick);

	return alloc_bool(MagickSetImageWhitePoint(wand, val_int(x), val_int(y)));
}

value nMagick_get_width(value magick)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	return alloc_int(MagickGetImageWidth(wand));
}

value nMagick_get_height(value magick)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	return alloc_int(MagickGetImageHeight(wand));
}

value nMagick_implode(value magick, value radius)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(radius, number);

	wand = WAND(magick);

	return alloc_bool(MagickImplodeImage(wand, val_number(radius)));
}

value nMagick_label(value magick, value label)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(label, string);

	wand = WAND(magick);

	return alloc_bool(MagickLabelImage(wand, val_string(label)));
}

value nMagick_level(value magick, value black_point, value gamma, value white_point)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(black_point, number);
	val_check(gamma, number);
	val_check(white_point, number);

	wand = WAND(magick);

	return alloc_bool(MagickLevelImage(wand, val_number(black_point), val_number(gamma), val_number(white_point)));
}

value nMagick_magnify(value magick)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	return alloc_bool(MagickMagnifyImage(wand));
}

value nMagick_map(value magick, value magickb, value dither)
{
	MagickWand *wand;
	MagickWand *map_wand;

	val_check_kind(magick, k_wand);
	val_check_kind(magickb, k_wand);
	val_check(dither, bool);

	wand = WAND(magick);
	map_wand = WAND(magickb);

	return alloc_bool(MagickMapImage(wand, map_wand, val_bool(dither)));
}

value nMagick_median_filter(value magick, value radius)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(radius, number);

	wand = WAND(magick);

	return alloc_bool(MagickMedianFilterImage(wand, val_number(radius)));
}

value nMagick_minify(value magick)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	return alloc_bool(MagickMinifyImage(wand));
}

value nMagick_modulate(value magick, value brightness, value saturation, value hue)
{
	MagickWand * wand;

	val_check_kind(magick, k_wand);
	val_check(brightness, number);
	val_check(saturation, number);
	val_check(hue, number);

	wand = WAND(magick);

	return alloc_bool(MagickModulateImage(wand, val_number(brightness), val_number(saturation), val_number(hue)));
}

value nMagick_motion_blur(value magick, value radius, value sigma, value angle)
{
	MagickWand * wand;

	val_check_kind(magick, k_wand);
	val_check(radius, number);
	val_check(sigma, number);
	val_check(angle, number);

	wand = WAND(magick);

	return alloc_bool(MagickMotionBlurImage(wand, val_number(radius), val_number(sigma), val_number(angle)));
}

value nMagick_negate(value magick, value gray)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(gray, bool);

	wand = WAND(magick);

	return alloc_bool(MagickNegateImage(wand, val_bool(gray)));
}

value nMagick_normalize(value magick)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	return alloc_bool(MagickNormalizeImage(wand));
}

value nMagick_oil_painting(value magick, value radius)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(radius, number);

	wand = WAND(magick);

	return alloc_bool(MagickOilPaintImage(wand, val_number(radius)));
}

value nMagick_paint_transparent(value magick, value target, value opacity, value fuzz)
{
	MagickWand *wand;
	PixelWand *t;

	val_check_kind(magick, k_wand);
	val_check_kind(target, k_pixel);
	val_check(fuzz, number);
	val_check(opacity, number);

	if (val_number(opacity) > 65535 || val_number(opacity) < 0)
		return val_null;

	wand = WAND(magick);
	t = PIXEL(target);

	return alloc_bool(MagickPaintTransparentImage(wand, t, val_number(opacity), val_number(fuzz)));
}

value nMagick_posterize(value magick, value levels, value dither)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(levels, int);
	val_check(dither, bool);

	wand = WAND(magick);

	return alloc_bool(MagickPosterizeImage(wand, val_int(levels), val_bool(dither)));
}

value nMagick_quantize(value magick, value num_colors, value colorspace, value dither)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(num_colors, int);
	val_check(colorspace, int);
	val_check(dither, bool);

	wand = WAND(magick);

	return alloc_bool(MagickQuantizeImage(wand, val_int(num_colors), val_int(colorspace), 1, val_bool(dither), false));
}

value nMagick_radial_blur(value magick, value angle)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(angle, number);

	wand = WAND(magick);

	return alloc_bool(MagickRadialBlurImage(wand, val_number(angle)));
}

value nMagick_raise(value magick, value rect, value raise)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(rect, object);
	val_check(raise, bool);

	wand = WAND(magick);

	return alloc_bool(MagickRaiseImage(wand, val_int(val_field(rect, val_id("w" ) ) ), val_int( val_field( rect, val_id( "h" ) ) ), val_int( val_field( rect, val_id( "x" ) ) ), val_int( val_field( rect, val_id( "y"))), val_bool(raise)));
}

value nMagick_load_blob(value magick, value blob, value length)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(blob, string);
	val_check(length, int);

	wand = WAND(magick);

	return alloc_bool(MagickReadImageBlob(wand, val_string(blob), val_int(length)));
}

value nMagick_reduce_noise(value magick, value radius)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(radius, number);

	wand = WAND(magick);

	return alloc_bool(MagickReduceNoiseImage(wand, val_number(radius)));
}

value nMagick_resample(value magick, value x, value y, value filter, value blur)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(x, int);
	val_check(y, int);
	val_check(filter, int);
	val_check(blur, number);

	wand = WAND(magick);

	return alloc_bool(MagickResampleImage(wand, val_int(x), val_int(y), val_int(filter), val_number(blur)));
}

value nMagick_roll(value magick, value x, value y)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(x, int);
	val_check(y, int);

	wand = WAND(magick);

	return alloc_bool(MagickRollImage(wand, val_int(x), val_int(y)));
}

value nMagick_rotate(value magick, value background, value degrees)
{
	MagickWand *wand;
	PixelWand *bg;

	val_check_kind(magick, k_wand);
	val_check_kind(background, k_pixel);
	val_check(degrees, number);

	wand = WAND(magick);
	bg = PIXEL(background);

	return alloc_bool(MagickRotateImage(wand, bg, val_number(degrees)));
}

value nMagick_sample(value magick, value columns, value rows)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(columns, int);
	val_check(rows, int);

	wand = WAND(magick);

	return alloc_bool(MagickSampleImage(wand, val_int(columns), val_int(rows)));
}

value nMagick_scale(value magick, value columns, value rows)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(columns, int);
	val_check(rows, int);

	wand = WAND(magick);

	return alloc_bool(MagickScaleImage(wand, val_int(columns), val_int(rows)));
}

value nMagick_solarize(value magick, value threshold)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(threshold, number);

	wand = WAND(magick);

	return alloc_bool(MagickSolarizeImage(wand, val_number(threshold)));
}

value nMagick_set_extent(value magick, value cols, value rows)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	return alloc_bool(MagickSetImageExtent(wand, val_int(cols), val_int(rows)));
}

value nMagick_set_filename(value magick, value filename)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(filename, string);

	wand = WAND(magick);

	return alloc_bool(MagickSetImageFilename(wand, val_string(filename)));
}

value nMagick_shine(value magick, value gray, value azimuth, value elevation)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(gray, bool);
	val_check(azimuth, number);
	val_check(elevation, number);

	wand = WAND(magick);

	alloc_bool(MagickShadeImage(wand, val_bool(gray), val_number(azimuth), val_number(elevation)));

	return val_true;
}

value nMagick_shadow(value magick, value radius, value sigma, value point)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(radius, number);
	val_check(sigma, number);
	val_check(point, object);

	wand = WAND(magick);

	return alloc_bool(MagickShadowImage(wand, val_number(radius), val_number(sigma), val_int(val_field(point, val_id("x" ) ) ), val_int( val_field( point, val_id( "y")))));
}

value nMagick_sharpen(value magick, value radius, value sigma)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(radius, number);
	val_check(sigma, number);

	wand = WAND(magick);

	return alloc_bool(MagickSharpenImage(wand, val_number(radius), val_number(sigma)));
}

value nMagick_shave(value magick, value cols, value rows)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(cols, int);
	val_check(rows, int);

	wand = WAND(magick);

	return alloc_bool(MagickShaveImage(wand, val_int(cols), val_int(rows)));
}

value nMagick_shear(value magick, value background, value x, value y)
{
	MagickWand *wand;
	PixelWand *bg;

	val_check_kind(magick, k_wand);
	val_check_kind(background, k_pixel);
	val_check(x, number);
	val_check(y, number);

	wand = WAND(magick);
	bg = PIXEL(background);

	return alloc_bool(MagickShearImage(wand,  bg, val_number(x), val_number(y)));
}

value nMagick_stereo(value magick, value offset_wand)
{
	val_check_kind(magick, k_wand);
	val_check_kind(offset_wand, k_wand);

	MagickWand *wand = WAND(magick);
	MagickWand *offset = WAND(offset_wand);

	value v = alloc_abstract(k_wand, MagickStereoImage(wand, offset));
	val_gc(v, nMagick_finalize);
	return v;
}

value nMagick_strip(value magick)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	return alloc_bool(MagickStripImage(wand));
}

value nMagick_swirl(value magick, value degrees)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(degrees, number);

	wand = WAND(magick);

	return alloc_bool(MagickSwirlImage(wand, val_number(degrees)));
}

value nMagick_texture(value magick, value texture)
{
	MagickWand *wand;
	MagickWand *texture_wand;

	val_check_kind(magick, k_wand);
	val_check_kind(texture, k_wand);

	wand = WAND(magick);
	texture_wand = WAND(texture);

	return alloc_bool(MagickTextureImage(wand, texture_wand));
}

value nMagick_threshold(value magick, value threshold)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(threshold, number);

	wand = WAND(magick);

	return alloc_bool(MagickThresholdImage(wand, val_number(threshold)));
}

value nMagick_tint(value magick, value tint, value opacity)
{
	MagickWand *wand;
	PixelWand *t;
	PixelWand *o;

	val_check_kind(magick, k_wand);
	val_check_kind(tint, k_pixel);
	val_check_kind(opacity, k_pixel);

	wand = WAND(magick);
	t = PIXEL(tint);
	o = PIXEL(opacity);

	return alloc_bool(MagickTintImage(wand, t, o));
}

value nMagick_wave(value magick, value amplitude, value length)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);
	val_check(amplitude, number);
	val_check(length, number);

	wand = WAND(magick);

	return alloc_bool(MagickWaveImage(wand, val_number(amplitude), val_number(length)));
}

value nMagick_white_thres(value magick, value threshold)
{
	MagickWand *wand;
	PixelWand *th;

	val_check_kind(magick, k_wand);
	val_check_kind(threshold, k_pixel);
	
	wand = WAND(magick);
	th = PIXEL(threshold);
	
	return alloc_bool(MagickWhiteThresholdImage(wand, th));
}

value nMagick_matte_flood_fill(value *args, int nargs)
{
	value magick;
	value alpha;
	value fuzz;
	value color;
	value x;
	value y;
	
	MagickWand *wand;
	PixelWand *c;
	
	if (nargs != 6) return alloc_bool(false);
	
	magick	= args[0];
	alpha	= args[1];
	fuzz	= args[2];
	color	= args[3];
	x		= args[4];
	y		= args[5];

	val_check_kind(magick, k_wand);
	val_check(alpha, number);
	val_check(fuzz, number);
	val_check_kind(color, k_pixel);
	val_check(x, int);
	val_check(y, int);

	wand = WAND(magick);
	c = PIXEL(color);

	return alloc_bool(MagickMatteFloodfillImage(wand, val_number(alpha), val_number(fuzz), c, val_int(x), val_int(y)));
}

#define minValue(a, b) (((a)<(b)) ? (a) : (b))
value nMagick_iterate_pixels(value *args, int nargs)
{
	value magick;
	value f;
	value regionX;
	value regionY;
	value regionW;
	value regionH;
	
	MagickWand *wand;
	PixelIterator *iterator;
	int x, y, w, h, width, rX, rY, rW, rH;
	MagickPixelPacket pixel;
	PixelWand **pixels;

	if (nargs != 6) return alloc_bool(false);

	magick	= args[0];
	f		= args[1];
	regionX	= args[2];
	regionY	= args[3];
	regionW	= args[4];
	regionH	= args[5];

	val_check_kind(magick, k_wand);
	val_check_function(f, 3);
	val_check(regionX, int);
	val_check(regionY, int);
	val_check(regionW, int);
	val_check(regionH, int);

	wand = WAND(magick);
	rX = val_int(regionX);
	rY = val_int(regionY);
	rW = val_int(regionW);
	rH = val_int(regionH);

	if (rW < 0) rW = MagickGetImageWidth(wand) - rX;
	if (rH < 0) rH = MagickGetImageHeight(wand) - rY;
	
	iterator = NewPixelIterator(wand);
	for (y = 0; y < minValue(rY + rH, MagickGetImageHeight(wand)); y++)
	{
		pixels = PixelGetNextIteratorRow(iterator, &width);
		if (pixels == (PixelWand **)NULL) break;
		if (y >= rY)
		{
			for (x = rX; x < minValue(rX + rW, width); x++)
			{
				val_call3(f, alloc_float(x), alloc_float(y), alloc_abstract(k_pixel, pixels[x]));
			}
		}
	}
	DestroyPixelIterator(iterator);
	
	return alloc_bool(true);
}

value nMagick_clone(value magick)
{
	MagickWand *wand;

	val_check_kind(magick, k_wand);

	wand = WAND(magick);

	return alloc_abstract(k_wand, CloneMagickWand(wand));
}


#if _WINDOWS
	BOOL WINAPI DllMain(HINSTANCE hinstDLL, DWORD fdwReason, LPVOID lpReserved)
	{
		switch (fdwReason)
		{
			case DLL_PROCESS_ATTACH:
				MagickWandGenesis();
				break;
			case DLL_PROCESS_DETACH:
				MagickWandTerminus();
				break;
		}

		return TRUE;
	}
#else
	void __attribute__ ((constructor)) library_load(void);
	void __attribute__ ((destructor)) library_unload(void);

	void library_load(void)
	{
		MagickWandGenesis();
	}

	void library_unload(void)
	{
		MagickWandTerminus();
	}
#endif

DEFINE_PRIM(nMagick_destroy, 1);
DEFINE_PRIM(nMagick_init, 0);
DEFINE_PRIM(nMagick_load, 2);
DEFINE_PRIM(nMagick_save, 2);
DEFINE_PRIM(nMagick_resize, 5);
DEFINE_PRIM(nMagick_clear, 1);
DEFINE_PRIM(nMagick_adaptive_sharpen, 3);
DEFINE_PRIM(nMagick_adaptive_threshold, 4);
DEFINE_PRIM(nMagick_add_image, 2);
DEFINE_PRIM(nMagick_add_noise, 2);
DEFINE_PRIM(nMagick_affine_transform, 2);
DEFINE_PRIM(nMagick_annotate, 5);
DEFINE_PRIM(nMagick_black_threshold, 2);
DEFINE_PRIM(nMagick_blur, 3);
DEFINE_PRIM(nMagick_border, 4);
DEFINE_PRIM(nMagick_charcoal, 3);
DEFINE_PRIM(nMagick_chop, 4);
DEFINE_PRIM(nMagick_colorfloodfill, 5);
DEFINE_PRIM(nMagick_colorize, 3);
DEFINE_PRIM(nMagick_comment, 2);
DEFINE_PRIM(nMagick_composite, 4);
DEFINE_PRIM(nMagick_contrast, 2);
DEFINE_PRIM(nMagick_convolve, 3);
DEFINE_PRIM(nMagick_crop, 4);
DEFINE_PRIM(nMagick_despeckle, 1);
DEFINE_PRIM(nMagick_draw, 2);
DEFINE_PRIM(nMagick_edge, 2);
DEFINE_PRIM(nMagick_emboss, 3);
DEFINE_PRIM(nMagick_enhance, 1);
DEFINE_PRIM(nMagick_equalize, 1);
DEFINE_PRIM(nMagick_evaluate, 3);
DEFINE_PRIM(nMagick_flatten, 1);
DEFINE_PRIM(nMagick_flip, 1);
DEFINE_PRIM(nMagick_flop, 1);
DEFINE_PRIM(nMagick_gamma, 2);
DEFINE_PRIM(nMagick_gaussian_blur, 3);
DEFINE_PRIM(nMagick_get_region, 4);
DEFINE_PRIM(nMagick_get_background_color, 1);
DEFINE_PRIM(nMagick_set_background_color, 2);
DEFINE_PRIM(nMagick_get_blob, 1);
DEFINE_PRIM(nMagick_get_red_primary, 1);
DEFINE_PRIM(nMagick_set_red_primary, 2);
DEFINE_PRIM(nMagick_get_green_primary, 1);
DEFINE_PRIM(nMagick_set_green_primary, 2);
DEFINE_PRIM(nMagick_get_blue_primary, 1);
DEFINE_PRIM(nMagick_set_blue_primary, 2);
DEFINE_PRIM(nMagick_get_border_color, 1);
DEFINE_PRIM(nMagick_set_border_color, 2);
DEFINE_PRIM(nMagick_get_colormap_color, 3);
DEFINE_PRIM(nMagick_set_colormap_color, 3);
DEFINE_PRIM(nMagick_get_colors_length, 1);
DEFINE_PRIM(nMagick_get_colorspace, 1);
DEFINE_PRIM(nMagick_set_colorspace, 2);
DEFINE_PRIM(nMagick_get_composite, 1);
DEFINE_PRIM(nMagick_set_composite, 2);
DEFINE_PRIM(nMagick_get_compression, 1);
DEFINE_PRIM(nMagick_set_compression, 2);
DEFINE_PRIM(nMagick_set_compression_quality, 2);
DEFINE_PRIM(nMagick_get_depth, 1);
DEFINE_PRIM(nMagick_set_depth, 2);
DEFINE_PRIM(nMagick_get_distortion, 3);
DEFINE_PRIM(nMagick_get_extrema, 1);
DEFINE_PRIM(nMagick_get_dispose, 1);
DEFINE_PRIM(nMagick_get_attribute, 2);
DEFINE_PRIM(nMagick_set_attribute, 3);
DEFINE_PRIM(nMagick_get_format, 1);
DEFINE_PRIM(nMagick_set_format, 2);
DEFINE_PRIM(nMagick_get_gamma, 1);
DEFINE_PRIM(nMagick_set_gamma, 2);
DEFINE_PRIM(nMagick_get_width, 1);
DEFINE_PRIM(nMagick_get_height, 1);
DEFINE_PRIM(nMagick_get_interlace_scheme, 1);
DEFINE_PRIM(nMagick_set_interlace_scheme, 2);
DEFINE_PRIM(nMagick_get_matte, 1);
DEFINE_PRIM(nMagick_set_matte, 2);
DEFINE_PRIM(nMagick_get_matte_color, 1);
DEFINE_PRIM(nMagick_set_matte_color, 2);
DEFINE_PRIM(nMagick_get_pixel_color, 2);
DEFINE_PRIM(nMagick_get_rendering_intent, 1);
DEFINE_PRIM(nMagick_set_rendering_intent, 2);
DEFINE_PRIM(nMagick_get_resolution, 1);
DEFINE_PRIM(nMagick_set_resolution, 3);
DEFINE_PRIM(nMagick_get_size, 1);
DEFINE_PRIM(nMagick_get_type, 1);
DEFINE_PRIM(nMagick_set_type, 2);
DEFINE_PRIM(nMagick_get_units, 1);
DEFINE_PRIM(nMagick_set_units, 2);
DEFINE_PRIM(nMagick_get_white_point, 1);
DEFINE_PRIM(nMagick_set_white_point, 3);
DEFINE_PRIM(nMagick_implode, 2);
DEFINE_PRIM(nMagick_label, 2);
DEFINE_PRIM(nMagick_level, 4);
DEFINE_PRIM(nMagick_magnify, 1);
DEFINE_PRIM(nMagick_map, 3);
DEFINE_PRIM(nMagick_median_filter, 2);
DEFINE_PRIM(nMagick_minify, 1);
DEFINE_PRIM(nMagick_modulate, 4);
DEFINE_PRIM(nMagick_motion_blur, 4);
DEFINE_PRIM(nMagick_negate, 2);
DEFINE_PRIM(nMagick_new, 4);
DEFINE_PRIM(nMagick_normalize, 1);
DEFINE_PRIM(nMagick_oil_painting, 2);
DEFINE_PRIM(nMagick_paint_transparent, 4);
DEFINE_PRIM(nMagick_posterize, 3);
DEFINE_PRIM(nMagick_quantize, 4);
DEFINE_PRIM(nMagick_radial_blur, 2);
DEFINE_PRIM(nMagick_raise, 3);
DEFINE_PRIM(nMagick_load_blob, 3);
DEFINE_PRIM(nMagick_reduce_noise, 2);
DEFINE_PRIM(nMagick_resample, 5);
DEFINE_PRIM(nMagick_roll, 3);
DEFINE_PRIM(nMagick_rotate, 3);
DEFINE_PRIM(nMagick_sample, 3);
DEFINE_PRIM(nMagick_scale, 3);
DEFINE_PRIM(nMagick_solarize, 2);
DEFINE_PRIM(nMagick_set_extent, 3);
DEFINE_PRIM(nMagick_set_filename, 3);
DEFINE_PRIM(nMagick_shine, 4);
DEFINE_PRIM(nMagick_shadow, 4);
DEFINE_PRIM(nMagick_sharpen, 3);
DEFINE_PRIM(nMagick_shave, 3);
DEFINE_PRIM(nMagick_shear, 4);
DEFINE_PRIM(nMagick_stereo, 2);
DEFINE_PRIM(nMagick_strip, 1);
DEFINE_PRIM(nMagick_swirl, 2);
DEFINE_PRIM(nMagick_texture, 2);
DEFINE_PRIM(nMagick_threshold, 2);
DEFINE_PRIM(nMagick_tint, 3);
DEFINE_PRIM(nMagick_wave, 3);
DEFINE_PRIM(set_exception_handler, 1);
DEFINE_PRIM(nMagick_white_thres, 2);
DEFINE_PRIM(nMagick_clone, 1);
DEFINE_PRIM_MULT(nMagick_matte_flood_fill);
DEFINE_PRIM_MULT(nMagick_iterate_pixels);
