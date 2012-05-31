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

package neko.imagemagick;

typedef ImagickCompositeOperator = haxe.imagemagick.internal.ImagickCompositeOperator;
typedef ImagickNoiseType = haxe.imagemagick.internal.ImagickNoiseType;
typedef ImagickEvaluateOperator = haxe.imagemagick.internal.ImagickEvaluateOperator;
typedef ImagickColorSpace = haxe.imagemagick.internal.ImagickColorSpace;
typedef ImagickCompression = haxe.imagemagick.internal.ImagickCompression;
typedef ImagickMetric = haxe.imagemagick.internal.ImagickMetric;
typedef ImagickDisposalMethod = haxe.imagemagick.internal.ImagickDisposalMethod;
typedef ImagickImageType = haxe.imagemagick.internal.ImagickImageType;
typedef ImagickResolutionUnits = haxe.imagemagick.internal.ImagickResolutionUnits;
typedef ImagickFilter = haxe.imagemagick.internal.ImagickFilter;

class Imagick
{
	private var __m : Void;
	
	public var backgroundColor (getBackgroundColor,setBackgroundColor) : ImagickPixel;
	public var redPrimary (getRedPrimary,setRedPrimary) : ImagickPoint;
	public var greenPrimary (getGreenPrimary,setGreenPrimary) : ImagickPoint;
	public var bluePrimary (getBluePrimary,setBluePrimary) : ImagickPoint;
	public var borderColor (getBorderColor,setBorderColor) : ImagickPixel;
	public var composite (getComposite,setComposite) : ImagickCompositeOperator;
	public var compression (getCompression,setCompression) : ImagickCompression;
	public var depth (getDepth,setDepth) : Int;
	public var format (getFormat,setFormat) : String;
	public var gamma (getGamma,setGamma) : Float;
	public var matte (getMatte,setMatte) : Bool;
	public var matteColor (getMatteColor,setMatteColor) : ImagickPixel;
	public var units (getUnits,setUnits) : ImagickResolutionUnits;
	public var whitePoint (getWhitePoint,setWhitePoint) : ImagickPoint;
	public var width (getWidth,null) : Int;
	public var height (getHeight,null) : Int;
	
	public function new(?file:String, ?handle:Void) : Void
	{
		if (handle != null)
		{
			__m = handle;
		}
		else
		{
			__m = nMagick_init();
		}
		
		load(file);
	}
	
	public function newImage(w:Int, h:Int, color:ImagickPixel) : Void
	{
		nMagick_new( __m, w, h, color.__d );
	}
	
	public function load( file : String ) : Void
	{
		if ( file != null && file != "")
		{
			if (neko.FileSystem.exists(file))
			{
				nMagick_load( __m, untyped file.__s );
			}
			else
			{
				throw "Image file '" + file + "' is not found.";
			}

		}
	}
	
	public function save( file : String ) : Void
	{
		if ( file != null && file != "" )
		{
			nMagick_save( __m, untyped file.__s );
		}
	}
	
	public function destroy() : Void
	{
		nMagick_destroy( __m );
	}

	public function clear() : Void
	{
		nMagick_clear( __m );
	}
	
	public static function getNoiseType(noiseType:ImagickNoiseType) : Int
	{
		return switch (noiseType)
		{
			case Uniform:					1;
			case Gaussian:					2;
			case MultiplicativeGaussian:	3;
			case Impulse:					4;
			case Laplacian:					5;
			default:						6;
		}
	}
	
	public static function getEvaluateOperator(op:ImagickEvaluateOperator) : Int
	{
		return switch (op)
		{
			case Undefined:		0;
			case Add:			1;
			case And:			2;
			case Divide:		3;
			case LeftShift:		4;
			case Max:			5;
			case Min:			6;
			case Multiply:		7;
			case Or:			8;
			case RightShift:	9;
			case Set:			10;
			case Subtract:		11;
			default:			12;
		}
	}
	
	public static function getColorSpaceInt(cs:ImagickColorSpace) : Int
	{
		return switch(cs)
		{			
			case RGB:				1;
			case GRAY:				2;
			case Transparent:		3;
			case OHTA:				4;
			case LAB:				5;
			case XYZ:				6;
			case YCbCr:				7;
			case YCC:				8;
			case YIQ:				9;
			case YPbPr:				10;
			case YUV:				11;
			case CMYK:				12;
			case sRGB:				13;
			case HSB:				14;
			case HSL:				15;
			case HWB:				16;
			default:				0;
		}
	}
	
	public static function getColorSpaceEnum(cs:Int) : ImagickColorSpace
	{
		return switch(cs)
		{
			case 1:		ImagickColorSpace.RGB;
			case 2:		ImagickColorSpace.GRAY;
			case 3:		ImagickColorSpace.Transparent;
			case 4:		ImagickColorSpace.OHTA;
			case 5:		ImagickColorSpace.LAB;
			case 6:		ImagickColorSpace.XYZ;
			case 7:		ImagickColorSpace.YCbCr;
			case 8:		ImagickColorSpace.YCC;
			case 9:		ImagickColorSpace.YIQ;
			case 10:	ImagickColorSpace.YPbPr;
			case 11:	ImagickColorSpace.YUV;
			case 12:	ImagickColorSpace.CMYK;
			case 13:	ImagickColorSpace.sRGB;
			case 14:	ImagickColorSpace.HSB;
			case 15:	ImagickColorSpace.HSL;
			case 16:	ImagickColorSpace.HWB;
			default:	ImagickColorSpace.Undefined;
		}
	}
	
	public static function getCompressionId(c:ImagickCompression) : Int
	{
		return switch(c)
		{
			case Undefined:		0;
			case No:			1;
			case BZip:			2;
			case Fax:			3;
			case Group4:		4;
			case JPEG:			5;
			case LosslessJPEG:	7;
			case LZW:			8;
			case RLE:			9;
			default:			10;
		}
	}
	
	public static function getCompressionEnum(c:Int) : ImagickCompression
	{
		return switch(c)
		{
			case 0:	ImagickCompression.Undefined;
			case 1:	ImagickCompression.No;
			case 2:	ImagickCompression.BZip;
			case 3:	ImagickCompression.Fax;
			case 4:	ImagickCompression.Group4;
			case 5:	ImagickCompression.JPEG;
			case 7:	ImagickCompression.LosslessJPEG;
			case 8:	ImagickCompression.LZW;
			case 9:	ImagickCompression.RLE;
			default:ImagickCompression.Zip;
		}
	}
	
	public static function getMetricId(c:ImagickMetric) : Int
	{
		return switch(c)
		{
			case Undefined:				0;
			case MeanAbsoluteError:		1;
			case MeanSquaredError:		2;
			case PeakAbsoluteError:		3;
			case PeakSignalToNoiseRatio:4;
			default:					5;
		}
	}
	
