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

#include "nMagick.h"

DEFINE_KIND( k_wand );
DEFINE_KIND( k_draw );
DEFINE_KIND( k_pixel );

value *exception_handler = NULL;
int objCount = 0;

static value set_exception_handler( value f )
{
	val_check_function(f,1); // checks that f has 1 argument
	if( exception_handler == NULL )
		exception_handler = alloc_root(1);
	*exception_handler = f;
	return val_null;
}

value throwWandException( MagickWand* wand )
{
	char *description;
	ExceptionType severity;
	description = MagickGetException(wand,&severity);
	if (exception_handler == NULL) 
	{
		(void) fprintf(stderr,"%s %s %ld %s\n",GetMagickModule(),description); 
		description = (char *) MagickRelinquishMemory(description); 
		exit(-1); 
	}
	else
	{
		return val_call1(*exception_handler,alloc_string(description));	
	}
}

/* =========================================================================
Magick wand methods
*/

value nMagick_relinquish_memory( value magick )
{
	val_gc( magick, NULL );
	MagickRelinquishMemory( val_string( magick ) );
}


value nMagick_close( value magick )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );

	val_gc( magick, NULL );

	wand = WAND( magick );

	DestroyMagickWand( wand );

	if (objCount==1)
		MagickWandTerminus();
	objCount--;
}

value nMagick_init()
{
	value v;
	MagickWand *magick_wand;

	if (objCount==0)
		MagickWandGenesis();
	objCount++;

	magick_wand = NewMagickWand();

	v = alloc_abstract( k_wand, magick_wand );
	val_gc( v, nMagick_close );
	return v;
}

value nMagick_new( value magick, value columns, value rows, value background )
{
	MagickWand *wand;
	PixelWand *bg;

	val_check_kind( magick, k_wand );
	val_check_kind( background, k_pixel );
	val_check( columns, int );
	val_check( rows, int );

	wand = WAND( magick );
	bg = PIXEL( background );

	while( MagickGetNumberImages( wand ) > 0 )
		MagickRemoveImage( wand );

	return alloc_bool( MagickNewImage( wand, val_int( columns ), val_int( rows ), bg ) );
}

value nMagick_load( value magick, value image )
{
	MagickWand *wand;
	MagickBooleanType status;

	val_check_kind( magick, k_wand );
	val_check( image, string );

	wand = WAND( magick );

	while( MagickGetNumberImages( wand ) > 0 )
		MagickRemoveImage( wand );

	status = MagickReadImage( wand, val_string( image ) );
	if ( status == MagickFalse )
		throwWandException( wand );
}

value nMagick_save( value magick, value file )
{
	MagickWand *wand;
	MagickBooleanType status;

	val_check_kind( magick, k_wand );
	val_check( file, string );

	wand = WAND( magick );

	status = MagickWriteImages( wand, val_string( file ), MagickTrue );
	if ( status == MagickFalse )
		throwWandException( wand );
}

value nMagick_resize( value magick, value w, value h )
{
	MagickWand *wand;
	val_check_kind( magick, k_wand );
	val_check( w, int );
	val_check( h, int );

	wand = WAND( magick );
	return alloc_bool( MagickResizeImage( wand , val_int( w ), val_int( h ), LanczosFilter, 1.0) );
}

/*
@description	MagickAdaptiveSharpenImage() adaptively sharpens the image by 
				sharpening more intensely near image edges and less intensely 
				far from edges. We sharpen the image with a Gaussian operator 
				of the given radius and standard deviation (sigma). For reasonable 
				results, radius should be larger than sigma. Use a radius of 0 
				and MagickAdaptiveSharpenImage() selects a suitable radius for you.

@param			radius	The radius of the Gaussian, in pixels, not counting the center pixel.
@param			sigma	The standard deviation of the Gaussian, in pixels.
*/
value nMagick_adaptive_sharpen( value magick, value radius, value sigma )
{
	MagickWand *wand;
	double r, s;

	val_check_kind( magick, k_wand );
	val_check( radius, float );
	val_check( sigma, float );

	r = (double)val_float( radius );
	s = (double)val_float( sigma );

	wand = WAND( magick );
	return alloc_bool( MagickAdaptiveSharpenImage( wand, r, s ) );
}

/*
@description	MagickAdaptiveThresholdImage() selects an individual threshold 
				for each pixel based on the range of intensity values in its local 
				neighborhood. This allows for thresholding of an image whose 
				global intensity histogram doesn't contain distinctive peaks.

@param			width	The width of the local neighborhood.
@param			height	The height of the local neighborhood.
@param			offset	The mean offset.
*/
value nMagick_adaptive_threshold( value magick, value width, value height, value offset )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( width, int );
	val_check( height, int );
	val_check( offset, int );

	wand = WAND( magick );
	return alloc_bool( MagickAdaptiveThresholdImage( wand, width, height, offset ) );
}

/*
@description	Adds the specified images at the current image location.

@param			nMagick	The image to add to the current image.
*/
value nMagick_add_image( value magick, value magick2 )
{
	MagickWand *wand;
	MagickWand *wand2;

	val_check_kind( magick, k_wand );
	val_check_kind( magick2, k_wand );

	wand = WAND( magick );
	wand2 = WAND( magick2 );
	return alloc_bool( MagickAddImage( wand, wand2 ) );
}

/*
@description	Adds random noise to the image.

@param			noise_type	The type of noise: UniformNoise = 1, GaussianNoise = 2, MultiplicativeGaussianNoise = 3, ImpulseNoise = 4, LaplacianNoise = 5, or PoissonNoise = 6.
*/
value nMagick_add_noise( value magick, value noise_type )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( noise_type, int );

	wand = WAND( magick );
	return alloc_bool( MagickAddNoiseImage( wand, ( NoiseType )val_int( noise_type ) ) );
}

/*
@description	transforms an image as dictated by the affine matrix of the drawing 
				wand.

@param
*/
value nMagick_affine_transform( value magick, value draw_magick )
{
	MagickWand *wand;
	DrawingWand *drawing_wand;

	val_check_kind( magick, k_wand );
	val_check_kind( draw_magick, k_draw );

	wand = WAND( magick );
	drawing_wand = DRAW( draw_magick );
	return alloc_bool( MagickAffineTransformImage( wand, drawing_wand ) );
}

/*
@description	Annotates an image with text.

@param			drawing_wand	The draw wand.
@param			point			x and y ordinate to left and baseline of text.
@param			angle			rotate text relative to this angle.
@param			text			text to draw.
*/
value nMagick_annotate( value magick, value draw_magick, value point, value angle, value text )
{
	MagickWand *wand;
	DrawingWand *drawing_wand;
	double a;

	printf("1\n");
	val_check_kind( magick, k_wand );
	val_check_kind( draw_magick, k_draw );
	printf("2\n");
	val_check( point, object );
	val_check( angle, int );
	val_check( text, string );

	printf("3\n");
	a = (double)val_int( angle );

	printf("4\n");
	wand = WAND( magick );
	drawing_wand = DRAW( draw_magick );
	
	printf("5\n");
	return alloc_bool( MagickAnnotateImage( wand, drawing_wand, val_int( val_field( point, val_id( "x" ) ) ), val_int( val_field( point, val_id( "y" ) ) ), a, val_string( text ) ) );
}

/*
@description	Like MagickThresholdImage() but forces all pixels below the threshold 
				into black while leaving all pixels above the threshold unchanged.
@param			Threshold	The PixelWand.
*/
value nMagick_black_threshold( value magick, value threshold )
{
	MagickWand *wand;
	PixelWand *th;

	val_check_kind( magick, k_wand );
	val_check_kind( threshold, k_pixel );
	
	wand = WAND( magick );
	th = PIXEL( threshold );
	
	return alloc_bool( MagickBlackThresholdImage( wand, th ) );
}

/*
@description	Like MagickThresholdImage() but forces all pixels below the threshold 
				into white while leaving all pixels above the threshold unchanged.
@param			Threshold	The PixelWand.
*/
value nMagick_white_threshold( value magick, value threshold )
{
	MagickWand *wand;
	PixelWand *th;

	val_check_kind( magick, k_wand );
	val_check_kind( threshold, k_pixel );
	
	wand = WAND( magick );
	th = PIXEL( threshold );
	
	return alloc_bool( MagickWhiteThresholdImage( wand, th ) );
}

/*
@description	blurs an image. We convolve the image with a gaussian operator 
				of the given radius and standard deviation (sigma). For reasonable 
				results, the radius should be larger than sigma. Use a radius of 0 
				and BlurImage() selects a suitable radius for you.

@param			radius	The radius of the , in pixels, not counting the center pixel.
@param			sigma	The standard deviation of the , in pixels.
*/
value nMagick_blur( value magick, value radius, value sigma )
{
	MagickWand *wand;
	double r, s;

	val_check_kind( magick, k_wand );
	val_check( radius, int );
	val_check( sigma, int );

	r = (double)val_int( radius );
	s = (double)val_int( sigma );

	wand = WAND( magick );

	return alloc_bool( MagickBlurImage( wand, r, s ) );
}

/*
@description	surrounds the image with a border of the color defined by the 
				bordercolor pixel wand.

@param			bordercolor	The border color pixel wand.
@param			width		The border width.
@param			height		The border height.
*/
value nMagick_border( value magick, value bordercolor, value width, value height )
{
	MagickWand *wand;
	PixelWand *border;

	val_check_kind( magick, k_wand );
	val_check_kind( bordercolor, k_pixel );
	val_check( width, int );
	val_check( height, int );
	
	wand = WAND( magick );
	border = PIXEL( bordercolor );
	
	return alloc_bool( MagickBorderImage( wand, border, val_int( width ), val_int( height ) ) );
}

/*
@description	Simulates a charcoal drawing.

@param			radius	The radius of the Gaussian, in pixels, 
				not counting the center pixel.
@param			sigma	The standard deviation of the Gaussian, in pixels.
*/
value nMagick_charcoal( value magick, value radius, value sigma )
{	
	MagickWand *wand;
	double r, s;
	
	val_check_kind( magick, k_wand );
	val_check( radius, int );
	val_check( sigma, int );

	r = (double)val_int( radius );
	s = (double)val_int( sigma );

	wand = WAND( magick );

	return alloc_bool( MagickCharcoalImage( wand, r, s ) );
}

/*
@description	Removes a region of an image and collapses the image to occupy the removed portion.

@param			width	The region width.
@param			height	The region height.
@param			point	x and y of the region offset.
*/
value nMagick_chop( value magick, value width, value height, value point )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( point, object );
	val_check( width, int );
	val_check( height, int );

	wand = WAND( magick );
	
	return alloc_bool( MagickChopImage( wand, val_int( width ), val_int( height ), val_int( val_field( point, val_id( "x" ) ) ), val_int( val_field( point, val_id( "y" ) ) ) ) );
}
/*
@description	changes the color value of any pixel that matches target and 
				is an immediate neighbor. If the method FillToBorderMethod 
				is specified, the color value is changed for any neighbor 
				pixel that does not match the bordercolor member of image.

@param			fill		The floodfill color pixel wand.
@param			fuzz		By default target must match a particular pixel color 
				exactly. However, in many cases two colors may differ by a small 
				amount. The fuzz member of image defines how much tolerance is 
				acceptable to consider two colors as the same. For example, 
				set fuzz to 10 and the color red at intensities of 100 and 102 
				respectively are now interpreted as the same color for the 
				purposes of the floodfill.
@param			bordercolor	The border color pixel wand.
@param			point		The starting location of the operation.
*/
value nMagick_colorfloodfill( value magick, value fill, value fuzz, value bordercolor, value point )
{
	MagickWand *wand;
	PixelWand *fl;
	PixelWand *border;

	val_check_kind( magick, k_wand );
	val_check_kind( fill, k_pixel );
	val_check_kind( bordercolor, k_pixel );
	val_check( point, object );
	val_check( fuzz, float );

	wand = WAND( magick );
	fl = PIXEL( fill );
	border = PIXEL( bordercolor );

	return alloc_bool( MagickColorFloodfillImage( wand, fl, val_float( fuzz ), border, val_int( val_field( point, val_id( "x" ) ) ), val_int( val_field( point, val_id( "y" ) ) ) ) );
}

/*
@description	Blends the fill color with each pixel in the image.

@param			colorize	The colorize pixel wand.
@param			opacity		The opacity pixel wand.
*/
value nMagick_colorize( value magick, value colorize, value opacity )
{
	MagickWand *wand;
	PixelWand *c;
	PixelWand *o;

	val_check_kind( magick, k_wand );
	val_check_kind( colorize, k_pixel );
	val_check_kind( opacity, k_pixel );

	wand = WAND( magick );
	c = PIXEL( colorize );
	o = PIXEL( opacity );

	return alloc_bool( MagickColorizeImage( wand, c, o ) );
}

/*
@description	Adds a comment to your image.

@param			
*/
value nMagick_comment( value magick, value comment )
{
	MagickWand *wand;
	val_check( comment, string );
	val_check_kind( magick, k_wand );
	
	wand = WAND( magick );
	
	return alloc_bool( MagickCommentImage( wand, val_string( comment ) ) );
}

/*
@description	Composite one image onto another at the specified offset.

@param			composite_image	The composite image.
@param			compose			This operator affects how the composite is applied
				to the image. The default is Over. Choose from these operators:

	OverCompositeOp			InCompositeOp			OutCompositeOP
	AtopCompositeOP			XorCompositeOP			PlusCompositeOP
	MinusCompositeOP		AddCompositeOP			SubtractCompositeOP
	DifferenceCompositeOP	BumpmapCompositeOP		CopyCompositeOP
	DisplaceCompositeOP

@param			point			The column and row offset of the composited image.
*/
value nMagick_composite( value magick, value composite_wand, value point )
{
	MagickWand *wand;
	MagickWand *wand2;

	val_check_kind( magick, k_wand );
	val_check_kind( composite_wand, k_wand );

	wand = WAND( magick );
	wand2 = WAND( composite_wand );
	return alloc_bool( MagickCompositeImage( wand, wand2, OverCompositeOp, val_int( val_field( point, val_id( "x" ) ) ), val_int( val_field( point, val_id( "y" ) ) ) ) );
}

/*
@description	enhances the intensity differences between the lighter and darker 
				elements of the image. Set sharpen to a value other than 0 to 
				increase the image contrast otherwise the contrast is reduced.
@param			sharpen		0 to reduce contrast, other int to increase contrast
*/
value nMagick_contrast( value magick, value sharpen )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( sharpen, int );

	wand = WAND( magick );

	return alloc_bool( MagickContrastImage( wand, val_int( sharpen ) ) );
}

/*
@description	Applies a custom convolution kernel to the image.

@param			order	The number of columns and rows in the filter kernel.
@param			kernel	An array of doubles representing the convolution kernel.

TODO : write a function to convert an array of values to an array of doubles
*/
value nMagick_convolve( value magick, value order, value kernal )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( order, int );
	val_check( kernal, float );

	wand = WAND( magick );

	return alloc_bool( MagickConvolveImage( wand, val_int( order ), &val_float( kernal ) ) );
}

/*
@description	Extracts a region of the image.

@param			width	The region width.
@param			height	The region height.
@param			point	The region x,y offset.
*/
value nMagick_crop( value magick, value width, value height, value point )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( width, int );
	val_check( height, int );
	val_check( point, object );

	wand = WAND( magick );

	return alloc_bool( MagickCropImage( wand, val_int( width ), val_int( height ), val_int( val_field( point, val_id( "x" ) ) ), val_int( val_field( point, val_id( "y" ) ) ) ) );
}

/*
@description	Reduces the speckle noise in an image while perserving the edges of the original image.
*/
value nMagick_despeckle( value magick )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	return alloc_bool( MagickDespeckleImage( wand ) );
}

/*
@description	Renders the drawing wand on the current image.

@param			drawing_wand	image to draw.
*/
value nMagick_draw( value magick, value drawing_wand )
{
	MagickWand *wand;
	DrawingWand *dwand;

	val_check_kind( magick, k_wand );
	val_check_kind( drawing_wand, k_draw );
	
	wand = WAND( magick );
	dwand = DRAW( drawing_wand );
	return alloc_bool( MagickDrawImage( wand, dwand ) );
}

/*
@description	Enhance edges within the image with a convolution filter 
				of the given radius. Use a radius of 0 and Edge() selects 
				a suitable radius for you.
@param			radius	The radius of the pixel neighborhood.
*/
value nMagick_edge( value magick, value radius )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( radius, float );

	wand = WAND( magick );

	return alloc_bool( MagickEdgeImage( wand, val_float( radius ) ) );
}

/*
@description	returns a grayscale image with a three-dimensional effect.
				We convolve the image with a Gaussian operator of the given 
				radius and standard deviation (sigma). For reasonable results, 
				radius should be larger than sigma. Use a radius of 0 and 
				Emboss() selects a suitable radius for you.

@param			radius	The radius of the Gaussian, in pixels, not counting 
				the center pixel.
@param			sigma	The standard deviation of the Gaussian, in pixels.
*/
value nMagick_emboss( value magick, value radius, value sigma )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( radius, float );
	val_check( sigma, float );

	wand = WAND( magick );
	return alloc_bool( MagickEmbossImage( wand, val_float( radius ), val_float( sigma ) ) );
}

/*
@description	Applies a digital filter that improves the quality of a noisy image.
*/
value nMagick_enhance( value magick )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	return alloc_bool( MagickEnhanceImage( wand ) );
}

/*
@description	Equalizes the image histogram.
*/
value nMagick_equalize( value magick )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	return alloc_bool( MagickEqualizeImage( wand ) );
}

/*
@description	Applys an arithmetic, relational, or logical expression to an image. 
				Use these operators to lighten or darken an image, to increase or 
				decrease contrast in an image, or to produce the "negative" of an 
				image.
@param			op			A channel operator.
@param			constant	A constant value.

	op
	==============================
	0 = UndefinedEvaluateOperator
	1 = AddEvaluateOperator
	2 = AndEvaluateOperator
	3 = DivideEvaluateOperator
	4 = LeftShiftEvaluateOperator
	5 = MaxEvaluateOperator
	6 = MinEvaluateOperator
	7 = MultiplyEvaluateOperator
	8 = OrEvaluateOperator
	9 = RightShiftEvaluateOperator
	10 = SetEvaluateOperator
	11 = SubtractEvaluateOperator
	12 = XorEvaluateOperator
*/
value nMagick_evaluate( value magick, value op, value constant )
{
	MagickWand *wand;
	MagickEvaluateOperator meo;

	val_check_kind( magick, k_wand );
	val_check( op, int );
	val_check(	constant, float );

	wand = WAND( magick );

	return alloc_bool( MagickEvaluateImage( wand, val_int( op ), val_float( constant ) ) );
}

/*
@description	Merges a sequence of images. This is useful for combining Photoshop 
				layers into a single image.
*/
value nMagick_flatten( value magick )
{
	MagickWand *wand;
	value v;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	v = alloc_abstract( k_wand, MagickFlattenImages( wand ) );
	val_gc( v, nMagick_close );
	return v;
}