	public static function getDisposalMethodEnum(d:Int) : ImagickDisposalMethod
	{
		return switch(d)
		{
			case 1:		ImagickDisposalMethod.None;
			case 2:		ImagickDisposalMethod.Background;
			case 3:		ImagickDisposalMethod.Previous;
			default:	ImagickDisposalMethod.Unrecognized;
		}
	}
	
	public static function getImageTypeId(t:ImagickImageType) : Int
	{
		return switch(t)
		{
			case Bilevel:				1;
			case Grayscale:				2;
			case GrayscaleMatte:		3;
			case Palette:				4;
			case PaletteMatte:			5;
			case TrueColor:				6;
			case TrueColorMatte:		7;
			case ColorSeparation:		8;
			case ColorSeparationMatte:	9;
			case Optimize:				10;
			default:					0;
		}
	}
	
	public static function getImageTypeEnum(t:Int) : ImagickImageType
	{
		return switch(t)
		{
			case 1:	ImagickImageType.Bilevel;
			case 2:	ImagickImageType.Grayscale;
			case 3:	ImagickImageType.GrayscaleMatte;
			case 4:	ImagickImageType.Palette;
			case 5:	ImagickImageType.PaletteMatte;
			case 6:	ImagickImageType.TrueColor;
			case 7:	ImagickImageType.TrueColorMatte;
			case 8:	ImagickImageType.ColorSeparation;
			case 9:	ImagickImageType.ColorSeparationMatte;
			case 10:ImagickImageType.Optimize;
			default:ImagickImageType.Undefined;
		}
	}
	
	public static function getResolutionUnitsId(u:ImagickResolutionUnits) : Int
	{
		return switch(u)
		{
			case PixelsPerInch:			1;
			case PixelsPerCentimeter:	2;
			default:					0;
		}
	}
	
	public static function getResolutionUnitsEnum(u:Int) : ImagickResolutionUnits
	{
		return switch(u)
		{
			case 1:		ImagickResolutionUnits.PixelsPerInch;
			case 2:		ImagickResolutionUnits.PixelsPerCentimeter;
			default:	ImagickResolutionUnits.Undefined;
		}
	}
	
	public static function getFilterId(f:ImagickFilter) : Int
	{
		return switch(f)
		{
			case Point:		1;
			case Box:		2;
			case Triangle:	3;
			case Hermite:	4;
			case Hanning:	5;
			case Hamming:	6;
			case Blackman:	7;
			case Gaussian:	8;
			case Quadratic:	9;
			case Cubic:		0;
			case Catrom:	11;
			case Mitchell:	12;
			case Lanczos:	13;
			case Bessel:	14;
			case Sinc:		15;
			default:		0;
		}
	}
	