/*
@description	Creates a vertical mirror image by reflecting the pixels around 
				the central x-axis.
*/
value nMagick_flip( value magick )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	return alloc_bool( MagickFlipImage( wand ) );
}

/*
@description	Creates a horizontal mirror image by reflecting the pixels around 
				the central y-axis.
*/
value nMagick_flop( value magick )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	return alloc_bool( MagickFlopImage( wand ) );
}

/*
@description	Gamma-corrects an image. The same image viewed on different 
				devices will have perceptual differences in the way the image's 
				intensities are represented on the screen. Specify individual gamma 
				levels for the red, green, and blue channels, or adjust all three 
				with the gamma parameter. Values typically range from 0.8 to 2.3.
@param			channel		The channel.
@param			level		Define the level of gamma correction.
*/
value nMagick_gamma( value magick, value gamma )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( gamma, float );

	wand = WAND( magick );

	return alloc_bool( MagickGammaImage( wand, val_float( gamma ) ) );
}

/*
@description	Blurs an image. We convolve the image with a Gaussian operator 
				of the given radius and standard deviation (sigma). For reasonable 
				results, the radius should be larger than sigma. Use a radius of 0
				and MagickGaussianBlurImage() selects a suitable radius for you.
*/
value nMagick_gaussian_blur( value magick, value radius, value sigma )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( radius, float );
	val_check( sigma, float );

	wand = WAND( magick );

	return alloc_bool( MagickGaussianBlurImage( wand, val_float( radius ), val_float( sigma ) ) );
}

/*
@description	Extracts a region of the image and returns it as a a new wand.
@param			width	The region width.
@param			height	The region height.
@param			point	The region offset.
*/
value nMagick_get_region( value magick, value width, value height, value point )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( width, int );
	val_check( height, int );
	val_check( point, object );

	wand = WAND( magick );

	return alloc_abstract( k_wand, MagickGetImageRegion( wand, val_int( width ), val_int( height ), val_int( val_field( point, val_id( "x" ) ) ), val_int( val_field( point, val_id( "y" ) ) ) ) );
}
/*
@description	Returns the image background color.
*/
value nMagick_get_background_color( value magick )
{
	MagickWand *wand;
	PixelWand *pw;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	MagickGetImageBackgroundColor( wand, pw );
	return alloc_abstract( k_pixel, pw );
}

/*
@description	Sets the image background color.
*/
value nMagick_set_background_color( value magick, value color )
{
	MagickWand *wand;
	PixelWand *pw;

	val_check_kind( magick, k_wand );
	val_check_kind( color, k_pixel );

	wand = WAND( magick );
	pw = PIXEL( color );

	return alloc_bool( MagickSetImageBackgroundColor( wand, pw ) );
}

/*
@description	Implements direct to memory image formats. It returns the image as a blob and its length. Use MagickSetFormat() to set the format of the returned blob (GIF, JPEG, PNG, etc.).

				Use MagickRelinquishMemory() to free the blob when you are done with it.
@param			length	The length of the blob.
*/
value nMagick_get_blob( value magick )
{
	MagickWand *wand;
	value o;
	int l;
	unsigned char* b;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	b = MagickGetImageBlob( wand, &l );
	o = copy_string( b, l );
	MagickRelinquishMemory( b );

	return o;
}

/*
@description	Returns the chromaticy red primary point.
@param			Point	The chromaticity red primary point.
*/
value nMagick_get_red_primary( value magick )
{
	MagickWand *wand;
	value p;
	int x, y;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	MagickGetImageRedPrimary( wand, &x, &y );
	p = alloc_object( NULL );
	alloc_field( p, val_id( "x" ), alloc_int( x ) );
	alloc_field( p, val_id( "y" ), alloc_int( y ) );
	return p;
}

/*
@description	Sets the chromaticy red primary point.
@param			Point	The chromaticity red primary point.
*/
value nMagick_set_red_primary( value magick, value point )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( point, object );

	wand = WAND( magick );

	return alloc_bool( MagickSetImageRedPrimary( wand, val_int( val_field( point, val_id( "x" ) ) ), val_int( val_field( point, val_id( "y" ) ) ) ) );
}

/*
@description	Returns the chromaticy green primary point.
@param			Point	The chromaticity green primary point.
*/
value nMagick_get_green_primary( value magick )
{
	MagickWand *wand;
	value p;
	int x, y;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	MagickGetImageGreenPrimary( wand, &x, &y );
	p = alloc_object( NULL );
	alloc_field( p, val_id( "x" ), alloc_int( x ) );
	alloc_field( p, val_id( "y" ), alloc_int( y ) );
	return p;
}

/*
@description	Sets the chromaticy green primary point.
@param			Point	The chromaticity green primary point.
*/
value nMagick_set_green_primary( value magick, value point )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( point, object );

	wand = WAND( magick );

	return alloc_bool( MagickSetImageGreenPrimary( wand, val_int( val_field( point, val_id( "x" ) ) ), val_int( val_field( point, val_id( "y" ) ) ) ) );
}

/*
@description	Returns the chromaticy blue primary point for the image.
@param			Point	The chromaticity blue primary point.
*/
value nMagick_get_blue_primary( value magick )
{
	MagickWand *wand;
	value p;
	int x, y;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	MagickGetImageBluePrimary( wand, &x, &y );
	p = alloc_object( NULL );
	alloc_field( p, val_id( "x" ), alloc_int( x ) );
	alloc_field( p, val_id( "y" ), alloc_int( y ) );
	return p;
}

/*
@description	Sets the chromaticy blue primary point for the image.
@param			Point	The chromaticity blue primary point.
*/
value nMagick_set_blue_primary( value magick, value point )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( point, object );

	wand = WAND( magick );

	return alloc_bool( MagickSetImageBluePrimary( wand, val_int( val_field( point, val_id( "x" ) ) ), val_int( val_field( point, val_id( "y" ) ) ) ) );
}

/*
@description	Returns the image border color.
@param			border_color	Return the border color.
*/
value nMagick_get_border_color( value magick )
{
	MagickWand *wand;
	PixelWand *pw;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	MagickGetImageBorderColor( wand, pw );
	return alloc_abstract( k_pixel, pw );
}

/*
@description	Sets the image border color.
@param			border_color	Return the border color.
*/
value nMagick_set_border_color( value magick, value border_color )
{
	MagickWand *wand;
	PixelWand *pw;

	val_check_kind( magick, k_wand );
	val_check_kind( border_color, k_pixel );

	wand = WAND( magick );
	pw = PIXEL( border_color );

	return alloc_bool( MagickSetImageBorderColor( wand, pw ) );
}

/*
@description	Returns the color of the specified colormap index.
@param			index	The offset into the image colormap.
@param			color	Return the colormap color in this wand.
*/
value nMagick_get_colormap_color( value magick, value index, value color )
{
	MagickWand *wand;
	PixelWand *pw;

	val_check_kind( magick, k_wand );
	val_check_kind( color, k_pixel );
	val_check( index, int );

	wand = WAND( magick );
	pw = PIXEL( color );

	return alloc_bool( MagickGetImageColormapColor( wand, index, color ) );
}

/*
@description	Sets the color of the specified colormap index.
@param			index	The offset into the image colormap.
@param			color	Set the colormap color in this wand.
*/
value nMagick_set_colormap_color( value magick, value index, value color )
{
	MagickWand *wand;
	PixelWand *pw;

	val_check_kind( magick, k_wand );
	val_check_kind( color, k_pixel );
	val_check( index, int );

	wand = WAND( magick );
	pw = PIXEL( color );

	return alloc_bool( MagickSetImageColormapColor( wand, index, color ) );
}

/*
@description	Gets the number of unique colors in the image.
*/
value nMagick_get_colors_length( value magick )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	return alloc_int( MagickGetImageColors( wand ) );
}

/*
@description	Gets the image colorspace.
@return			Colorspace as int

	UndefinedColorspace = 0
	RGBColorspace = 1
	GRAYColorspace = 2
	TransparentColorspace = 3
	OHTAColorspace = 4
	LABColorspace = 5
	XYZColorspace = 6
	YCbCrColorspace = 7
	YCCColorspace = 8
	YIQColorspace = 9
	YPbPrColorspace = 10
	YUVColorspace = 11
	CMYKColorspace = 12
	sRGBColorspace = 13
	HSBColorspace = 14
	HSLColorspace = 15
	HWBColorspace = 16
*/
value nMagick_get_colorspace( value magick )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	return alloc_int( MagickGetImageColorspace( wand ) );
}

/*
@description	Gets the image colorspace.
@param			Colorspace	as int.

	UndefinedColorspace = 0
	RGBColorspace = 1
	GRAYColorspace = 2
	TransparentColorspace = 3
	OHTAColorspace = 4
	LABColorspace = 5
	XYZColorspace = 6
	YCbCrColorspace = 7
	YCCColorspace = 8
	YIQColorspace = 9
	YPbPrColorspace = 10
	YUVColorspace = 11
	CMYKColorspace = 12
	sRGBColorspace = 13
	HSBColorspace = 14
	HSLColorspace = 15
	HWBColorspace = 16
*/
value nMagick_set_colorspace( value magick, value colorspace )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( colorspace, int );

	wand = WAND( magick );

	return alloc_bool( MagickSetImageColorspace( wand, val_int( colorspace ) ) );
}

/*
@description	Returns the composite operator associated with the image.
@return			Composite Operator of type int

	UndefinedCompositeOp = 0
	NoCompositeOp = 1
	AddCompositeOp = 2
	AtopCompositeOp = 3
	BlendCompositeOp = 4
	BumpmapCompositeOp = 5
	ClearCompositeOp = 6 
	ColorBurnCompositeOp = 7
	ColorDodgeCompositeOp = 8
	ColorizeCompositeOp = 9
	CopyBlackCompositeOp = 10
	CopyBlueCompositeOp = 11
	CopyCompositeOp = 12 
	CopyCyanCompositeOp = 13
	CopyGreenCompositeOp = 14
	CopyMagentaCompositeOp = 15
	CopyOpacityCompositeOp = 16
	CopyRedCompositeOp = 17
	CopyYellowCompositeOp = 18
	DarkenCompositeOp = 19
	DstAtopCompositeOp = 20
	DstCompositeOp = 21
	DstInCompositeOp = 22
	DstOutCompositeOp = 23
	DstOverCompositeOp = 24
	DifferenceCompositeOp = 25
	DisplaceCompositeOp = 26
	DissolveCompositeOp = 27
	ExclusionCompositeOp = 28
	HardLightCompositeOp = 29
	HueCompositeOp = 30
	InCompositeOp = 31
	LightenCompositeOp = 32
	LuminizeCompositeOp = 33
	MinusCompositeOp = 34
	ModulateCompositeOp = 35
	MultiplyCompositeOp = 36
	OutCompositeOp = 37
	OverCompositeOp = 38
	OverlayCompositeOp = 39
	PlusCompositeOp = 40
	ReplaceCompositeOp = 41
	SaturateCompositeOp = 42
	ScreenCompositeOp = 43
	SoftLightCompositeOp = 44
	SrcAtopCompositeOp = 45
	SrcCompositeOp = 46
	SrcInCompositeOp = 47
	SrcOutCompositeOp = 48
	SrcOverCompositeOp = 49
	SubtractCompositeOp = 50
	ThresholdCompositeOp = 51
	XorCompositeOp = 52
*/
value nMagick_get_composite( value magick )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	return alloc_int( MagickGetImageCompose( wand ) );
}

/*
@description	Returns the composite operator associated with the image.
@param			composite	Operator of type int

	UndefinedCompositeOp = 0
	NoCompositeOp = 1
	AddCompositeOp = 2
	AtopCompositeOp = 3
	BlendCompositeOp = 4
	BumpmapCompositeOp = 5
	ClearCompositeOp = 6 
	ColorBurnCompositeOp = 7
	ColorDodgeCompositeOp = 8
	ColorizeCompositeOp = 9
	CopyBlackCompositeOp = 10
	CopyBlueCompositeOp = 11
	CopyCompositeOp = 12 
	CopyCyanCompositeOp = 13
	CopyGreenCompositeOp = 14
	CopyMagentaCompositeOp = 15
	CopyOpacityCompositeOp = 16
	CopyRedCompositeOp = 17
	CopyYellowCompositeOp = 18
	DarkenCompositeOp = 19
	DstAtopCompositeOp = 20
	DstCompositeOp = 21
	DstInCompositeOp = 22
	DstOutCompositeOp = 23
	DstOverCompositeOp = 24
	DifferenceCompositeOp = 25
	DisplaceCompositeOp = 26
	DissolveCompositeOp = 27
	ExclusionCompositeOp = 28
	HardLightCompositeOp = 29
	HueCompositeOp = 30
	InCompositeOp = 31
	LightenCompositeOp = 32
	LuminizeCompositeOp = 33
	MinusCompositeOp = 34
	ModulateCompositeOp = 35
	MultiplyCompositeOp = 36
	OutCompositeOp = 37
	OverCompositeOp = 38
	OverlayCompositeOp = 39
	PlusCompositeOp = 40
	ReplaceCompositeOp = 41
	SaturateCompositeOp = 42
	ScreenCompositeOp = 43
	SoftLightCompositeOp = 44
	SrcAtopCompositeOp = 45
	SrcCompositeOp = 46
	SrcInCompositeOp = 47
	SrcOutCompositeOp = 48
	SrcOverCompositeOp = 49
	SubtractCompositeOp = 50
	ThresholdCompositeOp = 51
	XorCompositeOp = 52
*/
value nMagick_set_composite( value magick, value composite )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( composite, int );

	wand = WAND( magick );

	return alloc_bool( MagickSetImageCompose( wand, val_int( composite ) ) );
}

/*
@description	Gets the image compression.
@return			Compression Type as int

	UndefinedCompression = 0
	NoCompression = 1
	BZipCompression = 2
	FaxCompression = 3
	Group4Compression = 4
	JPEGCompression = 5
	LosslessJPEGCompression = 7
	LZWCompression = 8
	RLECompression = 9
	ZipCompression = 10

*/
value nMagick_get_compression( value magick )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	return alloc_int( MagickGetImageCompression( wand ) );
}

/*
@description	Gets the image compression.
@param			compression	Type as int

	UndefinedCompression = 0
	NoCompression = 1
	BZipCompression = 2
	FaxCompression = 3
	Group4Compression = 4
	JPEGCompression = 5
	LosslessJPEGCompression = 7
	LZWCompression = 8
	RLECompression = 9
	ZipCompression = 10

*/
value nMagick_set_compression( value magick, value compression )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( compression, int );

	wand = WAND( magick );

	return alloc_bool( MagickSetImageCompression( wand, val_int( compression ) ) );
}

/*
@description	Sets the image compression quality.
*/
value nMagick_set_compression_quality( value magick, value quality )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( quality, int );

	wand = WAND( magick );

	return alloc_bool( MagickSetImageCompressionQuality( wand, val_int( quality ) ) );
}

/*
@description	Gets the image depth.
*/
value nMagick_get_depth( value magick )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	return alloc_int( MagickGetImageDepth( wand ) );
}

/*
@description	Sets the image depth.
*/
value nMagick_set_depth( value magick, value depth )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	return alloc_bool( MagickSetImageDepth( wand, val_int( depth ) ) );
}

/*
@description	Compares an image to a reconstructed image and returns the specified 
				distortion metric.
@param			reference	The reference wand.
@param			metric		The metric as type int

	UndefinedMetric = 0
	MeanAbsoluteErrorMetric = 1
	MeanSquaredErrorMetric = 2
	PeakAbsoluteErrorMetric = 3
	PeakSignalToNoiseRatioMetric = 4
	RootMeanSquaredErrorMetric = 5

@param			distortion	The computed distortion between the images.
*/
value nMagick_get_distortion( value magick, value reference, value metric )
{
	MagickWand *wand;
	MagickWand *ref;
	value distortion;
	double dist;

	val_check_kind( magick, k_wand );
	val_check_kind( reference, k_wand );
	val_check( metric, int );

	wand = WAND( magick );
	ref = WAND( reference );

	if ( !MagickGetImageDistortion( wand, reference, val_int( metric ), &dist ) )
		return val_null;

	distortion = alloc_float( dist );
	return distortion;
}
/*
@description	Gets the extrema for the image.
*/
value nMagick_get_extrema( value magick )
{	
	MagickWand *wand;
	unsigned int *min, *max;
	value point = alloc_object(NULL);

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	if( !MagickGetImageExtrema( wand, min, max ) )
		return val_null;

	alloc_field( point, val_id("x"), alloc_int( min ) );
	alloc_field( point, val_id("y"), alloc_int( max ) );

	return point;
}

/*
@description	Gets the image disposal method.
@return			The dispose type as int.

	UnrecognizedDispose = 0
	UndefinedDispose = 0
	NoneDispose = 1
	BackgroundDispose = 2
	PreviousDispose = 3
*/
value nMagick_get_dispose( value magick )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	return alloc_int( MagickGetImageDispose( wand ) );
}

/*
@description	Returns a value associated with the specified key. 
				Use MagickRelinquishMemory() to free the value when you are 
				finished with it.
@param			key		The key.
*/
value nMagick_get_attribute( value magick, value key )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( key, string );

	wand = WAND( magick );

	return alloc_string( MagickGetImageAttribute( wand, val_string( key ) ) );
}

/*
@description	Associates an attribute with an image.
@param			key		The key.
@param			attrib	Its value.
*/
value nMagick_set_attribute( value magick, value key, value attrib )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( key, string );
	val_check( attrib, string );

	wand = WAND( magick );

	return alloc_bool( MagickSetImageAttribute( wand, val_string( key ), val_string( attrib ) ) );
}

/*
@description	Returns the format of a particular image in a sequence.
*/
value nMagick_get_format( value magick )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	return alloc_string( MagickGetImageFormat( wand ) );
}

/*
@description	Sets the format of a particular image in a sequence.
*/
value nMagick_set_format( value magick, value format )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( format, string );

	wand = WAND( magick );

	return alloc_bool( MagickSetImageFormat( wand, val_string( format ) ) );
}

/*
@description	Gets the image gamma.
*/
value nMagick_get_gamma( value magick )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	return alloc_float( MagickGetImageGamma( wand ) );
}

/*
@description	Sets the image gamma.
*/
value nMagick_set_gamma( value magick, value gamma )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( gamma, float );

	wand = WAND( magick );

	return alloc_bool( MagickSetImageGamma( wand, val_float( gamma ) ) );
}

/*
@description	returns the image histogram as an array of PixelWand wands.
@param			number_colors	The number of unique colors in the image and 
				the number of pixel wands returned.
*/
value nMagick_get_histogram( value magick, value num_colors )
{
	MagickWand *wand;
	value v;

	val_check_kind( magick, k_wand );
	val_check( num_colors, int );

	wand = WAND( magick );

	v = alloc_abstract( k_pixel, MagickGetImageHistogram( wand, val_int( num_colors ) ) );
	val_gc( v, nMagick_pixel_close );
	return v;
}