	public static function getFilterEnum(f:Int) : ImagickFilter
	{
		return switch(f)
		{
			case 1:		ImagickFilter.Point;
			case 2:		ImagickFilter.Box;
			case 3:		ImagickFilter.Triangle;
			case 4:		ImagickFilter.Hermite;
			case 5:		ImagickFilter.Hanning;
			case 6:		ImagickFilter.Hamming;
			case 7:		ImagickFilter.Blackman;
			case 8:		ImagickFilter.Gaussian;
			case 9:		ImagickFilter.Quadratic;
			case 10:	ImagickFilter.Cubic;
			case 11:	ImagickFilter.Catrom;
			case 12:	ImagickFilter.Mitchell;
			case 13:	ImagickFilter.Lanczos;
			case 14:	ImagickFilter.Bessel;
			case 15:	ImagickFilter.Sinc;
			default:	ImagickFilter.Undefined;
		}
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
	public function adaptiveSharpen( radius : Float, sigma : Float ) : Bool
	{
		return nMagick_adaptive_sharpen( __m, radius, sigma );
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
	public function adaptiveThreshold( width : Int, height : Int, offset : Int ) : Bool
	{
		return nMagick_adaptive_threshold( __m, width, height, offset );
	}

	/*
	@description	Adds the specified images at the current image location.

	@param			nMagick	The image to add to the current image.
	*/
	public function addImage( m : Imagick ) : Bool
	{
		return nMagick_add_image( __m, untyped m.__m );
	}

	/*
	@description	Adds random noise to the image.

	@param			noise_type	The type of noise: UniformNoise = 1, GaussianNoise = 2, MultiplicativeGaussianNoise = 3, ImpulseNoise = 4, LaplacianNoise = 5, or PoissonNoise = 6.
	*/
	public function addNoise( noise_type : ImagickNoiseType ) : Bool
	{
		return nMagick_add_noise( __m, getNoiseType( noise_type ) );
	}

	/*
	@description	transforms an image as dictated by the affine matrix of the drawing 
					wand.

	@param
	*/
	public function affineTransform( draw_magick : ImagickDraw ) : Bool
	{
		return nMagick_affine_transform( __m, untyped draw_magick.__d );
	}

	/*
	@description	Annotates an image with text.

	@param			drawing_wand	The draw wand.
	@param			point			x and y ordinate to left and baseline of text.
	@param			angle			rotate text relative to this angle.
	@param			text			text to draw.
	*/
	public function annotate( draw_magick : ImagickDraw, point : ImagickPoint, angle : Int, text : String ) : Bool
	{
		return nMagick_annotate( __m, untyped draw_magick.__d, point, angle, untyped text.__s );
	}

	/*
	@description	Like MagickThresholdImage() but forces all pixels below the threshold 
					into black while leaving all pixels above the threshold unchanged.
	@param			Threshold	The PixelWand.
	*/
	public function blackThreshold( threshold : ImagickPixel ) : Bool
	{
		return nMagick_black_threshold( __m, untyped threshold.__d );
	}

	/*
	@description	blurs an image. We convolve the image with a gaussian operator 
					of the given radius and standard deviation (sigma). For reasonable 
					results, the radius should be larger than sigma. Use a radius of 0 
					and BlurImage() selects a suitable radius for you.

	@param			radius	The radius of the , in pixels, not counting the center pixel.
	@param			sigma	The standard deviation of the , in pixels.
	*/
	public function blur( radius : Int, sigma : Int ) : Bool
	{
		return nMagick_blur( __m, radius, sigma );
	}

	/*
	@description	surrounds the image with a border of the color defined by the 
					bordercolor pixel wand.

	@param			bordercolor	The border color pixel wand.
	@param			width		The border width.
	@param			height		The border height.
	*/
	public function border( bordercolor : ImagickPixel, width : Int, height : Int ) : Bool
	{
		return nMagick_border( __m, untyped bordercolor.__d, width, height );
	}
	
	/*
	@description	Simulates a charcoal drawing.

	@param			radius	The radius of the Gaussian, in pixels, 
					not counting the center pixel.
	@param			sigma		The standard deviation of the Gaussian, in pixels.
	*/
	public function charcoal( radius : Int, sigma : Int ) : Bool
	{
		return nMagick_charcoal( __m, radius, sigma );
	}
	
	/*
	@description	Removes a region of an image and collapses the image to occupy the removed portion.

	@param			width		The region width.
	@param			height	The region height.
	@param			point		x and y of the region offset.
	*/
	public function chop( width : Int, height : Int, point : ImagickPoint ) : Bool
	{
		return nMagick_chop( __m, width, height, point );
	}
	
	public function resize( w : Int, h : Int ) : Void
	{
		nMagick_resize( __m, w, h );
	}
	
	public function edge( r : Float ) : Void
	{
		nMagick_edge( __m, r );
	}
	
	public function emboss( r : Float, s : Float ) : Void
	{
		nMagick_emboss( __m, r, s );
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
	public function colorFloodFill( fill : ImagickPixel, fuzz : Float, bordercolor : ImagickPixel, point : ImagickPoint ) : Bool
	{
		return nMagick_colorfloodfill( __m, untyped fill.__d, fuzz, untyped bordercolor.__d, point );
	}

	/*
	@description	Blends the fill color with each pixel in the image.

	@param			colorize	The colorize pixel wand.
	@param			opacity		The opacity pixel wand.
	*/
	public function colorize( colorize : ImagickPixel, opacity : ImagickPixel ) : Bool
	{
		return nMagick_colorize( __m, untyped colorize.__d, untyped opacity.__d );
	}

	/*
	@description	Adds a comment to your image.

	@param			
	*/
	public function comment( text : String ) : Bool
	{
		return nMagick_comment( __m, untyped text.__s );
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
	public function compositeImage( composite_wand : Imagick, composite : ImagickCompositeOperator, point : ImagickPoint ) : Bool
	{
		return nMagick_composite( __m, untyped composite_wand.__m, Type.enumIndex(composite), point );
	}

	/*
	@description	enhances the intensity differences between the lighter and darker 
					elements of the image. Set sharpen to a value other than 0 to 
					increase the image contrast otherwise the contrast is reduced.
	@param			sharpen		0 to reduce contrast, other int to increase contrast
	*/
	public function contrast( sharpen : Int ) : Bool
	{
		return nMagick_contrast( __m, sharpen );
	}

	/*
	@description	Applies a custom convolution kernel to the image.

	@param			order	The number of columns and rows in the filter kernel.
	@param			kernel	An array of doubles representing the convolution kernel.
	
	TODO : write a function to convert an array of values to an array of doubles
	*/
	public function convolve( order : Int, kernal : Float ) : Bool
	{
		return nMagick_convolve( __m, order, kernal );
	}

	/*
	@description	Extracts a region of the image.

	@param			width	The region width.
	@param			height	The region height.
	@param			point	The region x,y offset.
	*/
	public function crop( width : Int, height : Int, point : ImagickPoint ) : Bool
	{
		return nMagick_crop( __m, width, height, point );
	}

	/*
	@description	Reduces the speckle noise in an image while perserving the edges of the original image.
	*/
	public function despeckle()
	{
		return nMagick_despeckle( __m );
	}

	/*
	@description	Renders the drawing wand on the current image.

	@param			drawing_wand	image to draw.
	*/
	public function draw( drawing_wand : Imagick ) : Bool
	{
		return nMagick_draw( __m, untyped drawing_wand.__m );
	}

	/*
	@description	Applies a digital filter that improves the quality of a noisy image.
	*/
	public function enhance() : Bool
	{
		return nMagick_enhance( __m );
	}

	/*
	@description	Equalizes the image histogram.
	*/
	public function equalize() : Bool
	{
		return nMagick_equalize( __m );
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
	public function evaluate( op : ImagickEvaluateOperator, constant : Float )
	{
		return nMagick_evaluate( __m, getEvaluateOperator( op ), constant );
	}

	/*
	@description	Merges a sequence of images. This is useful for combining Photoshop 
					layers into a single image.
	*/
	public function flatten() : Bool
	{
		return nMagick_flatten( __m );
	}

	/*
	@description	Creates a vertical mirror image by reflecting the pixels around 
					the central x-axis.
	*/
	public function verticalFlip() : Bool
	{
		return nMagick_flip( __m );
	}

	/*
	@description	Creates a horizontal mirror image by reflecting the pixels around 
					the central y-axis.
	*/
	public function horizontalFlip() : Bool
	{
		return nMagick_flop( __m );
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
	public function gammaImage( g : Float ) : Bool
	{
		return nMagick_gamma( __m, g );
	}

	/*
	@description	Blurs an image. We convolve the image with a Gaussian operator 
					of the given radius and standard deviation (sigma). For reasonable 
					results, the radius should be larger than sigma. Use a radius of 0
					and MagickGaussianBlurImage() selects a suitable radius for you.
	*/
	public function gaussianBlur( radius : Float, sigma : Float ) : Bool
	{
		return nMagick_gaussian_blur( __m, radius, sigma );
	}

	/*
	@description	Extracts a region of the image and returns it as a a new wand.
	@param			width	The region width.
	@param			height	The region height.
	@param			point	The region offset.
	*/
	public function getRegion( width : Int, height : Int, point : ImagickPoint ) : Imagick
	{
		var m = new Imagick();
		untyped m.__m = nMagick_get_region( __m, width, height, point );
		return m;
	}
	
	/*
	@description	Returns the image background color.
	*/
	public function getBackgroundColor()
	{
		var p = new ImagickPixel();
		untyped p.__d = nMagick_get_background_color( __m );
		return p;
	}

	/*
	@description	Sets the image background color.
	*/
	public function setBackgroundColor( color : ImagickPixel )
	{
		nMagick_set_background_color( __m, untyped color.__d );
		return null;
	}

	/*
	@description	Implements direct to memory image formats. It returns the image as a blob and its length. Use MagickSetFormat() to set the format of the returned blob (GIF, JPEG, PNG, etc.).

					Use MagickRelinquishMemory() to free the blob when you are done with it.
	*/
	public function getBlob() : String
	{
		var o = neko.Lib.nekoToHaxe( nMagick_get_blob( __m ) );
		return o;
	}

	/*
	@description	Returns the chromaticy red primary point.
	*/
	public function getRedPrimary() : ImagickPoint
	{
		var o = nMagick_get_red_primary( __m );
		return new ImagickPoint( o.x, o.y );
	}

	/*
	@description	Sets the chromaticy red primary point.
	@param			ImagickPoint	The chromaticity red primary point.
	*/
	public function setRedPrimary( point : ImagickPoint )
	{
		nMagick_set_red_primary( __m, point );
		return null;
	}

	/*
	@description	Returns the chromaticy green primary point.
	@param			ImagickPoint	The chromaticity green primary point.
	*/
	public function getGreenPrimary() : ImagickPoint
	{
		var o = nMagick_get_green_primary( __m );
		return new ImagickPoint( o.x, o.y );
	}

	/*
	@description	Sets the chromaticy green primary point.
	@param			ImagickPoint	The chromaticity green primary point.
	*/
	public function setGreenPrimary( point : ImagickPoint )
	{
		nMagick_set_green_primary( __m, point );
		return null;
	}

	/*
	@description	Returns the chromaticy blue primary point for the image.
	@param			ImagickPoint	The chromaticity blue primary point.
	*/
	public function getBluePrimary() : ImagickPoint
	{
		var o = nMagick_get_blue_primary( __m );
		return new ImagickPoint( o.x, o.y );
	}

	/*
	@description	Sets the chromaticy blue primary point for the image.
	@param			ImagickPoint	The chromaticity blue primary point.
	*/
	public function setBluePrimary( point : ImagickPoint )
	{
		nMagick_set_blue_primary( __m, point );
		return null;
	}

	/*
	@description	Returns the image border color.
	*/
	public function getBorderColor() : ImagickPixel
	{
		var p = new ImagickPixel();
		untyped p.__d = nMagick_get_border_color( __m );
		return p;
	}

	/*
	@description	Sets the image border color.
	@param			border_color	Return the border color.
	*/
	public function setBorderColor( border_color : ImagickPixel )
	{
		nMagick_set_border_color( __m, untyped border_color.__d );
		return null;
	}

	/*
	@description	Returns the color of the specified colormap index.
	@param			index	The offset into the image colormap.
	@param			color	Return the colormap color in this wand.
	*/
	public function getColorMapColor( index : Int ) : ImagickPixel
	{
		var p = new ImagickPixel();
		untyped p.__d = nMagick_get_colormap_color( __m, index );
		return p;
	}

	/*
	@description	Sets the color of the specified colormap index.
	@param			index	The offset into the image colormap.
	@param			color	Set the colormap color in this wand.
	*/
	public function setColorMapColor( index : Int, color : ImagickPixel )
	{
		nMagick_set_colormap_color( __m, index, untyped color.__d );
		return null;
	}

	/*
	@description	Gets the number of unique colors in the image.
	*/
	public function getColorsLength() : Int
	{
		return nMagick_get_colors_length( __m );
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
	public function getColorSpace() : ImagickColorSpace
	{
		return getColorSpaceEnum( nMagick_get_colorspace( __m ) );
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
	public function setColorSpace( colorspace : ImagickColorSpace )
	{
		nMagick_set_colorspace( __m, getColorSpaceInt( colorspace ) );
		return null;
	}

	public function getComposite() : ImagickCompositeOperator
	{
		return Type.createEnumIndex(ImagickCompositeOperator, nMagick_get_composite( __m ));
	}

	public function setComposite(comp:ImagickCompositeOperator)
	{
		nMagick_set_composite(__m, Type.enumIndex(comp));
		return null;
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
	public function getCompression() : ImagickCompression
	{
		return getCompressionEnum( nMagick_get_compression( __m ) );
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
	public function setCompression( c : ImagickCompression )
	{
		nMagick_set_compression( __m, getCompressionId( c ) );
		return null;
	}

	/*
	@description	Sets the image compression quality.
	*/
	public function setCompressionQuality( quality : Int )
	{
		nMagick_set_compression_quality( __m, quality );
		return null;
	}

	/*
	@description	Gets the image depth.
	*/
	public function getDepth() : Int
	{
		return nMagick_get_depth( __m );
	}

	/*
	@description	Sets the image depth.
	*/
	public function setDepth( depth : Int )
	{
		nMagick_set_depth( __m, depth );
		return null;
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
	public function getDistortion( ref : Imagick, metric : ImagickMetric ) : Float
	{
		return nMagick_get_distortion( __m, untyped ref.__m, getMetricId( metric ) );
	}
	
	/*
	@description	Gets the extrema for the image.
	*/
	public function getExtrema() : ImagickPoint
	{
		var p = nMagick_get_extrema( __m );
		return new ImagickPoint( p.x, p.y );
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
	public function getDispose()
	{
		return getDisposalMethodEnum( nMagick_get_dispose( __m ) );
	}

	/*
	@description	Returns a value associated with the specified key. 
					Use MagickRelinquishMemory() to free the value when you are 
					finished with it.
	@param			key		The key.
	*/
	public function getAttribute( key : String ) : String
	{
		return neko.Lib.nekoToHaxe( nMagick_get_attribute( __m, untyped key.__s ) );
	}

	/*
	@description	Associates an attribute with an image.
	@param			key		The key.
	@param			attrib	Its value.
	*/
	public function setAttribute( key : String, attrib : String )
	{
		nMagick_set_attribute( __m, untyped key.__s, untyped attrib.__s );
		return null;
	}

	/*
	@description	Returns the format of a particular image in a sequence.
	*/
	public function getFormat() : String
	{
		return neko.Lib.nekoToHaxe( nMagick_get_format( __m ) );
	}

	/*
	@description	Sets the format of a particular image in a sequence.
	*/
	public function setFormat( f : String )
	{
		nMagick_set_format( __m, untyped f.__s );
		return null;
	}

	/*
	@description	Gets the image gamma.
	*/
	public function getGamma() : Float
	{
		return nMagick_get_gamma( __m );
	}

	/*
	@description	Sets the image gamma.
	*/
	public function setGamma( g : Float )
	{
		nMagick_set_gamma( __m, g );
		return null;
	}

	/*
	@description	Returns MagickTrue if the image has a matte channel 
					otherwise MagickFalse.
	*/
	public function getMatte() : Bool
	{
		return nMagick_get_matte( __m );
	}

	/*
	@description	sets the image matte channel.
	*/
	public function setMatte( m : Bool )
	{
		nMagick_set_matte( __m, m );
		return null;
	}

	/*
	@description	Returns the image matte color.
	@param			matte_color		Return the matte color.
	*/
	public function getMatteColor() : ImagickPixel
	{
		var p = new ImagickPixel();
		untyped p.__d = nMagick_get_matte_color( __m );
		return p;
	}

	/*
	@description	Sets the image matte color.
	@param			matte_color		Return the matte color.
	*/
	public function setMatteColor( mc : ImagickPixel )
	{
		nMagick_set_matte_color( __m, untyped mc.__d );
		return null;
	}

	/*
	@description	Returns the color of the specified pixel.
	*/
	public function getPixelColor( pt : ImagickPoint ) : ImagickPixel
	{
		var p = new ImagickPixel();
		untyped p.__d = nMagick_get_pixel_color( __m, pt );
		return p;
	}

	/*
	@description	Gets the image X and Y resolution.
	*/
	public function getResolution() : ImagickPoint
	{
		var p = nMagick_get_resolution( __m );
		return new ImagickPoint( p.x, p.y );
	}

	/*
	@description	Sets the image X and Y resolution.
	@param			x	The new width.
	@param			y	The new height.
	*/
	public function setResolution( x : Int, y : Int )
	{
		nMagick_set_resolution( __m, x, y );
		return null;
	}

	/*
	@description	Returns the size (in bytes) of the current active image.
	*/
	public function getSize() : Int
	{
		return nMagick_get_size( __m );
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
	public function getType() : ImagickImageType
	{
		return getImageTypeEnum( nMagick_get_type( __m ) );
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
	public function setType( t : ImagickImageType )
	{
		nMagick_set_type( __m, getImageTypeId( t ) );
		return null;
	}

	/*
	@description	Gets the image units of resolution.
	@return			Returns resolution type as int

		UndefinedResolution = 0
		PixelsPerInchResolution = 1
		PixelsPerCentimeterResolution = 2
	*/
	public function getUnits() : ImagickResolutionUnits
	{
		return getResolutionUnitsEnum( nMagick_get_units( __m ) );
	}

	/*
	@description	Sets the image units of resolution.
	@param			units	resolution type as int

		UndefinedResolution = 0
		PixelsPerInchResolution = 1
		PixelsPerCentimeterResolution = 2
	*/
	public function setUnits( u : ImagickResolutionUnits )
	{
		nMagick_set_units( __m, getResolutionUnitsId( u ) );
		return null;
	}

	/*
	@description	Returns the chromaticy white point.
	*/
	public function getWhitePoint() : ImagickPoint
	{
		var p = nMagick_get_white_point( __m );
		return new ImagickPoint( p.x, p.y );
	}

	/*
	@description	Sets the chromaticy white point.
	@param			x	The horizontal location.
	@param			y	The vertical location.
	*/
	public function setWhitePoint( p : ImagickPoint )
	{
		nMagick_set_white_point( __m, p.x, p.y );
		return null;
	}

	/*
	@description	Returns the image width.
	*/
	public function getWidth() : Int
	{
		return nMagick_get_width( __m );
	}

	/*
	@description	Returns the image height.
	*/
	public function getHeight() : Int
	{
		return nMagick_get_height( __m );
	}

	/*
	@description	Creates an implode effect.
	*/
	public function implode( radius : Float ) : Bool
	{
		return nMagick_implode( __m, radius );
	}

	/*
	@description	Adds a label to your image.
	@param			Label	The label to add to your image.
	*/
	public function label( text : String ) : Bool
	{
		return nMagick_label( __m, untyped label.__s );
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
	public function level( blackPoint : Float, gamma : Float, whitePoint : Float ) : Bool
	{
		return nMagick_level( __m, blackPoint, gamma, whitePoint );
	}

	/*
	@description	A convenience method that scales an image proportionally to twice 
					its original size.
	*/
	public function magnify() : Bool
	{
		return nMagick_magnify( __m );
	}

	/*
	@description	Replaces the colors of an image with the closest color from a 
					reference image.
	*/
	public function map( magickb : Imagick, dither : Bool ) : Bool
	{
		return nMagick_map( __m, untyped magickb.__m, dither );
	}

	/*
	@description	Applies a digital filter that improves the quality of a noisy image. 
					Each pixel is replaced by the median in a set of neighboring pixels 
					as defined by radius.
	@param			radius	The radius of the pixel neighborhood.
	*/
	public function medianFilter( radius : Float ) : Bool
	{
		return nMagick_median_filter( __m, radius );
	}

	/*
	@description	A convenience method that scales an image proportionally to one-half
					its original size.
	*/
	public function minify() : Bool
	{
		return nMagick_minify( __m );
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
	public function modulate( brightness : Float, saturation : Float, hue : Float ) : Bool
	{
		return nMagick_modulate( __m, brightness, saturation, hue );
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
	public function motionBlur( radius : Float, sigma : Float, angle : Float ) : Bool
	{
		return nMagick_motion_blur( __m, radius, sigma, angle );
	}

	/*
	@description	negates the colors in the reference image. The Greyscale option 
					means that only greyscale values within the image are negated.
	@param			grey	If MagickTrue, only negate grayscale pixels within the image.
	*/
	public function negate( grey : Bool ) : Bool
	{
		return nMagick_negate( __m, grey );
	}

	/*
	@description	Enhances the contrast of a color image by adjusting the pixels 
					color to span the entire range of colors available
	*/
	public function normalize() : Bool
	{
		return nMagick_normalize( __m );
	}

	/*
	@description	applies a special effect filter that simulates an oil painting. 
					Each pixel is replaced by the most frequent color occurring in a 
					circular region defined by radius.
	@param			radius	The radius of the circular neighborhood.
	*/
	public function oilPainting( radius : Float ) : Bool
	{
		return nMagick_oil_painting( __m, radius );
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
	public function paintTransparent( target : ImagickPixel, opacity : Float, fuzz : Float ) : Bool
	{
		return nMagick_paint_transparent( __m, untyped target.__d, opacity, fuzz );
	}

	/*
	@description	Reduces the image to a limited number of color levels.
	@param			levels	Number of color levels allowed in each channel. 
					Very low values (2, 3, or 4) have the most visible effect.
	@param			dither	Set this integer value to something other than 
					zero to dither the mapped image.
	*/
	public function posterize( levels : Int, dither : Bool ) : Bool
	{
		return nMagick_posterize( __m, levels, dither );
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
	public function quantize( numColors : Int, colorspace : ImagickColorSpace, dither : Bool ) : Bool
	{
		return nMagick_quantize( __m, numColors, getColorSpaceInt( colorspace ), dither );
	}

	/*
	@description	Radial blurs an image.
	@param			angle	The angle of the blur in degrees.
	*/
	public function radialBlur( angle : Float ) : Bool
	{
		return nMagick_radial_blur( __m, angle );
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
	public function raise( x : Int, y : Int, w : Int, h : Int, raise : Bool ) : Bool
	{
		return nMagick_raise( __m, { x : x, y : y, w : w, h : h }, raise );
	}

	/*
	@description	Reads an image or image sequence from a blob.
	@param			blob	The blob.
	*/
	public function loadBlob( blob : String ) : Bool
	{
		return nMagick_load_blob( __m, untyped blob.__s, blob.length );
	}

	/*
	@description	smooths the contours of an image while still preserving edge 
					information. The algorithm works by replacing each pixel with 
					its neighbor closest in value. A neighbor is defined by radius. 
					Use a radius of 0 and ReduceNoise() selects a suitable radius 
					for you.
	@param			radius	The radius of the pixel neighborhood.
	*/
	public function reduceNoise( radius : Float ) : Bool
	{
		return nMagick_reduce_noise( __m, radius );
	}

	/*
	@description	resample image to desired resolution.
					
					Bessel Blackman Box Catrom Cubic Gaussian Hanning 
					Hermite Lanczos Mitchell ImagickPoint Quandratic Sinc Triangle

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
	public function resample( x : Int, y : Int, filter : ImagickFilter, blur : Float ) : Bool
	{
		return nMagick_resample( __m, x, y, getFilterId( filter ), blur );
	}

	/*
	@description	Offsets an image as defined by x and y.
	@param			x		The x offset.
	@param			y		The y offset.
	*/
	public function roll( x : Int, y : Int ) : Bool
	{
		return nMagick_roll( __m, x, y );
	}

	/*
	@description	Rotates an image the specified number of degrees. Empty triangles 
					left over from rotating the image are filled with the 
					background color.
	@param			background	The background pixel wand.
	@param			degrees		The number of degrees to rotate the image.
	*/
	public function rotate( background : ImagickPixel, degrees : Float ) : Bool
	{
		return nMagick_rotate( __m, untyped background.__d, degrees );
	}

	/*
	@description	scales an image to the desired dimensions with pixel sampling. 
					Unlike other scaling methods, this method does not introduce any 
					additional color into the scaled image.
	@param			columns		The number of columns in the scaled image.
	@param			rows		The number of rows in the scaled image.
	*/
	public function sample( w : Int, h : Int ) : Bool
	{
		return nMagick_sample( __m, w, h );
	}

	/*
	@description	scales the size of an image to the given dimensions.
	@param			columns		The number of columns in the scaled image.
	@param			rows		The number of rows in the scaled image.
	*/
	public function scale( w : Int, h : Int ) : Bool
	{
		return nMagick_scale( __m, w, h );
	}

	/*
	@description	applies a special effect to the image, similar to the effect 
					achieved in a photo darkroom by sepia toning. Threshold ranges 
					from 0 to QuantumRange and is a measure of the extent of the 
					sepia toning. A threshold of 80 is a good starting point for a 
					reasonable tone.
	@param			threshold	Define the extent of the sepia toning.
	*/
	public function solarize( threshold : Float ) : Bool
	{
		return nMagick_solarize( __m, threshold );
	}

	/*
	@description	Sets the image size cols x rows.
	@param			cols	width of the image.
	@param			rows	height of the image.
	*/
	public function setExtent( w : Int, h : Int ) : Bool
	{
		return nMagick_set_extent( __m, w, h );
	}

	/*
	@description	Sets the image filename.
	@param			Filename	The filename to set for the image.
	*/
	public function setFileName( filename : String ) : Bool
	{
		return nMagick_set_filename( __m, untyped filename.__s );
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
	public function shine( grey : Bool, azimuth : Float, elevation : Float ) : Bool
	{
		return nMagick_shine( __m, grey, azimuth, elevation );
	}

	/*
	@description	Simulates an image shadow.
	@param			radius	The radius of the Gaussian, in pixels, not counting the 
					center pixel.
	@param			sigma	The standard deviation of the Gaussian, in pixels.
	@param			point	The shadow offset.
	*/
	public function shadow( radius : Float, sigma : Float, point : ImagickPoint ) : Bool
	{
		return nMagick_shadow( __m, radius, sigma, point );
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
	public function sharpen( radius : Float, sigma : Float ) : Bool
	{
		return nMagick_sharpen( __m, radius, sigma );
	}

	/*
	@description	shaves pixels from the image edges. It allocates the memory 
					necessary for the new Image structure and returns a pointer to 
					the new image.
	@param			cols	The number of columns in the scaled image.
	@param			rows	The number of rows in the scaled image.
	*/
	public function shave( w : Int, h : Int ) : Bool
	{
		return nMagick_shave( __m, w, h );
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
	public function shear( background : ImagickPixel, x : Int, y : Int ) : Bool
	{
		return nMagick_shear( __m, untyped background.__d, x, y );
	}

	/*
	@description	composites two images and produces a single image that is the 
					composite of a left and right image of a stereo pair.
	@param			offset_wand		Another image wand.
	*/
	public function stereo( offset_wand : Imagick ) : Bool
	{
		return nMagick_stereo( __m, untyped offset_wand.__m );
	}

	/*
	@description	Strips an image of all profiles and comments.
	*/
	public function strip()
	{
		return nMagick_strip( __m );
	}

	/*
	@description	Swirls the pixels about the center of the image, where degrees 
					indicates the sweep of the arc through which each pixel is moved. 
					You get a more dramatic effect as the degrees move from 1 to 360.
	@param			degrees		The amount to swirl.
	*/
	public function swirl( degrees : Float ) : Bool
	{
		return nMagick_swirl( __m, degrees );
	}

	/*
	@description	Repeatedly tiles the texture image across and down the image canvas.
	@param			texture_wand	The texture wand.
	*/
	public function texture( txtr : Imagick ) : Bool
	{		
		return nMagick_texture( __m, untyped txtr.__m );
	}

	/*
	@description	changes the value of individual pixels based on the intensity of 
					each pixel compared to threshold. The result is a high-contrast, 
					two color image.
	@param			threshold	Define the threshold value.
	*/
	public function threshold( t : Float ) : Bool
	{
		return nMagick_threshold( __m, t );
	}

	/*
	@description	changes the size of an image to the given dimensions and removes 
					any associated profiles. The goal is to produce small low cost 
					thumbnail images suited for display on the Web.
	@param			cols	The width of the thumb
	@param			rows	The height of the thumb
	*/
	public function thumbnail( w : Int, h : Int ) : Bool
	{
		return nMagick_thumbnail( __m, w, h );
	}

	/*
	@description	applies a color vector to each pixel in the image. The length of the 
					vector is 0 for black and white and at its maximum for the midtones. 
					The vector weighting function is f(x)=(1-(4.0*((x-0.5)*(x-0.5)))).
	@param			tint	The tint pixel wand.
	@param			opacity	The opacity pixel wand.
	*/
	public function tint( t : ImagickPixel, o : ImagickPixel ) : Bool
	{
		return nMagick_tint( __m, untyped t.__d, untyped o.__d );
	}

	/*
	@description	creates a "ripple" effect in the image by shifting the pixels 
					vertically along a sine wave whose amplitude and wavelength is 
					specified by the given parameters.
	@param			amplitude	Define the amplitude of the sine wave.
	@param			length	Define the wave length of the sine wave.
	*/
	public function wave( a : Float, l : Float ) : Bool
	{
		return nMagick_wave( __m, a, l );
	}
	
  /*
	public function getPalette() : Array<String>
	{
		return neko.Lib.nekoToHaxe( nMagick_get_palette( __m ) );
	}
  */
	
	public function whiteThreshold( thresold:ImagickPixel )
	{
		nMagick_white_threshold( __m, thresold.__d );
	}

	public function matteFloodFill( alpha:Float, fuzz:Float, color:ImagickPixel, x:Int, y:Int )
	{
		nMagick_matte_flood_fill( __m, alpha, fuzz, color.__d, x, y);
	}
	
	public function iteratePixels(f:Int->Int->ImagickPixel->Void, x=0, y=0, w=-1, h=-1) : Void
    {
        nMagick_iterate_pixels( __m, function( x:Int, y:Int, hPixel:Void ) f(x, y, new neko.imagemagick.ImagickPixel(null, hPixel)), x, y, w, h );
    }
	
	public function clone() : Imagick
	{
		return new Imagick(null, nMagick_clone( __m ));
	}
	
	static var nMagick_init = neko.Lib.load("nMagick","nMagick_init",0);
	static var nMagick_load = neko.Lib.load("nMagick","nMagick_load",2);
	static var nMagick_save = neko.Lib.load("nMagick","nMagick_save",2);
	static var nMagick_clear = neko.Lib.load("nMagick","nMagick_clear",1);
	static var nMagick_destroy = neko.Lib.load("nMagick","nMagick_destroy",1);
	
	static var nMagick_adaptive_sharpen = neko.Lib.load("nMagick","nMagick_adaptive_sharpen",3);
	static var nMagick_adaptive_threshold = neko.Lib.load("nMagick","nMagick_adaptive_threshold",4);
	static var nMagick_affine_transform = neko.Lib.load("nMagick","nMagick_affine_transform",2);
	static var nMagick_add_noise = neko.Lib.load("nMagick","nMagick_add_noise",2);
	static var nMagick_annotate = neko.Lib.load("nMagick","nMagick_annotate",5);
	static var nMagick_black_threshold = neko.Lib.load("nMagick","nMagick_black_threshold",2);
	static var nMagick_blur = neko.Lib.load("nMagick","nMagick_blur",3);
	static var nMagick_border = neko.Lib.load("nMagick","nMagick_border",4);
	static var nMagick_charcoal = neko.Lib.load("nMagick","nMagick_charcoal",3);
	static var nMagick_resize = neko.Lib.load("nMagick","nMagick_resize",3);
	static var nMagick_edge = neko.Lib.load("nMagick","nMagick_edge",2);
	static var nMagick_emboss = neko.Lib.load("nMagick","nMagick_emboss",3);

	static var nMagick_new = neko.Lib.load("nMagick","nMagick_new",4);
	static var nMagick_add_image = neko.Lib.load("nMagick","nMagick_add_image",2);
	static var nMagick_chop = neko.Lib.load("nMagick","nMagick_chop",4);
	static var nMagick_colorfloodfill = neko.Lib.load("nMagick","nMagick_colorfloodfill",5);
	static var nMagick_colorize = neko.Lib.load("nMagick","nMagick_colorize",3);
	static var nMagick_comment = neko.Lib.load("nMagick","nMagick_comment",2);
	static var nMagick_composite = neko.Lib.load("nMagick","nMagick_composite",4);
	static var nMagick_contrast = neko.Lib.load("nMagick","nMagick_contrast",2);
	static var nMagick_convolve = neko.Lib.load("nMagick","nMagick_convolve",3);
	static var nMagick_crop = neko.Lib.load("nMagick","nMagick_crop",4);
	static var nMagick_despeckle = neko.Lib.load("nMagick","nMagick_despeckle",1);
	static var nMagick_draw = neko.Lib.load("nMagick","nMagick_draw",2);
	static var nMagick_enhance = neko.Lib.load("nMagick","nMagick_enhance",1);
	static var nMagick_equalize = neko.Lib.load("nMagick","nMagick_equalize",1);
	static var nMagick_evaluate = neko.Lib.load("nMagick","nMagick_evaluate",3);
	static var nMagick_flatten = neko.Lib.load("nMagick","nMagick_flatten",1);
	static var nMagick_flip = neko.Lib.load("nMagick","nMagick_flip",1);
	static var nMagick_flop = neko.Lib.load("nMagick","nMagick_flop",1);
	static var nMagick_gamma = neko.Lib.load("nMagick","nMagick_gamma",2);
	static var nMagick_gaussian_blur = neko.Lib.load("nMagick","nMagick_gaussian_blur",3);
	static var nMagick_get_region = neko.Lib.load("nMagick","nMagick_get_region",4);
	static var nMagick_get_background_color = neko.Lib.load("nMagick","nMagick_get_background_color",1);
	static var nMagick_set_background_color = neko.Lib.load("nMagick","nMagick_set_background_color",2);
	static var nMagick_get_blob = neko.Lib.load("nMagick","nMagick_get_blob",1);
	static var nMagick_get_red_primary = neko.Lib.load("nMagick","nMagick_get_red_primary",1);
	static var nMagick_set_red_primary = neko.Lib.load("nMagick","nMagick_set_red_primary",2);
	static var nMagick_get_green_primary = neko.Lib.load("nMagick","nMagick_get_green_primary",1);
	static var nMagick_set_green_primary = neko.Lib.load("nMagick","nMagick_set_green_primary",2);
	static var nMagick_get_blue_primary = neko.Lib.load("nMagick","nMagick_get_blue_primary",1);
	static var nMagick_set_blue_primary = neko.Lib.load("nMagick","nMagick_set_blue_primary",2);
	static var nMagick_get_border_color = neko.Lib.load("nMagick","nMagick_get_border_color",1);
	static var nMagick_set_border_color = neko.Lib.load("nMagick","nMagick_set_border_color",2);
	static var nMagick_get_colormap_color = neko.Lib.load("nMagick","nMagick_get_colormap_color",3);
	static var nMagick_set_colormap_color = neko.Lib.load("nMagick","nMagick_set_colormap_color",3);
	static var nMagick_get_colors_length = neko.Lib.load("nMagick","nMagick_get_colors_length",1);
	static var nMagick_get_colorspace = neko.Lib.load("nMagick","nMagick_get_colorspace",1);
	static var nMagick_set_colorspace = neko.Lib.load("nMagick","nMagick_set_colorspace",2);
	static var nMagick_get_composite = neko.Lib.load("nMagick","nMagick_get_composite",1);
	static var nMagick_set_composite = neko.Lib.load("nMagick","nMagick_set_composite",2);
	static var nMagick_get_compression = neko.Lib.load("nMagick","nMagick_get_compression",1);
	static var nMagick_set_compression = neko.Lib.load("nMagick","nMagick_set_compression",2);
	static var nMagick_set_compression_quality = neko.Lib.load("nMagick","nMagick_set_compression_quality",2);
	static var nMagick_get_depth = neko.Lib.load("nMagick","nMagick_get_depth",1);
	static var nMagick_set_depth = neko.Lib.load("nMagick","nMagick_set_depth",2);
	static var nMagick_get_distortion = neko.Lib.load("nMagick","nMagick_get_distortion",3);
	static var nMagick_get_extrema = neko.Lib.load("nMagick","nMagick_get_extrema",1);
	static var nMagick_get_attribute = neko.Lib.load("nMagick","nMagick_get_attribute",2);
	static var nMagick_set_attribute = neko.Lib.load("nMagick","nMagick_set_attribute",3);
	static var nMagick_get_format = neko.Lib.load("nMagick","nMagick_get_format",1);
	static var nMagick_set_format = neko.Lib.load("nMagick","nMagick_set_format",2);
	static var nMagick_get_gamma = neko.Lib.load("nMagick","nMagick_get_gamma",1);
	static var nMagick_set_gamma = neko.Lib.load("nMagick","nMagick_set_gamma",2);
	static var nMagick_get_width = neko.Lib.load("nMagick","nMagick_get_width",1);
	static var nMagick_get_height = neko.Lib.load("nMagick","nMagick_get_height",1);
	static var nMagick_get_interlace_scheme = neko.Lib.load("nMagick","nMagick_get_interlace_scheme",1);
	static var nMagick_set_interlace_scheme = neko.Lib.load("nMagick","nMagick_set_interlace_scheme",2);
	static var nMagick_get_matte = neko.Lib.load("nMagick","nMagick_get_matte",1);
	static var nMagick_set_matte = neko.Lib.load("nMagick","nMagick_set_matte",2);
	static var nMagick_get_matte_color = neko.Lib.load("nMagick","nMagick_get_matte_color",1);
	static var nMagick_set_matte_color = neko.Lib.load("nMagick","nMagick_set_matte_color",2);
	static var nMagick_get_pixel_color = neko.Lib.load("nMagick","nMagick_get_pixel_color",2);
	static var nMagick_get_rendering_intent = neko.Lib.load("nMagick","nMagick_get_rendering_intent",1);
	static var nMagick_set_rendering_intent = neko.Lib.load("nMagick","nMagick_set_rendering_intent",2);
	static var nMagick_get_resolution = neko.Lib.load("nMagick","nMagick_get_resolution",1);
	static var nMagick_set_resolution = neko.Lib.load("nMagick","nMagick_set_resolution",3);
	static var nMagick_get_dispose = neko.Lib.load("nMagick","nMagick_get_dispose",1);
	static var nMagick_get_size = neko.Lib.load("nMagick","nMagick_get_size",1);
	static var nMagick_get_type = neko.Lib.load("nMagick","nMagick_get_type",1);
	static var nMagick_set_type = neko.Lib.load("nMagick","nMagick_set_type",2);
	static var nMagick_get_units = neko.Lib.load("nMagick","nMagick_get_units",1);
	static var nMagick_set_units = neko.Lib.load("nMagick","nMagick_set_units",2);
	static var nMagick_get_white_point = neko.Lib.load("nMagick","nMagick_get_white_point",1);
	static var nMagick_set_white_point = neko.Lib.load("nMagick","nMagick_set_white_point",3);
	static var nMagick_implode = neko.Lib.load("nMagick","nMagick_implode",2);
	static var nMagick_label = neko.Lib.load("nMagick","nMagick_label",2);
	static var nMagick_level = neko.Lib.load("nMagick","nMagick_level",4);
	static var nMagick_magnify = neko.Lib.load("nMagick","nMagick_magnify",1);
	static var nMagick_map = neko.Lib.load("nMagick","nMagick_map",3);
	static var nMagick_median_filter = neko.Lib.load("nMagick","nMagick_median_filter",2);
	static var nMagick_minify = neko.Lib.load("nMagick","nMagick_minify",1);
	static var nMagick_modulate = neko.Lib.load("nMagick","nMagick_modulate",4);
	static var nMagick_motion_blur = neko.Lib.load("nMagick","nMagick_motion_blur",4);
	static var nMagick_negate = neko.Lib.load("nMagick","nMagick_negate",2);
	static var nMagick_normalize = neko.Lib.load("nMagick","nMagick_normalize",1);
	static var nMagick_paint_transparent = neko.Lib.load("nMagick","nMagick_paint_transparent",4);
	static var nMagick_oil_painting = neko.Lib.load("nMagick","nMagick_oil_painting",2);
	static var nMagick_posterize = neko.Lib.load("nMagick","nMagick_posterize",3);
	static var nMagick_quantize = neko.Lib.load("nMagick","nMagick_quantize",4);
	static var nMagick_radial_blur = neko.Lib.load("nMagick","nMagick_radial_blur",2);
	static var nMagick_raise = neko.Lib.load("nMagick","nMagick_raise",3);
	static var nMagick_load_blob = neko.Lib.load("nMagick","nMagick_load_blob",3);
	static var nMagick_reduce_noise = neko.Lib.load("nMagick","nMagick_reduce_noise",2);
	static var nMagick_resample = neko.Lib.load("nMagick","nMagick_resample",5);
	static var nMagick_roll = neko.Lib.load("nMagick","nMagick_roll",3);
	static var nMagick_rotate = neko.Lib.load("nMagick","nMagick_rotate",3);
	static var nMagick_sample = neko.Lib.load("nMagick","nMagick_sample",3);
	static var nMagick_scale = neko.Lib.load("nMagick","nMagick_scale",3);
	static var nMagick_solarize = neko.Lib.load("nMagick","nMagick_solarize",2);
	static var nMagick_set_extent = neko.Lib.load("nMagick","nMagick_set_extent",3);
	static var nMagick_set_filename = neko.Lib.load("nMagick","nMagick_set_filename",3);
	static var nMagick_shine = neko.Lib.load("nMagick","nMagick_shine",4);
	static var nMagick_shadow = neko.Lib.load("nMagick","nMagick_shadow",4);
	static var nMagick_sharpen = neko.Lib.load("nMagick","nMagick_sharpen",3);
	static var nMagick_shave = neko.Lib.load("nMagick","nMagick_shave",3);
	static var nMagick_shear = neko.Lib.load("nMagick","nMagick_shear",4);
	static var nMagick_stereo = neko.Lib.load("nMagick","nMagick_stereo",2);
	static var nMagick_strip = neko.Lib.load("nMagick","nMagick_strip",1);
	static var nMagick_swirl = neko.Lib.load("nMagick","nMagick_swirl",2);
	static var nMagick_texture = neko.Lib.load("nMagick","nMagick_texture",2);
	static var nMagick_threshold = neko.Lib.load("nMagick","nMagick_threshold",2);
	static var nMagick_thumbnail = neko.Lib.load("nMagick","nMagick_thumbnail",3);
	static var nMagick_tint = neko.Lib.load("nMagick","nMagick_tint",3);
	static var nMagick_wave = neko.Lib.load("nMagick","nMagick_wave",3);
	static var nMagick_handler = neko.Lib.load("nMagick","set_exception_handler",1);
	static var nMagick_white_threshold = neko.Lib.load("nMagick","nMagick_white_thres",2);
	static var nMagick_clone = neko.Lib.load("nMagick","nMagick_clone",1);
	
	static var nMagick_matte_flood_fill = neko.Lib.load("nMagick","nMagick_matte_flood_fill",-1);
	static var nMagick_iterate_pixels = neko.Lib.load("nMagick","nMagick_iterate_pixels",-1);
}