/*
@description	Gets the image interlace scheme.
@return			The interlace type as int

	UndefinedInterlace = 0
	NoInterlace = 1
	LineInterlace = 2
	PlaneInterlace = 3
	PartitionInterlace = 4
*/
value nMagick_get_interlace_scheme( value magick )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	return alloc_int( MagickGetImageInterlaceScheme( wand ) );
}

/*
@description	Sets the image interlace scheme.
@param			interlace	type as int

	UndefinedInterlace = 0
	NoInterlace = 1
	LineInterlace = 2
	PlaneInterlace = 3
	PartitionInterlace = 4
*/
value nMagick_set_interlace_scheme( value magick, value interlace )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( interlace, int );

	wand = WAND( magick );

	return alloc_int( MagickSetImageInterlaceScheme( wand, val_int( interlace ) ) );
}

/*
@description	Returns MagickTrue if the image has a matte channel 
				otherwise MagickFalse.
*/
value nMagick_get_matte( value magick )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	return alloc_bool( MagickGetImageMatte( wand ) == MagickTrue );
}

/*
@description	sets the image matte channel.
*/
value nMagick_set_matte( value magick, value matte )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( matte, bool );

	wand = WAND( magick );

	return alloc_bool( MagickSetImageMatte( wand, val_bool( matte ) ) );
}

/*
@description	Returns the image matte color.
@param			matte_color		Return the matte color.
*/
value nMagick_get_matte_color( value magick )
{
	MagickWand *wand;
	PixelWand *mc;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	MagickGetImageMatteColor( wand, mc );
	return alloc_abstract( k_pixel, mc );
}

/*
@description	Sets the image matte color.
@param			matte_color		Return the matte color.
*/
value nMagick_set_matte_color( value magick, value matte_color )
{
	MagickWand *wand;
	PixelWand *mc;

	val_check_kind( magick, k_wand );
	val_check_kind( matte_color, k_pixel );

	wand = WAND( magick );
	mc = PIXEL( matte_color );

	return alloc_bool( MagickSetImageMatteColor( wand, mc ) );
}

/*
@description	Returns the color of the specified pixel.
*/
value nMagick_get_pixel_color( value magick, value point )
{
	MagickWand *wand;
	PixelWand *pc;

	val_check_kind( magick, k_wand );
	val_check( point, object );

	wand = WAND( magick );

	MagickGetImagePixelColor( wand, val_int( val_field( point, val_id( "x" ) ) ), val_int( val_field( point, val_id( "y" ) ) ), pc );
	return alloc_abstract( k_pixel, pc );
}

/*
@description	Gets the image rendering intent.
*/
value nMagick_get_rendering_intent( value magick )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	return alloc_bool( MagickGetImageRenderingIntent( wand ) );
}

/*
@description	Sets the image rendering intent.
@param			rendering	The rendering intent

	UndefinedIntent = 0
	SaturationIntent = 1
	PerceptualIntent = 2
	AbsoluteIntent = 3
	RelativeIntent = 4
*/
value nMagick_set_rendering_intent( value magick, value rendering )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( rendering, int );

	wand = WAND( magick );

	return alloc_bool( MagickSetImageRenderingIntent( wand, val_int( rendering ) ) );
}

/*
@description	Gets the image X and Y resolution.
*/
value nMagick_get_resolution( value magick )
{
	MagickWand *wand;
	double x, y;
	value point = alloc_object(NULL);

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	if ( !MagickGetImageResolution( wand, &x, &y ) )
		return val_null;
	
	alloc_field( point, val_id( "x" ), alloc_float( x ) );
	alloc_field( point, val_id( "y" ), alloc_float( y ) );

	return point;
}

/*
@description	Sets the image X and Y resolution.
@param			x	The new width.
@param			y	The new height.
*/
value nMagick_set_resolution( value magick, value x, value y )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( x, int );
	val_check( y, int );

	wand = WAND( magick );

	return alloc_bool( MagickSetImageResolution( wand, val_int( x ), val_int( y ) ) );
}

/*
@description	Returns the size (in bytes) of the current active image.
*/
value nMagick_get_size( value magick )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	return alloc_int( MagickGetImageSize( wand ) );
}

/*
@description	gets the potential image type:

				Bilevel Grayscale GrayscaleMatte Palette PaletteMatte TrueColor 
				TrueColorMatte ColorSeparation ColorSeparationMatte

				To ensure the image type matches its potential, 
				use MagickSetImageType():

				(void) MagickSetImageType(wand,MagickGetImageType(wand));

@return			The image type as int

	UndefinedType = 0
	BilevelType = 1
	GrayscaleType = 2
	GrayscaleMatteType = 3
	PaletteType = 4
	PaletteMatteType = 5
	TrueColorType = 6
	TrueColorMatteType = 7
	ColorSeparationType = 8
	ColorSeparationMatteType = 9
	OptimizeType = 10
*/
value nMagick_get_type( value magick )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	return alloc_int( MagickGetImageType( wand ) );
}

/*
@description	sets the potential image type:

				Bilevel Grayscale GrayscaleMatte Palette PaletteMatte TrueColor 
				TrueColorMatte ColorSeparation ColorSeparationMatte

@param			type	The image type as int

	UndefinedType = 0
	BilevelType = 1
	GrayscaleType = 2
	GrayscaleMatteType = 3
	PaletteType = 4
	PaletteMatteType = 5
	TrueColorType = 6
	TrueColorMatteType = 7
	ColorSeparationType = 8
	ColorSeparationMatteType = 9
	OptimizeType = 10
*/
value nMagick_set_type( value magick, value type )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( type, int );

	wand = WAND( magick );

	return alloc_bool( MagickSetImageType( wand, val_int( type ) ) );
}

/*
@description	Gets the image units of resolution.
@return			Returns resolution type as int

	UndefinedResolution = 0
	PixelsPerInchResolution = 1
	PixelsPerCentimeterResolution = 2
*/
value nMagick_get_units( value magick )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	return alloc_int( MagickGetImageUnits( wand ) );
}

/*
@description	Sets the image units of resolution.
@param			units	resolution type as int

	UndefinedResolution = 0
	PixelsPerInchResolution = 1
	PixelsPerCentimeterResolution = 2
*/
value nMagick_set_units( value magick, value units )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( units, int );

	wand = WAND( magick );

	return alloc_bool( MagickSetImageUnits( wand, val_int( units ) ) );
}

/*
@description	Returns the chromaticy white point.
*/
value nMagick_get_white_point( value magick )
{
	MagickWand *wand;
	double x, y;
	value point = alloc_object(NULL);

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	if( !MagickGetImageWhitePoint( wand, &x, &y ) );
		return val_null;
	
	alloc_field( point, val_id( "x" ), alloc_float( x ) );
	alloc_field( point, val_id( "y" ), alloc_float( y ) );

	return point;
}

/*
@description	Sets the chromaticy white point.
@param			x	The horizontal location.
@param			y	The vertical location.
*/
value nMagick_set_white_point( value magick, value x, value y )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( x, int );
	val_check( y, int );

	wand = WAND( magick );

	return alloc_bool( MagickSetImageWhitePoint( wand, val_int( x ), val_int( y ) ) );
}

/*
@description	Returns the image width.
*/
value nMagick_get_width( value magick )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	return alloc_int( MagickGetImageWidth( wand ) );
}

/*
@description	Returns the image height.
*/
value nMagick_get_height( value magick )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	return alloc_int( MagickGetImageHeight( wand ) );
}

/*
@description	Creates an implode effect.
*/
value nMagick_implode( value magick, value radius )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( radius, float );

	wand = WAND( magick );

	return alloc_bool( MagickImplodeImage( wand, val_float( radius ) ) );
}

/*
@description	Adds a label to your image.
@param			Label	The label to add to your image.
*/
value nMagick_label( value magick, value label )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( label, string );

	wand = WAND( magick );

	return alloc_bool( MagickLabelImage( wand, val_string( label ) ) );
}

/*
@description	MagickLevelImage() adjusts the levels of an image by scaling the 
				colors falling between specified white and black points to the full 
				available quantum range. The parameters provided represent the black, 
				mid, and white points. The black point specifies the darkest color 
				in the image. Colors darker than the black point are set to zero. 
				Mid point specifies a gamma correction to apply to the image. White 
				point specifies the lightest color in the image. Colors brighter 
				than the white point are set to the maximum quantum value.
@param			black_point		The black point.
@param			gamma			The gamma.
@param			white_point		The white point.
*/
value nMagick_level( value magick, value black_point, value gamma, value white_point )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( black_point, float );
	val_check( gamma, float );
	val_check( white_point, float );

	wand = WAND( magick );

	return alloc_bool( MagickLevelImage( wand, val_float( black_point ), val_float( gamma ), val_float( white_point ) ) );
}

/*
@description	A convenience method that scales an image proportionally to twice 
				its original size.
*/
value nMagick_magnify( value magick )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	return alloc_bool( MagickMagnifyImage( wand ) );
}

/*
@description	Replaces the colors of an image with the closest color from a 
				reference image.
*/
value nMagick_map( value magick, value magickb, value dither )
{
	MagickWand *wand;
	MagickWand *map_wand;

	val_check_kind( magick, k_wand );
	val_check_kind( magickb, k_wand );
	val_check( dither, bool );

	wand = WAND( magick );
	map_wand = WAND( magickb );

	return alloc_bool( MagickMapImage( wand, map_wand, val_bool( dither ) ) );
}

/*
@description	Applies a digital filter that improves the quality of a noisy image. 
				Each pixel is replaced by the median in a set of neighboring pixels 
				as defined by radius.
@param			radius	The radius of the pixel neighborhood.
*/
value nMagick_median_filter( value magick, value radius )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( radius, float );

	wand = WAND( magick );

	return alloc_bool( MagickMedianFilterImage( wand , val_float( radius ) ) );
}

/*
@description	A convenience method that scales an image proportionally to one-half
				its original size.
*/
value nMagick_minify( value magick )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	return alloc_bool( MagickMinifyImage( wand ) );
}

/*
@description	lets you control the brightness, saturation, and hue of an image. 
				Hue is the percentage of absolute rotation from the current position. 
				For example 50 results in a counter-clockwise rotation of 90 degrees, 
				150 results in a clockwise rotation of 90 degrees, with 0 and 200 
				both resulting in a rotation of 180 degrees.

				To increase the color brightness by 20 and decrease the color 
				saturation by 10 and leave the hue unchanged, use: 120,90,100.
@param			brightness		The percent change in brighness.
@param			saturation		The percent change in saturation.
@param			hue				The percent change in hue.
*/
value nMagick_modulate( value magick, value brightness, value saturation, value hue )
{
	MagickWand * wand;

	val_check_kind( magick, k_wand );
	val_check( brightness, float );
	val_check( saturation, float );
	val_check( hue, float );

	wand = WAND( magick );

	return alloc_bool( MagickModulateImage( wand, val_float( brightness ), val_float( saturation ), val_float( hue ) ) );
}

/*
@description	Simulates motion blur. We convolve the image with a Gaussian 
				operator of the given radius and standard deviation (sigma). 
				For reasonable results, radius should be larger than sigma. 
				Use a radius of 0 and MotionBlurImage() selects a suitable radius 
				for you. Angle gives the angle of the blurring motion.
@param			radius		The radius of the Gaussian, in pixels, not counting 
				the center pixel.
@param			sigma		The standard deviation of the Gaussian, in pixels.
@param			angle		Apply the effect along this angle.
*/
value nMagick_motion_blur( value magick, value radius, value sigma, value angle )
{
	MagickWand * wand;

	val_check_kind( magick, k_wand );
	val_check( radius, float );
	val_check( sigma, float );
	val_check( angle, float );

	wand = WAND( magick );

	return alloc_bool( MagickMotionBlurImage( wand, val_float( radius ), val_float( sigma ), val_float( angle ) ) );
}

/*
@description	negates the colors in the reference image. The Grayscale option 
				means that only grayscale values within the image are negated.
@param			gray	If MagickTrue, only negate grayscale pixels within the image.
*/
value nMagick_negate( value magick, value gray )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( gray, bool );

	wand = WAND( magick );

	return alloc_bool( MagickNegateImage( wand , val_bool( gray ) ) );
}

/*
@description	Enhances the contrast of a color image by adjusting the pixels 
				color to span the entire range of colors available
*/
value nMagick_normalize( value magick )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	return alloc_bool( MagickNormalizeImage( wand ) );
}

/*
@description	applies a special effect filter that simulates an oil painting. 
				Each pixel is replaced by the most frequent color occurring in a 
				circular region defined by radius.
@param			radius	The radius of the circular neighborhood.
*/
value nMagick_oil_painting( value magick, value radius )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( radius, float );

	wand = WAND( magick );

	return alloc_bool( MagickOilPaintImage( wand , val_float( radius ) ) );
}

/*
@description	changes any pixel that matches color with the color defined by fill.
@param			target		Change this target color to specified opacity value 
				within the image.
@param			opacity		The replacement opacity value.
@param			fuzz		By default target must match a particular pixel color 
				exactly. However, in many cases two colors may differ by a small 
				amount. The fuzz member of image defines how much tolerance is 
				acceptable to consider two colors as the same. For example, set fuzz 
				to 10 and the color red at intensities of 100 and 102 respectively 
				are now interpreted as the same color for the purposes of the 
				floodfill.
*/
value nMagick_paint_transparent( value magick, value target, value opacity, value fuzz )
{
	MagickWand *wand;
	PixelWand *t;

	val_check_kind( magick, k_wand );
	val_check_kind( target, k_pixel );
	val_check( fuzz, float );
	val_check( opacity, float );

	if ( val_float( opacity ) > 65535 || val_float( opacity ) < 0 )
		return val_null;

	wand = WAND( magick );
	t = PIXEL( target );

	return alloc_bool( MagickPaintTransparentImage( wand, t, val_float( opacity ), val_float( fuzz ) ) );
}

/*
@description	Reduces the image to a limited number of color levels.
@param			levels	Number of color levels allowed in each channel. 
				Very low values (2, 3, or 4) have the most visible effect.
@param			dither	Set this integer value to something other than 
				zero to dither the mapped image.
*/
value nMagick_posterize( value magick, value levels, value dither )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( levels, int );
	val_check( dither, bool );

	wand = WAND( magick );

	return alloc_bool( MagickPosterizeImage( wand , val_int( levels ), val_bool( dither ) ) );
}

/*
@description	analyzes the colors within a reference image and chooses a fixed 
				number of colors to represent the image. The goal of the algorithm 
				is to minimize the color difference between the input and output 
				image while minimizing the processing time.
@param			number_colors	The number of colors.
@param			colorspace		Perform color reduction in this colorspace, 
				typically RGBColorspace.

	UndefinedColorspace = 0
	RGBColorspace = 1
	GRAYColorspace = 2
	TransparentColorspace = 3
	OHTAColorspace = 4
	LABColorspace = 5
	XYZColorspace = 6
	YCbCrColorspace = 7
	YCCColorspace = 8
	YIQColorspace = 9
	YPbPrColorspace = 10
	YUVColorspace = 11
	CMYKColorspace = 12
	sRGBColorspace = 13
	HSBColorspace = 14
	HSLColorspace = 15
	HWBColorspace = 16

@param			treedepth		Removed! Normally, this integer value is zero or one. 
				A zero or one tells Quantize to choose a optimal tree depth of 
				Log4(number_colors). A tree of this depth generally allows the 
				best representation of the reference image with the least amount 
				of memory and the fastest computational speed. In some cases, 
				such as an image with low color dispersion (a few number of colors), 
				a value other than Log4(number_colors) is required. To expand the 
				color tree completely, use a value of 8.
@param			dither			A value other than zero distributes the difference 
				between an original image and the corresponding color reduced image 
				to neighboring pixels along a Hilbert curve.
@param			measure_error	A value other than zero measures the difference 
				between	the original and quantized images. This difference is the 
				total quantization error. The error is computed by summing over all 
				pixels in an image the distance squared in RGB space between each 
				reference pixel value and its quantized value.
*/
value nMagick_quantize( value magick, value num_colors, value colorspace, value dither )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( num_colors, int );
	val_check( colorspace, int );
	val_check( dither, bool );

	wand = WAND( magick );

	return alloc_bool( MagickQuantizeImage( wand , val_int( num_colors ), val_int( colorspace ), 1, val_bool( dither ), false ) );
}

/*
@description	Radial blurs an image.
@param			angle	The angle of the blur in degrees.
*/
value nMagick_radial_blur( value magick, value angle )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( angle, float );

	wand = WAND( magick );

	return alloc_bool( MagickRadialBlurImage( wand, val_float( angle ) ) );
}

/*
@description	creates a simulated three-dimensional button-like effect by 
				lightening and darkening the edges of the image. Members width 
				and height of raise_info define the width of the vertical and 
				horizontal edge of the effect.
@param			rect	Define the dimensions of the area to raise.
@param			raise	A value other than zero creates a 3-D raise effect, 
				otherwise it has a lowered effect.
*/
value nMagick_raise( value magick, value rect, value raise )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( rect, object );
	val_check( raise, bool );

	wand = WAND( magick );

	return alloc_bool( MagickRaiseImage( wand, val_int( val_field( rect, val_id( "w" ) ) ), val_int( val_field( rect, val_id( "h" ) ) ), val_int( val_field( rect, val_id( "x" ) ) ), val_int( val_field( rect, val_id( "y" ) ) ), val_bool( raise ) ) );
}

/*
@description	Reads an image or image sequence from a blob.
@param			blob	The blob.
@param			length	The blob length.
*/
value nMagick_load_blob( value magick, value blob, value length )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( blob, string );
	val_check( length, int );

	wand = WAND( magick );

	return alloc_bool( MagickReadImageBlob( wand, val_string( blob ), val_int( length ) ) );
}

/*
@description	smooths the contours of an image while still preserving edge 
				information. The algorithm works by replacing each pixel with 
				its neighbor closest in value. A neighbor is defined by radius. 
				Use a radius of 0 and ReduceNoise() selects a suitable radius 
				for you.
@param			radius	The radius of the pixel neighborhood.
*/
value nMagick_reduce_noise( value magick, value radius )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( radius, float );

	wand = WAND( magick );

	return alloc_bool( MagickReduceNoiseImage( wand , val_float( radius ) ) );
}

/*
@description	resample image to desired resolution.
				
				Bessel Blackman Box Catrom Cubic Gaussian Hanning 
				Hermite Lanczos Mitchell Point Quandratic Sinc Triangle

				Most of the filters are FIR (finite impulse response), however, 
				Bessel, Gaussian, and Sinc are IIR (infinite impulse response). 
				Bessel and Sinc are windowed (brought down to zero) with the 
				Blackman filter.

@param			x_resolution	The new image x resolution.
@param			y_resolution	The new image y resolution.
@param			filter			Image filter to use.

	UndefinedFilter = 0
	PointFilter = 1
	BoxFilter = 2
	TriangleFilter = 3
	HermiteFilter = 4
	HanningFilter = 5
	HammingFilter = 6
	BlackmanFilter = 7
	GaussianFilter = 8
	QuadraticFilter = 9
	CubicFilter = 10
	CatromFilter = 11
	MitchellFilter = 12
	LanczosFilter = 13
	BesselFilter = 14
	SincFilter = 15

@param			blur			The blur factor where > 1 is blurry, < 1 is sharp.
*/
value nMagick_resample( value magick, value x, value y, value filter, value blur )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( x, int );
	val_check( y, int );
	val_check( filter, int );
	val_check( blur, float );

	wand = WAND( magick );

	return alloc_bool( MagickResampleImage( wand, val_int( x ), val_int( y ), val_int( filter ), val_float( blur ) ) );
}

/*
@description	Offsets an image as defined by x and y.
@param			x		The x offset.
@param			y		The y offset.
*/
value nMagick_roll( value magick, value x, value y )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( x, int );
	val_check( y, int );

	wand = WAND( magick );

	return alloc_bool( MagickRollImage( wand, val_int( x ), val_int( y ) ) );
}

/*
@description	Rotates an image the specified number of degrees. Empty triangles 
				left over from rotating the image are filled with the 
				background color.
@param			background	The background pixel wand.
@param			degrees		The number of degrees to rotate the image.
*/
value nMagick_rotate( value magick, value background, value degrees )
{
	MagickWand *wand;
	PixelWand *bg;

	val_check_kind( magick, k_wand );
	val_check_kind( background, k_pixel );
	val_check( degrees, float );

	wand = WAND( magick );
	bg = PIXEL( background );

	return alloc_bool( MagickRotateImage( wand, bg, val_float( degrees ) ) );
}

/*
@description	scales an image to the desired dimensions with pixel sampling. 
				Unlike other scaling methods, this method does not introduce any 
				additional color into the scaled image.
@param			columns		The number of columns in the scaled image.
@param			rows		The number of rows in the scaled image.
*/
value nMagick_sample( value magick, value columns, value rows )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( columns, int );
	val_check( rows, int );

	wand = WAND( magick );

	return alloc_bool( MagickSampleImage( wand, val_int( columns ), val_int( rows ) ) );
}

/*
@description	scales the size of an image to the given dimensions.
@param			columns		The number of columns in the scaled image.
@param			rows		The number of rows in the scaled image.
*/
value nMagick_scale( value magick, value columns, value rows )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( columns, int );
	val_check( rows, int );

	wand = WAND( magick );

	return alloc_bool( MagickScaleImage( wand, val_int( columns ), val_int( rows ) ) );
}

/*
@description	applies a special effect to the image, similar to the effect 
				achieved in a photo darkroom by sepia toning. Threshold ranges 
				from 0 to QuantumRange and is a measure of the extent of the 
				sepia toning. A threshold of 80 is a good starting point for a 
				reasonable tone.
@param			threshold	Define the extent of the sepia toning.
*/
value nMagick_solarize( value magick, value threshold )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( threshold, float );

	wand = WAND( magick );

	return alloc_bool( MagickSolarizeImage( wand, val_float( threshold ) ) );
}

/*
@description	Sets the image size cols x rows.
@param			cols	width of the image.
@param			rows	height of the image.
*/
value nMagick_set_extent( value magick, value cols, value rows )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	return alloc_bool( MagickSetImageExtent( wand, val_int( cols ), val_int( rows ) ) );
}

/*
@description	Sets the image filename.
@param			Filename	The filename to set for the image.
*/
value nMagick_set_filename( value magick, value filename )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( filename, string );

	wand = WAND( magick );

	return alloc_bool( MagickSetImageFilename( wand, val_string( filename ) ) );
}

/*
@description	Shines a distant light on an image to create a three-dimensional 
				effect. You control the positioning of the light with azimuth and 
				elevation; azimuth is measured in degrees off the x axis and 
				elevation is measured in pixels above the Z axis.
@param			gray				A value other than zero shades the intensity 
				of each pixel.
@param			azimuth, elevation	Define the light source direction.
*/
value nMagick_shine( value magick, value gray, value azimuth, value elevation )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( gray, bool );
	val_check( azimuth, float );
	val_check( elevation, float );

	wand = WAND( magick );

	alloc_bool( MagickShadeImage( wand, val_bool( gray ), val_float( azimuth ), val_float( elevation ) ) );
}

/*
@description	Simulates an image shadow.
@param			radius	The radius of the Gaussian, in pixels, not counting the 
				center pixel.
@param			sigma	The standard deviation of the Gaussian, in pixels.
@param			point	The shadow offset.
*/
value nMagick_shadow( value magick, value radius, value sigma, value point )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( radius, float );
	val_check( sigma, float );
	val_check( point, object );

	wand = WAND( magick );

	return alloc_bool( MagickShadowImage( wand, val_float( radius ), val_float( sigma ), val_int( val_field( point, val_id( "x" ) ) ), val_int( val_field( point, val_id( "y" ) ) ) ) );
}

/*
@description	Sharpens an image. We convolve the image with a Gaussian operator 
				of the given radius and standard deviation (sigma). For reasonable 
				results, the radius should be larger than sigma. Use a radius of 0 
				and MagickSharpenImage() selects a suitable radius for you.
@param			radius	The radius of the Gaussian, in pixels, not counting the 
				center pixel.
@param			sigma	The standard deviation of the Gaussian, in pixels.
*/
value nMagick_sharpen( value magick, value radius, value sigma )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( radius, float );
	val_check( sigma, float );

	wand = WAND( magick );

	return alloc_bool( MagickSharpenImage( wand, val_float( radius ), val_float( sigma ) ) );
}

/*
@description	shaves pixels from the image edges. It allocates the memory 
				necessary for the new Image structure and returns a pointer to 
				the new image.
@param			cols	The number of columns in the scaled image.
@param			rows	The number of rows in the scaled image.
*/
value nMagick_shave( value magick, value cols, value rows )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( cols, int );
	val_check( rows, int );

	wand = WAND( magick );

	return alloc_bool( MagickShaveImage( wand, val_int( cols ), val_int( rows ) ) );
}

/*
@description	slides one edge of an image along the X or Y axis, creating a 
				parallelogram. An X direction shear slides an edge along the X axis, 
				while a Y direction shear slides an edge along the Y axis. The amount 
				of the shear is controlled by a shear angle. For X direction shears, 
				x_shear is measured relative to the Y axis, and similarly, for Y 
				direction shears y_shear is measured relative to the X axis. Empty 
				triangles left over from shearing the image are filled with the 
				background color.
@param			background	The background pixel wand.
@param			x_shear		The number of degrees to shear the image.
@param			y_shear		The number of degrees to shear the image.
*/
value nMagick_shear( value magick, value background, value x, value y )
{
	MagickWand *wand;
	PixelWand *bg;

	val_check_kind( magick, k_wand );
	val_check_kind( background, k_pixel );
	val_check( x, int );
	val_check( y, int );

	wand = WAND( magick );
	bg = PIXEL( background );

	return alloc_bool( MagickShearImage( wand,  bg, val_float( x ), val_float( y ) ) );
}

/*
@description	composites two images and produces a single image that is the 
				composite of a left and right image of a stereo pair.
@param			offset_wand		Another image wand.
*/
value nMagick_stereo( value magick, value offset_wand )
{
	MagickWand *wand;
	MagickWand *offset;
	value v;

	val_check_kind( magick, k_wand );
	val_check_kind( offset_wand, k_wand );

	wand = WAND( magick );
	offset = WAND( offset_wand );

	v = alloc_abstract( k_wand, MagickStereoImage( wand, offset_wand ) );
	val_gc( v, nMagick_close );
	return v;
}

/*
@description	Strips an image of all profiles and comments.
*/
value nMagick_strip( value magick )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );

	wand = WAND( magick );

	return alloc_bool( MagickStripImage( wand ) );
}

/*
@description	Swirls the pixels about the center of the image, where degrees 
				indicates the sweep of the arc through which each pixel is moved. 
				You get a more dramatic effect as the degrees move from 1 to 360.
@param			degrees		The amount to swirl.
*/
value nMagick_swirl( value magick, value degrees )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( degrees, float );

	wand = WAND( magick );

	return alloc_bool( MagickSwirlImage( wand, val_float( degrees ) ) );
}

/*
@description	Repeatedly tiles the texture image across and down the image canvas.
@param			texture_wand	The texture wand.
*/
value nMagick_texture( value magick, value texture )
{
	MagickWand *wand;
	MagickWand *texture_wand;

	val_check_kind( magick, k_wand );
	val_check_kind( texture, k_wand );

	wand = WAND( magick );
	texture_wand = WAND( texture );

	return alloc_bool( MagickTextureImage( wand, texture_wand ) );
}

/*
@description	changes the value of individual pixels based on the intensity of 
				each pixel compared to threshold. The result is a high-contrast, 
				two color image.
@param			threshold	Define the threshold value.
*/
value nMagick_threshold( value magick, value threshold )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( threshold, float );

	wand = WAND( magick );

	return alloc_bool( MagickThresholdImage( wand, val_float( threshold ) ) );
}

/*
@description	changes the size of an image to the given dimensions and removes 
				any associated profiles. The goal is to produce small low cost 
				thumbnail images suited for display on the Web.
@param			cols	The width of the thumb
@param			rows	The height of the thumb
*/
value nMagick_thumbnail( value magick, value cols, value rows )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( cols, int );
	val_check( rows, int );

	wand = WAND( magick );

	//return alloc_bool( MagickThumbnail( wand, val_int( cols ), val_int( rows ) ) );
}

/*
@description	applies a color vector to each pixel in the image. The length of the 
				vector is 0 for black and white and at its maximum for the midtones. 
				The vector weighting function is f(x)=(1-(4.0*((x-0.5)*(x-0.5)))).
@param			tint	The tint pixel wand.
@param			opacity	The opacity pixel wand.
*/
value nMagick_tint( value magick, value tint, value opacity )
{
	MagickWand *wand;
	PixelWand *t;
	PixelWand *o;

	val_check_kind( magick, k_wand );
	val_check_kind( tint, k_pixel );
	val_check_kind( opacity, k_pixel );

	wand = WAND( magick );
	t = PIXEL( tint );
	o = PIXEL( opacity );

	return alloc_bool( MagickTintImage( wand, t, o ) );
}

/*
@description	creates a "ripple" effect in the image by shifting the pixels 
				vertically along a sine wave whose amplitude and wavelength is 
				specified by the given parameters.
@param			amplitude	Define the amplitude of the sine wave.
@param			length	Define the wave length of the sine wave.
*/
value nMagick_wave( value magick, value amplitude, value length )
{
	MagickWand *wand;

	val_check_kind( magick, k_wand );
	val_check( amplitude, float );
	val_check( length, float );

	wand = WAND( magick );

	return alloc_bool( MagickWaveImage( wand, val_float( amplitude ), val_float( length ) ) );
}


value nMagick_matte_flood_fill( value *args, int nargs )
{
	if (nargs !=6 ) return;
	
	value magick	= args[0];
	value alpha		= args[1];
	value fuzz		= args[2];
	value color		= args[3];
	value x			= args[4];
	value y			= args[5];
	
	MagickWand *wand;
	PixelWand *c;

	val_check_kind( magick, k_wand );
	val_check( alpha, float );
	val_check( fuzz, float );
	val_check_kind( color, k_pixel );
	val_check( x, int );
	val_check( y, int );

	wand = WAND( magick );
	c = PIXEL( color );

	return alloc_bool( MagickMatteFloodfillImage( wand, val_float( alpha ), val_float( fuzz ), c, val_int( x ), val_int( y ) ) );
}

DEFINE_PRIM(nMagick_close,1);
DEFINE_PRIM(nMagick_init,0);
DEFINE_PRIM(nMagick_load,2);
DEFINE_PRIM(nMagick_save,2);

DEFINE_PRIM(nMagick_resize,3);
DEFINE_PRIM(nMagick_relinquish_memory,1);
DEFINE_PRIM(nMagick_adaptive_sharpen,3);
DEFINE_PRIM(nMagick_adaptive_threshold,4);
DEFINE_PRIM(nMagick_add_image,2);
DEFINE_PRIM(nMagick_add_noise,2);
DEFINE_PRIM(nMagick_affine_transform,2);
DEFINE_PRIM(nMagick_annotate,5);
DEFINE_PRIM(nMagick_black_threshold,2);
DEFINE_PRIM(nMagick_blur,3);
DEFINE_PRIM(nMagick_border,4);
DEFINE_PRIM(nMagick_charcoal,3);
DEFINE_PRIM(nMagick_chop,4);
DEFINE_PRIM(nMagick_colorfloodfill,5);
DEFINE_PRIM(nMagick_colorize,3);
DEFINE_PRIM(nMagick_comment,2);
DEFINE_PRIM(nMagick_composite,3);
DEFINE_PRIM(nMagick_contrast,2);
DEFINE_PRIM(nMagick_convolve,3);
DEFINE_PRIM(nMagick_crop,4);
DEFINE_PRIM(nMagick_despeckle,1);
DEFINE_PRIM(nMagick_draw,2);
DEFINE_PRIM(nMagick_edge,2);
DEFINE_PRIM(nMagick_emboss,3);
DEFINE_PRIM(nMagick_enhance,1);
DEFINE_PRIM(nMagick_equalize,1);
DEFINE_PRIM(nMagick_evaluate,3);
DEFINE_PRIM(nMagick_flatten,1);
DEFINE_PRIM(nMagick_flip,1);
DEFINE_PRIM(nMagick_flop,1);
DEFINE_PRIM(nMagick_gamma,2);
DEFINE_PRIM(nMagick_gaussian_blur,3);
DEFINE_PRIM(nMagick_get_region,4);
DEFINE_PRIM(nMagick_get_background_color,1);
DEFINE_PRIM(nMagick_set_background_color,2);
DEFINE_PRIM(nMagick_get_blob,1);
DEFINE_PRIM(nMagick_get_red_primary,1);
DEFINE_PRIM(nMagick_set_red_primary,2);
DEFINE_PRIM(nMagick_get_green_primary,1);
DEFINE_PRIM(nMagick_set_green_primary,2);
DEFINE_PRIM(nMagick_get_blue_primary,1);
DEFINE_PRIM(nMagick_set_blue_primary,2);
DEFINE_PRIM(nMagick_get_border_color,1);
DEFINE_PRIM(nMagick_set_border_color,2);
DEFINE_PRIM(nMagick_get_colormap_color,3);
DEFINE_PRIM(nMagick_set_colormap_color,3);
DEFINE_PRIM(nMagick_get_colors_length,1);
DEFINE_PRIM(nMagick_get_colorspace,1);
DEFINE_PRIM(nMagick_set_colorspace,2);
DEFINE_PRIM(nMagick_get_composite,1);
DEFINE_PRIM(nMagick_set_composite,2);
DEFINE_PRIM(nMagick_get_compression,1);
DEFINE_PRIM(nMagick_set_compression,2);
DEFINE_PRIM(nMagick_set_compression_quality,2);
DEFINE_PRIM(nMagick_get_depth,1);
DEFINE_PRIM(nMagick_set_depth,2);
DEFINE_PRIM(nMagick_get_distortion,3);
DEFINE_PRIM(nMagick_get_extrema,1);
DEFINE_PRIM(nMagick_get_dispose,1);
DEFINE_PRIM(nMagick_get_attribute,2);
DEFINE_PRIM(nMagick_set_attribute,3);
DEFINE_PRIM(nMagick_get_format,1);
DEFINE_PRIM(nMagick_set_format,2);
DEFINE_PRIM(nMagick_get_gamma,1);
DEFINE_PRIM(nMagick_set_gamma,2);
DEFINE_PRIM(nMagick_get_width,1);
DEFINE_PRIM(nMagick_get_height,1);
DEFINE_PRIM(nMagick_get_interlace_scheme,1);
DEFINE_PRIM(nMagick_set_interlace_scheme,2);
DEFINE_PRIM(nMagick_get_matte,1);
DEFINE_PRIM(nMagick_set_matte,2);
DEFINE_PRIM(nMagick_get_matte_color,1);
DEFINE_PRIM(nMagick_set_matte_color,2);
DEFINE_PRIM(nMagick_get_pixel_color,2);
DEFINE_PRIM(nMagick_get_rendering_intent,1);
DEFINE_PRIM(nMagick_set_rendering_intent,2);
DEFINE_PRIM(nMagick_get_resolution,1);
DEFINE_PRIM(nMagick_set_resolution,3);
DEFINE_PRIM(nMagick_get_size,1);
DEFINE_PRIM(nMagick_get_type,1);
DEFINE_PRIM(nMagick_set_type,2);
DEFINE_PRIM(nMagick_get_units,1);
DEFINE_PRIM(nMagick_set_units,2);
DEFINE_PRIM(nMagick_get_white_point,1);
DEFINE_PRIM(nMagick_set_white_point,3);
DEFINE_PRIM(nMagick_implode,2);
DEFINE_PRIM(nMagick_label,2);
DEFINE_PRIM(nMagick_level,4);
DEFINE_PRIM(nMagick_magnify,1);
DEFINE_PRIM(nMagick_map,3);
DEFINE_PRIM(nMagick_median_filter,2);
DEFINE_PRIM(nMagick_minify,1);
DEFINE_PRIM(nMagick_modulate,4);
DEFINE_PRIM(nMagick_motion_blur,4);
DEFINE_PRIM(nMagick_negate,2);
DEFINE_PRIM(nMagick_new,4);
DEFINE_PRIM(nMagick_normalize,1);
DEFINE_PRIM(nMagick_oil_painting,2);
DEFINE_PRIM(nMagick_paint_transparent,4);
DEFINE_PRIM(nMagick_posterize,3);
DEFINE_PRIM(nMagick_quantize,4);
DEFINE_PRIM(nMagick_radial_blur,2);
DEFINE_PRIM(nMagick_raise,3);
DEFINE_PRIM(nMagick_load_blob,3);
DEFINE_PRIM(nMagick_reduce_noise,2);
DEFINE_PRIM(nMagick_resample,5);
DEFINE_PRIM(nMagick_roll,3);
DEFINE_PRIM(nMagick_rotate,3);
DEFINE_PRIM(nMagick_sample,3);
DEFINE_PRIM(nMagick_scale,3);
DEFINE_PRIM(nMagick_solarize,2);
DEFINE_PRIM(nMagick_set_extent,3);
DEFINE_PRIM(nMagick_set_filename,3);
DEFINE_PRIM(nMagick_shine,4);
DEFINE_PRIM(nMagick_shadow,4);
DEFINE_PRIM(nMagick_sharpen,3);
DEFINE_PRIM(nMagick_shave,3);
DEFINE_PRIM(nMagick_shear,4);
DEFINE_PRIM(nMagick_stereo,2);
DEFINE_PRIM(nMagick_strip,1);
DEFINE_PRIM(nMagick_swirl,2);
DEFINE_PRIM(nMagick_texture,2);
DEFINE_PRIM(nMagick_threshold,2);
DEFINE_PRIM(nMagick_thumbnail,3);
DEFINE_PRIM(nMagick_tint,3);
DEFINE_PRIM(nMagick_wave,3);
DEFINE_PRIM(set_exception_handler,1);
DEFINE_PRIM(nMagick_white_threshold,2);
DEFINE_PRIM_MULT(nMagick_matte_flood_fill);
