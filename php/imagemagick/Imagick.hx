package php.imagemagick;

@:native("Imagick") extern class Imagick
{
	/**
	 * Black color 
	 */
	public static inline var COLOR_BLACK(COLOR_BLACK_getter, null) : Int; private static inline function COLOR_BLACK_getter() : Int { return untyped __php__("imagick::COLOR_BLACK"); }

	/**
	 * Blue color 
	 */
	public static inline var COLOR_BLUE(COLOR_BLUE_getter, null) : Int; private static inline function COLOR_BLUE_getter() : Int { return untyped __php__("imagick::COLOR_BLUE"); }

	/**
	 * Cyan color 
	 */
	public static inline var COLOR_CYAN(COLOR_CYAN_getter, null) : Int; private static inline function COLOR_CYAN_getter() : Int { return untyped __php__("imagick::COLOR_CYAN"); }

	/**
	 * Green color 
	 */
	public static inline var COLOR_GREEN(COLOR_GREEN_getter, null) : Int; private static inline function COLOR_GREEN_getter() : Int { return untyped __php__("imagick::COLOR_GREEN"); }

	/**
	 * Red color 
	 */
	public static inline var COLOR_RED(COLOR_RED_getter, null) : Int; private static inline function COLOR_RED_getter() : Int { return untyped __php__("imagick::COLOR_RED"); }

	/**
	 * Yellow color 
	 */
	public static inline var COLOR_YELLOW(COLOR_YELLOW_getter, null) : Int; private static inline function COLOR_YELLOW_getter() : Int { return untyped __php__("imagick::COLOR_YELLOW"); }

	/**
	 * Magenta color 
	 */
	public static inline var COLOR_MAGENTA(COLOR_MAGENTA_getter, null) : Int; private static inline function COLOR_MAGENTA_getter() : Int { return untyped __php__("imagick::COLOR_MAGENTA"); }

	/**
	 * Color's opacity 
	 */
	public static inline var COLOR_OPACITY(COLOR_OPACITY_getter, null) : Int; private static inline function COLOR_OPACITY_getter() : Int { return untyped __php__("imagick::COLOR_OPACITY"); }

	/**
	 * Color's alpha 
	 */
	public static inline var COLOR_ALPHA(COLOR_ALPHA_getter, null) : Int; private static inline function COLOR_ALPHA_getter() : Int { return untyped __php__("imagick::COLOR_ALPHA"); }

	/**
	 * Color's fuzz 
	 */
	public static inline var COLOR_FUZZ(COLOR_FUZZ_getter, null) : Int; private static inline function COLOR_FUZZ_getter() : Int { return untyped __php__("imagick::COLOR_FUZZ"); }

	/**
	 * Unrecognized dispose type 
	 */
	public static inline var DISPOSE_UNRECOGNIZED(DISPOSE_UNRECOGNIZED_getter, null) : Int; private static inline function DISPOSE_UNRECOGNIZED_getter() : Int { return untyped __php__("imagick::DISPOSE_UNRECOGNIZED"); }

	/**
	 * Undefined dispose type 
	 */
	public static inline var DISPOSE_UNDEFINED(DISPOSE_UNDEFINED_getter, null) : Int; private static inline function DISPOSE_UNDEFINED_getter() : Int { return untyped __php__("imagick::DISPOSE_UNDEFINED"); }

	/**
	 * No dispose type defined 
	 */
	public static inline var DISPOSE_NONE(DISPOSE_NONE_getter, null) : Int; private static inline function DISPOSE_NONE_getter() : Int { return untyped __php__("imagick::DISPOSE_NONE"); }

	/**
	 * Dispose background 
	 */
	public static inline var DISPOSE_BACKGROUND(DISPOSE_BACKGROUND_getter, null) : Int; private static inline function DISPOSE_BACKGROUND_getter() : Int { return untyped __php__("imagick::DISPOSE_BACKGROUND"); }

	/**
	 * Dispose previous 
	 */
	public static inline var DISPOSE_PREVIOUS(DISPOSE_PREVIOUS_getter, null) : Int; private static inline function DISPOSE_PREVIOUS_getter() : Int { return untyped __php__("imagick::DISPOSE_PREVIOUS"); }

	/**
	 * The default composite operator 
	 */
	public static inline var COMPOSITE_DEFAULT(COMPOSITE_DEFAULT_getter, null) : Int; private static inline function COMPOSITE_DEFAULT_getter() : Int { return untyped __php__("imagick::COMPOSITE_DEFAULT"); }

	/**
	 * Undefined composite operator 
	 */
	public static inline var COMPOSITE_UNDEFINED(COMPOSITE_UNDEFINED_getter, null) : Int; private static inline function COMPOSITE_UNDEFINED_getter() : Int { return untyped __php__("imagick::COMPOSITE_UNDEFINED"); }

	/**
	 * No composite operator defined 
	 */
	public static inline var COMPOSITE_NO(COMPOSITE_NO_getter, null) : Int; private static inline function COMPOSITE_NO_getter() : Int { return untyped __php__("imagick::COMPOSITE_NO"); }

	/**
	 * The result of image + image 
	 */
	public static inline var COMPOSITE_ADD(COMPOSITE_ADD_getter, null) : Int; private static inline function COMPOSITE_ADD_getter() : Int { return untyped __php__("imagick::COMPOSITE_ADD"); }

	/**
	 * The result is the same shape as image, with composite image obscuring image where the image shapes overlap 
	 */
	public static inline var COMPOSITE_ATOP(COMPOSITE_ATOP_getter, null) : Int; private static inline function COMPOSITE_ATOP_getter() : Int { return untyped __php__("imagick::COMPOSITE_ATOP"); }

	/**
	 * Blends the image 
	 */
	public static inline var COMPOSITE_BLEND(COMPOSITE_BLEND_getter, null) : Int; private static inline function COMPOSITE_BLEND_getter() : Int { return untyped __php__("imagick::COMPOSITE_BLEND"); }

	/**
	 * The same as COMPOSITE_MULTIPLY, except the source is converted to grayscale first. 
	 */
	public static inline var COMPOSITE_BUMPMAP(COMPOSITE_BUMPMAP_getter, null) : Int; private static inline function COMPOSITE_BUMPMAP_getter() : Int { return untyped __php__("imagick::COMPOSITE_BUMPMAP"); }

	/**
	 * Makes the target image transparent 
	 */
	public static inline var COMPOSITE_CLEAR(COMPOSITE_CLEAR_getter, null) : Int; private static inline function COMPOSITE_CLEAR_getter() : Int { return untyped __php__("imagick::COMPOSITE_CLEAR"); }

	/**
	 * Darkens the destination image to reflect the source image 
	 */
	public static inline var COMPOSITE_COLORBURN(COMPOSITE_COLORBURN_getter, null) : Int; private static inline function COMPOSITE_COLORBURN_getter() : Int { return untyped __php__("imagick::COMPOSITE_COLORBURN"); }

	/**
	 * Brightens the destination image to reflect the source image 
	 */
	public static inline var COMPOSITE_COLORDODGE(COMPOSITE_COLORDODGE_getter, null) : Int; private static inline function COMPOSITE_COLORDODGE_getter() : Int { return untyped __php__("imagick::COMPOSITE_COLORDODGE"); }

	/**
	 * Colorizes the target image using the composite image 
	 */
	public static inline var COMPOSITE_COLORIZE(COMPOSITE_COLORIZE_getter, null) : Int; private static inline function COMPOSITE_COLORIZE_getter() : Int { return untyped __php__("imagick::COMPOSITE_COLORIZE"); }

	/**
	 * Copies black from the source to target 
	 */
	public static inline var COMPOSITE_COPYBLACK(COMPOSITE_COPYBLACK_getter, null) : Int; private static inline function COMPOSITE_COPYBLACK_getter() : Int { return untyped __php__("imagick::COMPOSITE_COPYBLACK"); }

	/**
	 * Copies blue from the source to target 
	 */
	public static inline var COMPOSITE_COPYBLUE(COMPOSITE_COPYBLUE_getter, null) : Int; private static inline function COMPOSITE_COPYBLUE_getter() : Int { return untyped __php__("imagick::COMPOSITE_COPYBLUE"); }

	/**
	 * Copies the source image on the target image 
	 */
	public static inline var COMPOSITE_COPY(COMPOSITE_COPY_getter, null) : Int; private static inline function COMPOSITE_COPY_getter() : Int { return untyped __php__("imagick::COMPOSITE_COPY"); }

	/**
	 * Copies cyan from the source to target 
	 */
	public static inline var COMPOSITE_COPYCYAN(COMPOSITE_COPYCYAN_getter, null) : Int; private static inline function COMPOSITE_COPYCYAN_getter() : Int { return untyped __php__("imagick::COMPOSITE_COPYCYAN"); }

	/**
	 * Copies green from the source to target 
	 */
	public static inline var COMPOSITE_COPYGREEN(COMPOSITE_COPYGREEN_getter, null) : Int; private static inline function COMPOSITE_COPYGREEN_getter() : Int { return untyped __php__("imagick::COMPOSITE_COPYGREEN"); }

	/**
	 * Copies magenta from the source to target 
	 */
	public static inline var COMPOSITE_COPYMAGENTA(COMPOSITE_COPYMAGENTA_getter, null) : Int; private static inline function COMPOSITE_COPYMAGENTA_getter() : Int { return untyped __php__("imagick::COMPOSITE_COPYMAGENTA"); }

	/**
	 * Copies opacity from the source to target 
	 */
	public static inline var COMPOSITE_COPYOPACITY(COMPOSITE_COPYOPACITY_getter, null) : Int; private static inline function COMPOSITE_COPYOPACITY_getter() : Int { return untyped __php__("imagick::COMPOSITE_COPYOPACITY"); }

	/**
	 * Copies red from the source to target 
	 */
	public static inline var COMPOSITE_COPYRED(COMPOSITE_COPYRED_getter, null) : Int; private static inline function COMPOSITE_COPYRED_getter() : Int { return untyped __php__("imagick::COMPOSITE_COPYRED"); }

	/**
	 * Copies yellow from the source to target 
	 */
	public static inline var COMPOSITE_COPYYELLOW(COMPOSITE_COPYYELLOW_getter, null) : Int; private static inline function COMPOSITE_COPYYELLOW_getter() : Int { return untyped __php__("imagick::COMPOSITE_COPYYELLOW"); }

	/**
	 * Darkens the target image 
	 */
	public static inline var COMPOSITE_DARKEN(COMPOSITE_DARKEN_getter, null) : Int; private static inline function COMPOSITE_DARKEN_getter() : Int { return untyped __php__("imagick::COMPOSITE_DARKEN"); }

	/**
	 * The part of the destination lying inside of the source is composited over the source and replaces the destination 
	 */
	public static inline var COMPOSITE_DSTATOP(COMPOSITE_DSTATOP_getter, null) : Int; private static inline function COMPOSITE_DSTATOP_getter() : Int { return untyped __php__("imagick::COMPOSITE_DSTATOP"); }

	/**
	 * The target is left untouched 
	 */
	public static inline var COMPOSITE_DST(COMPOSITE_DST_getter, null) : Int; private static inline function COMPOSITE_DST_getter() : Int { return untyped __php__("imagick::COMPOSITE_DST"); }

	/**
	 * The parts inside the source replace the target 
	 */
	public static inline var COMPOSITE_DSTIN(COMPOSITE_DSTIN_getter, null) : Int; private static inline function COMPOSITE_DSTIN_getter() : Int { return untyped __php__("imagick::COMPOSITE_DSTIN"); }

	/**
	 * The parts outside the source replace the target 
	 */
	public static inline var COMPOSITE_DSTOUT(COMPOSITE_DSTOUT_getter, null) : Int; private static inline function COMPOSITE_DSTOUT_getter() : Int { return untyped __php__("imagick::COMPOSITE_DSTOUT"); }

	/**
	 * Target replaces the source 
	 */
	public static inline var COMPOSITE_DSTOVER(COMPOSITE_DSTOVER_getter, null) : Int; private static inline function COMPOSITE_DSTOVER_getter() : Int { return untyped __php__("imagick::COMPOSITE_DSTOVER"); }

	/**
	 * Subtracts the darker of the two constituent colors from the lighter 
	 */
	public static inline var COMPOSITE_DIFFERENCE(COMPOSITE_DIFFERENCE_getter, null) : Int; private static inline function COMPOSITE_DIFFERENCE_getter() : Int { return untyped __php__("imagick::COMPOSITE_DIFFERENCE"); }

	/**
	 * Shifts target image pixels as defined by the source 
	 */
	public static inline var COMPOSITE_DISPLACE(COMPOSITE_DISPLACE_getter, null) : Int; private static inline function COMPOSITE_DISPLACE_getter() : Int { return untyped __php__("imagick::COMPOSITE_DISPLACE"); }

	/**
	 * Dissolves the source in to the target 
	 */
	public static inline var COMPOSITE_DISSOLVE(COMPOSITE_DISSOLVE_getter, null) : Int; private static inline function COMPOSITE_DISSOLVE_getter() : Int { return untyped __php__("imagick::COMPOSITE_DISSOLVE"); }

	/**
	 * Produces an effect similar to that of imagick::COMPOSITE_DIFFERENCE, but appears as lower contrast 
	 */
	public static inline var COMPOSITE_EXCLUSION(COMPOSITE_EXCLUSION_getter, null) : Int; private static inline function COMPOSITE_EXCLUSION_getter() : Int { return untyped __php__("imagick::COMPOSITE_EXCLUSION"); }

	/**
	 * Multiplies or screens the colors, dependent on the source color value 
	 */
	public static inline var COMPOSITE_HARDLIGHT(COMPOSITE_HARDLIGHT_getter, null) : Int; private static inline function COMPOSITE_HARDLIGHT_getter() : Int { return untyped __php__("imagick::COMPOSITE_HARDLIGHT"); }

	/**
	 * Modifies the hue of the target as defined by source 
	 */
	public static inline var COMPOSITE_HUE(COMPOSITE_HUE_getter, null) : Int; private static inline function COMPOSITE_HUE_getter() : Int { return untyped __php__("imagick::COMPOSITE_HUE"); }

	/**
	 * Composites source into the target 
	 */
	public static inline var COMPOSITE_IN(COMPOSITE_IN_getter, null) : Int; private static inline function COMPOSITE_IN_getter() : Int { return untyped __php__("imagick::COMPOSITE_IN"); }

	/**
	 * Lightens the target as defined by source 
	 */
	public static inline var COMPOSITE_LIGHTEN(COMPOSITE_LIGHTEN_getter, null) : Int; private static inline function COMPOSITE_LIGHTEN_getter() : Int { return untyped __php__("imagick::COMPOSITE_LIGHTEN"); }

	/**
	 * Luminizes the target as defined by source 
	 */
	public static inline var COMPOSITE_LUMINIZE(COMPOSITE_LUMINIZE_getter, null) : Int; private static inline function COMPOSITE_LUMINIZE_getter() : Int { return untyped __php__("imagick::COMPOSITE_LUMINIZE"); }

	/**
	 * Substracts the source from the target 
	 */
	public static inline var COMPOSITE_MINUS(COMPOSITE_MINUS_getter, null) : Int; private static inline function COMPOSITE_MINUS_getter() : Int { return untyped __php__("imagick::COMPOSITE_MINUS"); }

	/**
	 * Modulates the target brightness, saturation and hue as defined by source 
	 */
	public static inline var COMPOSITE_MODULATE(COMPOSITE_MODULATE_getter, null) : Int; private static inline function COMPOSITE_MODULATE_getter() : Int { return untyped __php__("imagick::COMPOSITE_MODULATE"); }

	/**
	 * Multiplies the target to the source 
	 */
	public static inline var COMPOSITE_MULTIPLY(COMPOSITE_MULTIPLY_getter, null) : Int; private static inline function COMPOSITE_MULTIPLY_getter() : Int { return untyped __php__("imagick::COMPOSITE_MULTIPLY"); }

	/**
	 * Composites outer parts of the source on the target 
	 */
	public static inline var COMPOSITE_OUT(COMPOSITE_OUT_getter, null) : Int; private static inline function COMPOSITE_OUT_getter() : Int { return untyped __php__("imagick::COMPOSITE_OUT"); }

	/**
	 * Composites source over the target 
	 */
	public static inline var COMPOSITE_OVER(COMPOSITE_OVER_getter, null) : Int; private static inline function COMPOSITE_OVER_getter() : Int { return untyped __php__("imagick::COMPOSITE_OVER"); }

	/**
	 * Overlays the source on the target 
	 */
	public static inline var COMPOSITE_OVERLAY(COMPOSITE_OVERLAY_getter, null) : Int; private static inline function COMPOSITE_OVERLAY_getter() : Int { return untyped __php__("imagick::COMPOSITE_OVERLAY"); }

	/**
	 * Adds the source to the target 
	 */
	public static inline var COMPOSITE_PLUS(COMPOSITE_PLUS_getter, null) : Int; private static inline function COMPOSITE_PLUS_getter() : Int { return untyped __php__("imagick::COMPOSITE_PLUS"); }

	/**
	 * Replaces the target with the source 
	 */
	public static inline var COMPOSITE_REPLACE(COMPOSITE_REPLACE_getter, null) : Int; private static inline function COMPOSITE_REPLACE_getter() : Int { return untyped __php__("imagick::COMPOSITE_REPLACE"); }

	/**
	 * Saturates the target as defined by the source 
	 */
	public static inline var COMPOSITE_SATURATE(COMPOSITE_SATURATE_getter, null) : Int; private static inline function COMPOSITE_SATURATE_getter() : Int { return untyped __php__("imagick::COMPOSITE_SATURATE"); }

	/**
	 * The source and destination are complemented and then multiplied and then replace the destination 
	 */
	public static inline var COMPOSITE_SCREEN(COMPOSITE_SCREEN_getter, null) : Int; private static inline function COMPOSITE_SCREEN_getter() : Int { return untyped __php__("imagick::COMPOSITE_SCREEN"); }

	/**
	 * Darkens or lightens the colors, dependent on the source 
	 */
	public static inline var COMPOSITE_SOFTLIGHT(COMPOSITE_SOFTLIGHT_getter, null) : Int; private static inline function COMPOSITE_SOFTLIGHT_getter() : Int { return untyped __php__("imagick::COMPOSITE_SOFTLIGHT"); }

	/**
	 * The part of the source lying inside of the destination is composited onto the destination 
	 */
	public static inline var COMPOSITE_SRCATOP(COMPOSITE_SRCATOP_getter, null) : Int; private static inline function COMPOSITE_SRCATOP_getter() : Int { return untyped __php__("imagick::COMPOSITE_SRCATOP"); }

	/**
	 * The source is copied to the destination 
	 */
	public static inline var COMPOSITE_SRC(COMPOSITE_SRC_getter, null) : Int; private static inline function COMPOSITE_SRC_getter() : Int { return untyped __php__("imagick::COMPOSITE_SRC"); }

	/**
	 * The part of the source lying inside of the destination replaces the destination 
	 */
	public static inline var COMPOSITE_SRCIN(COMPOSITE_SRCIN_getter, null) : Int; private static inline function COMPOSITE_SRCIN_getter() : Int { return untyped __php__("imagick::COMPOSITE_SRCIN"); }

	/**
	 * The part of the source lying outside of the destination replaces the destination 
	 */
	public static inline var COMPOSITE_SRCOUT(COMPOSITE_SRCOUT_getter, null) : Int; private static inline function COMPOSITE_SRCOUT_getter() : Int { return untyped __php__("imagick::COMPOSITE_SRCOUT"); }

	/**
	 * The source replaces the destination 
	 */
	public static inline var COMPOSITE_SRCOVER(COMPOSITE_SRCOVER_getter, null) : Int; private static inline function COMPOSITE_SRCOVER_getter() : Int { return untyped __php__("imagick::COMPOSITE_SRCOVER"); }

	/**
	 * Subtract the colors in the source image from the destination image 
	 */
	public static inline var COMPOSITE_SUBTRACT(COMPOSITE_SUBTRACT_getter, null) : Int; private static inline function COMPOSITE_SUBTRACT_getter() : Int { return untyped __php__("imagick::COMPOSITE_SUBTRACT"); }

	/**
	 * The source is composited on the target as defined by source threshold 
	 */
	public static inline var COMPOSITE_THRESHOLD(COMPOSITE_THRESHOLD_getter, null) : Int; private static inline function COMPOSITE_THRESHOLD_getter() : Int { return untyped __php__("imagick::COMPOSITE_THRESHOLD"); }

	/**
	 * The part of the source that lies outside of the destination is combined with the part of the destination that lies outside of the source 
	 */
	public static inline var COMPOSITE_XOR(COMPOSITE_XOR_getter, null) : Int; private static inline function COMPOSITE_XOR_getter() : Int { return untyped __php__("imagick::COMPOSITE_XOR"); }
	public static inline var MONTAGEMODE_FRAME(MONTAGEMODE_FRAME_getter, null) : Int; private static inline function MONTAGEMODE_FRAME_getter() : Int { return untyped __php__("imagick::MONTAGEMODE_FRAME"); }
	public static inline var MONTAGEMODE_UNFRAME(MONTAGEMODE_UNFRAME_getter, null) : Int; private static inline function MONTAGEMODE_UNFRAME_getter() : Int { return untyped __php__("imagick::MONTAGEMODE_UNFRAME"); }
	public static inline var MONTAGEMODE_CONCATENATE(MONTAGEMODE_CONCATENATE_getter, null) : Int; private static inline function MONTAGEMODE_CONCATENATE_getter() : Int { return untyped __php__("imagick::MONTAGEMODE_CONCATENATE"); }
	public static inline var STYLE_NORMAL(STYLE_NORMAL_getter, null) : Int; private static inline function STYLE_NORMAL_getter() : Int { return untyped __php__("imagick::STYLE_NORMAL"); }
	public static inline var STYLE_ITALIC(STYLE_ITALIC_getter, null) : Int; private static inline function STYLE_ITALIC_getter() : Int { return untyped __php__("imagick::STYLE_ITALIC"); }
	public static inline var STYLE_OBLIQUE(STYLE_OBLIQUE_getter, null) : Int; private static inline function STYLE_OBLIQUE_getter() : Int { return untyped __php__("imagick::STYLE_OBLIQUE"); }
	public static inline var STYLE_ANY(STYLE_ANY_getter, null) : Int; private static inline function STYLE_ANY_getter() : Int { return untyped __php__("imagick::STYLE_ANY"); }
	public static inline var FILTER_UNDEFINED(FILTER_UNDEFINED_getter, null) : Int; private static inline function FILTER_UNDEFINED_getter() : Int { return untyped __php__("imagick::FILTER_UNDEFINED"); }
	public static inline var FILTER_POINT(FILTER_POINT_getter, null) : Int; private static inline function FILTER_POINT_getter() : Int { return untyped __php__("imagick::FILTER_POINT"); }
	public static inline var FILTER_BOX(FILTER_BOX_getter, null) : Int; private static inline function FILTER_BOX_getter() : Int { return untyped __php__("imagick::FILTER_BOX"); }
	public static inline var FILTER_TRIANGLE(FILTER_TRIANGLE_getter, null) : Int; private static inline function FILTER_TRIANGLE_getter() : Int { return untyped __php__("imagick::FILTER_TRIANGLE"); }
	public static inline var FILTER_HERMITE(FILTER_HERMITE_getter, null) : Int; private static inline function FILTER_HERMITE_getter() : Int { return untyped __php__("imagick::FILTER_HERMITE"); }
	public static inline var FILTER_HANNING(FILTER_HANNING_getter, null) : Int; private static inline function FILTER_HANNING_getter() : Int { return untyped __php__("imagick::FILTER_HANNING"); }
	public static inline var FILTER_HAMMING(FILTER_HAMMING_getter, null) : Int; private static inline function FILTER_HAMMING_getter() : Int { return untyped __php__("imagick::FILTER_HAMMING"); }
	public static inline var FILTER_BLACKMAN(FILTER_BLACKMAN_getter, null) : Int; private static inline function FILTER_BLACKMAN_getter() : Int { return untyped __php__("imagick::FILTER_BLACKMAN"); }
	public static inline var FILTER_GAUSSIAN(FILTER_GAUSSIAN_getter, null) : Int; private static inline function FILTER_GAUSSIAN_getter() : Int { return untyped __php__("imagick::FILTER_GAUSSIAN"); }
	public static inline var FILTER_QUADRATIC(FILTER_QUADRATIC_getter, null) : Int; private static inline function FILTER_QUADRATIC_getter() : Int { return untyped __php__("imagick::FILTER_QUADRATIC"); }
	public static inline var FILTER_CUBIC(FILTER_CUBIC_getter, null) : Int; private static inline function FILTER_CUBIC_getter() : Int { return untyped __php__("imagick::FILTER_CUBIC"); }
	public static inline var FILTER_CATROM(FILTER_CATROM_getter, null) : Int; private static inline function FILTER_CATROM_getter() : Int { return untyped __php__("imagick::FILTER_CATROM"); }
	public static inline var FILTER_MITCHELL(FILTER_MITCHELL_getter, null) : Int; private static inline function FILTER_MITCHELL_getter() : Int { return untyped __php__("imagick::FILTER_MITCHELL"); }
	public static inline var FILTER_LANCZOS(FILTER_LANCZOS_getter, null) : Int; private static inline function FILTER_LANCZOS_getter() : Int { return untyped __php__("imagick::FILTER_LANCZOS"); }
	public static inline var FILTER_BESSEL(FILTER_BESSEL_getter, null) : Int; private static inline function FILTER_BESSEL_getter() : Int { return untyped __php__("imagick::FILTER_BESSEL"); }
	public static inline var FILTER_SINC(FILTER_SINC_getter, null) : Int; private static inline function FILTER_SINC_getter() : Int { return untyped __php__("imagick::FILTER_SINC"); }
	public static inline var IMGTYPE_UNDEFINED(IMGTYPE_UNDEFINED_getter, null) : Int; private static inline function IMGTYPE_UNDEFINED_getter() : Int { return untyped __php__("imagick::IMGTYPE_UNDEFINED"); }
	public static inline var IMGTYPE_BILEVEL(IMGTYPE_BILEVEL_getter, null) : Int; private static inline function IMGTYPE_BILEVEL_getter() : Int { return untyped __php__("imagick::IMGTYPE_BILEVEL"); }
	public static inline var IMGTYPE_GRAYSCALE(IMGTYPE_GRAYSCALE_getter, null) : Int; private static inline function IMGTYPE_GRAYSCALE_getter() : Int { return untyped __php__("imagick::IMGTYPE_GRAYSCALE"); }
	public static inline var IMGTYPE_GRAYSCALEMATTE(IMGTYPE_GRAYSCALEMATTE_getter, null) : Int; private static inline function IMGTYPE_GRAYSCALEMATTE_getter() : Int { return untyped __php__("imagick::IMGTYPE_GRAYSCALEMATTE"); }
	public static inline var IMGTYPE_PALETTE(IMGTYPE_PALETTE_getter, null) : Int; private static inline function IMGTYPE_PALETTE_getter() : Int { return untyped __php__("imagick::IMGTYPE_PALETTE"); }
	public static inline var IMGTYPE_PALETTEMATTE(IMGTYPE_PALETTEMATTE_getter, null) : Int; private static inline function IMGTYPE_PALETTEMATTE_getter() : Int { return untyped __php__("imagick::IMGTYPE_PALETTEMATTE"); }
	public static inline var IMGTYPE_TRUECOLOR(IMGTYPE_TRUECOLOR_getter, null) : Int; private static inline function IMGTYPE_TRUECOLOR_getter() : Int { return untyped __php__("imagick::IMGTYPE_TRUECOLOR"); }
	public static inline var IMGTYPE_TRUECOLORMATTE(IMGTYPE_TRUECOLORMATTE_getter, null) : Int; private static inline function IMGTYPE_TRUECOLORMATTE_getter() : Int { return untyped __php__("imagick::IMGTYPE_TRUECOLORMATTE"); }
	public static inline var IMGTYPE_COLORSEPARATION(IMGTYPE_COLORSEPARATION_getter, null) : Int; private static inline function IMGTYPE_COLORSEPARATION_getter() : Int { return untyped __php__("imagick::IMGTYPE_COLORSEPARATION"); }
	public static inline var IMGTYPE_COLORSEPARATIONMATTE(IMGTYPE_COLORSEPARATIONMATTE_getter, null) : Int; private static inline function IMGTYPE_COLORSEPARATIONMATTE_getter() : Int { return untyped __php__("imagick::IMGTYPE_COLORSEPARATIONMATTE"); }
	public static inline var IMGTYPE_OPTIMIZE(IMGTYPE_OPTIMIZE_getter, null) : Int; private static inline function IMGTYPE_OPTIMIZE_getter() : Int { return untyped __php__("imagick::IMGTYPE_OPTIMIZE"); }
	public static inline var RESOLUTION_UNDEFINED(RESOLUTION_UNDEFINED_getter, null) : Int; private static inline function RESOLUTION_UNDEFINED_getter() : Int { return untyped __php__("imagick::RESOLUTION_UNDEFINED"); }
	public static inline var RESOLUTION_PIXELSPERINCH(RESOLUTION_PIXELSPERINCH_getter, null) : Int; private static inline function RESOLUTION_PIXELSPERINCH_getter() : Int { return untyped __php__("imagick::RESOLUTION_PIXELSPERINCH"); }
	public static inline var RESOLUTION_PIXELSPERCENTIMETER(RESOLUTION_PIXELSPERCENTIMETER_getter, null) : Int; private static inline function RESOLUTION_PIXELSPERCENTIMETER_getter() : Int { return untyped __php__("imagick::RESOLUTION_PIXELSPERCENTIMETER"); }
	public static inline var COMPRESSION_UNDEFINED(COMPRESSION_UNDEFINED_getter, null) : Int; private static inline function COMPRESSION_UNDEFINED_getter() : Int { return untyped __php__("imagick::COMPRESSION_UNDEFINED"); }
	public static inline var COMPRESSION_NO(COMPRESSION_NO_getter, null) : Int; private static inline function COMPRESSION_NO_getter() : Int { return untyped __php__("imagick::COMPRESSION_NO"); }
	public static inline var COMPRESSION_BZIP(COMPRESSION_BZIP_getter, null) : Int; private static inline function COMPRESSION_BZIP_getter() : Int { return untyped __php__("imagick::COMPRESSION_BZIP"); }
	public static inline var COMPRESSION_FAX(COMPRESSION_FAX_getter, null) : Int; private static inline function COMPRESSION_FAX_getter() : Int { return untyped __php__("imagick::COMPRESSION_FAX"); }
	public static inline var COMPRESSION_GROUP4(COMPRESSION_GROUP4_getter, null) : Int; private static inline function COMPRESSION_GROUP4_getter() : Int { return untyped __php__("imagick::COMPRESSION_GROUP4"); }
	public static inline var COMPRESSION_JPEG(COMPRESSION_JPEG_getter, null) : Int; private static inline function COMPRESSION_JPEG_getter() : Int { return untyped __php__("imagick::COMPRESSION_JPEG"); }
	public static inline var COMPRESSION_JPEG2000(COMPRESSION_JPEG2000_getter, null) : Int; private static inline function COMPRESSION_JPEG2000_getter() : Int { return untyped __php__("imagick::COMPRESSION_JPEG2000"); }
	public static inline var COMPRESSION_LOSSLESSJPEG(COMPRESSION_LOSSLESSJPEG_getter, null) : Int; private static inline function COMPRESSION_LOSSLESSJPEG_getter() : Int { return untyped __php__("imagick::COMPRESSION_LOSSLESSJPEG"); }
	public static inline var COMPRESSION_LZW(COMPRESSION_LZW_getter, null) : Int; private static inline function COMPRESSION_LZW_getter() : Int { return untyped __php__("imagick::COMPRESSION_LZW"); }
	public static inline var COMPRESSION_RLE(COMPRESSION_RLE_getter, null) : Int; private static inline function COMPRESSION_RLE_getter() : Int { return untyped __php__("imagick::COMPRESSION_RLE"); }
	public static inline var COMPRESSION_ZIP(COMPRESSION_ZIP_getter, null) : Int; private static inline function COMPRESSION_ZIP_getter() : Int { return untyped __php__("imagick::COMPRESSION_ZIP"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.0 or higher. 
	 */
	public static inline var COMPRESSION_DXT1(COMPRESSION_DXT1_getter, null) : Int; private static inline function COMPRESSION_DXT1_getter() : Int { return untyped __php__("imagick::COMPRESSION_DXT1"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.0 or higher. 
	 */
	public static inline var COMPRESSION_DXT3(COMPRESSION_DXT3_getter, null) : Int; private static inline function COMPRESSION_DXT3_getter() : Int { return untyped __php__("imagick::COMPRESSION_DXT3"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.0 or higher. 
	 */
	public static inline var COMPRESSION_DXT5(COMPRESSION_DXT5_getter, null) : Int; private static inline function COMPRESSION_DXT5_getter() : Int { return untyped __php__("imagick::COMPRESSION_DXT5"); }
	public static inline var PAINT_POINT(PAINT_POINT_getter, null) : Int; private static inline function PAINT_POINT_getter() : Int { return untyped __php__("imagick::PAINT_POINT"); }
	public static inline var PAINT_REPLACE(PAINT_REPLACE_getter, null) : Int; private static inline function PAINT_REPLACE_getter() : Int { return untyped __php__("imagick::PAINT_REPLACE"); }
	public static inline var PAINT_FLOODFILL(PAINT_FLOODFILL_getter, null) : Int; private static inline function PAINT_FLOODFILL_getter() : Int { return untyped __php__("imagick::PAINT_FLOODFILL"); }
	public static inline var PAINT_FILLTOBORDER(PAINT_FILLTOBORDER_getter, null) : Int; private static inline function PAINT_FILLTOBORDER_getter() : Int { return untyped __php__("imagick::PAINT_FILLTOBORDER"); }
	public static inline var PAINT_RESET(PAINT_RESET_getter, null) : Int; private static inline function PAINT_RESET_getter() : Int { return untyped __php__("imagick::PAINT_RESET"); }
	public static inline var GRAVITY_NORTHWEST(GRAVITY_NORTHWEST_getter, null) : Int; private static inline function GRAVITY_NORTHWEST_getter() : Int { return untyped __php__("imagick::GRAVITY_NORTHWEST"); }
	public static inline var GRAVITY_NORTH(GRAVITY_NORTH_getter, null) : Int; private static inline function GRAVITY_NORTH_getter() : Int { return untyped __php__("imagick::GRAVITY_NORTH"); }
	public static inline var GRAVITY_NORTHEAST(GRAVITY_NORTHEAST_getter, null) : Int; private static inline function GRAVITY_NORTHEAST_getter() : Int { return untyped __php__("imagick::GRAVITY_NORTHEAST"); }
	public static inline var GRAVITY_WEST(GRAVITY_WEST_getter, null) : Int; private static inline function GRAVITY_WEST_getter() : Int { return untyped __php__("imagick::GRAVITY_WEST"); }
	public static inline var GRAVITY_CENTER(GRAVITY_CENTER_getter, null) : Int; private static inline function GRAVITY_CENTER_getter() : Int { return untyped __php__("imagick::GRAVITY_CENTER"); }
	public static inline var GRAVITY_EAST(GRAVITY_EAST_getter, null) : Int; private static inline function GRAVITY_EAST_getter() : Int { return untyped __php__("imagick::GRAVITY_EAST"); }
	public static inline var GRAVITY_SOUTHWEST(GRAVITY_SOUTHWEST_getter, null) : Int; private static inline function GRAVITY_SOUTHWEST_getter() : Int { return untyped __php__("imagick::GRAVITY_SOUTHWEST"); }
	public static inline var GRAVITY_SOUTH(GRAVITY_SOUTH_getter, null) : Int; private static inline function GRAVITY_SOUTH_getter() : Int { return untyped __php__("imagick::GRAVITY_SOUTH"); }
	public static inline var GRAVITY_SOUTHEAST(GRAVITY_SOUTHEAST_getter, null) : Int; private static inline function GRAVITY_SOUTHEAST_getter() : Int { return untyped __php__("imagick::GRAVITY_SOUTHEAST"); }
	public static inline var STRETCH_NORMAL(STRETCH_NORMAL_getter, null) : Int; private static inline function STRETCH_NORMAL_getter() : Int { return untyped __php__("imagick::STRETCH_NORMAL"); }
	public static inline var STRETCH_ULTRACONDENSED(STRETCH_ULTRACONDENSED_getter, null) : Int; private static inline function STRETCH_ULTRACONDENSED_getter() : Int { return untyped __php__("imagick::STRETCH_ULTRACONDENSED"); }
	public static inline var STRETCH_CONDENSED(STRETCH_CONDENSED_getter, null) : Int; private static inline function STRETCH_CONDENSED_getter() : Int { return untyped __php__("imagick::STRETCH_CONDENSED"); }
	public static inline var STRETCH_SEMICONDENSED(STRETCH_SEMICONDENSED_getter, null) : Int; private static inline function STRETCH_SEMICONDENSED_getter() : Int { return untyped __php__("imagick::STRETCH_SEMICONDENSED"); }
	public static inline var STRETCH_SEMIEXPANDED(STRETCH_SEMIEXPANDED_getter, null) : Int; private static inline function STRETCH_SEMIEXPANDED_getter() : Int { return untyped __php__("imagick::STRETCH_SEMIEXPANDED"); }
	public static inline var STRETCH_EXPANDED(STRETCH_EXPANDED_getter, null) : Int; private static inline function STRETCH_EXPANDED_getter() : Int { return untyped __php__("imagick::STRETCH_EXPANDED"); }
	public static inline var STRETCH_EXTRAEXPANDED(STRETCH_EXTRAEXPANDED_getter, null) : Int; private static inline function STRETCH_EXTRAEXPANDED_getter() : Int { return untyped __php__("imagick::STRETCH_EXTRAEXPANDED"); }
	public static inline var STRETCH_ULTRAEXPANDED(STRETCH_ULTRAEXPANDED_getter, null) : Int; private static inline function STRETCH_ULTRAEXPANDED_getter() : Int { return untyped __php__("imagick::STRETCH_ULTRAEXPANDED"); }
	public static inline var STRETCH_ANY(STRETCH_ANY_getter, null) : Int; private static inline function STRETCH_ANY_getter() : Int { return untyped __php__("imagick::STRETCH_ANY"); }
	public static inline var ALIGN_UNDEFINED(ALIGN_UNDEFINED_getter, null) : Int; private static inline function ALIGN_UNDEFINED_getter() : Int { return untyped __php__("imagick::ALIGN_UNDEFINED"); }
	public static inline var ALIGN_LEFT(ALIGN_LEFT_getter, null) : Int; private static inline function ALIGN_LEFT_getter() : Int { return untyped __php__("imagick::ALIGN_LEFT"); }
	public static inline var ALIGN_CENTER(ALIGN_CENTER_getter, null) : Int; private static inline function ALIGN_CENTER_getter() : Int { return untyped __php__("imagick::ALIGN_CENTER"); }
	public static inline var ALIGN_RIGHT(ALIGN_RIGHT_getter, null) : Int; private static inline function ALIGN_RIGHT_getter() : Int { return untyped __php__("imagick::ALIGN_RIGHT"); }
	public static inline var DECORATION_NO(DECORATION_NO_getter, null) : Int; private static inline function DECORATION_NO_getter() : Int { return untyped __php__("imagick::DECORATION_NO"); }
	public static inline var DECORATION_UNDERLINE(DECORATION_UNDERLINE_getter, null) : Int; private static inline function DECORATION_UNDERLINE_getter() : Int { return untyped __php__("imagick::DECORATION_UNDERLINE"); }
	public static inline var DECORATION_OVERLINE(DECORATION_OVERLINE_getter, null) : Int; private static inline function DECORATION_OVERLINE_getter() : Int { return untyped __php__("imagick::DECORATION_OVERLINE"); }
	public static inline var DECORATION_LINETROUGH(DECORATION_LINETROUGH_getter, null) : Int; private static inline function DECORATION_LINETROUGH_getter() : Int { return untyped __php__("imagick::DECORATION_LINETROUGH"); }
	public static inline var NOISE_UNIFORM(NOISE_UNIFORM_getter, null) : Int; private static inline function NOISE_UNIFORM_getter() : Int { return untyped __php__("imagick::NOISE_UNIFORM"); }
	public static inline var NOISE_GAUSSIAN(NOISE_GAUSSIAN_getter, null) : Int; private static inline function NOISE_GAUSSIAN_getter() : Int { return untyped __php__("imagick::NOISE_GAUSSIAN"); }
	public static inline var NOISE_MULTIPLICATIVEGAUSSIAN(NOISE_MULTIPLICATIVEGAUSSIAN_getter, null) : Int; private static inline function NOISE_MULTIPLICATIVEGAUSSIAN_getter() : Int { return untyped __php__("imagick::NOISE_MULTIPLICATIVEGAUSSIAN"); }
	public static inline var NOISE_IMPULSE(NOISE_IMPULSE_getter, null) : Int; private static inline function NOISE_IMPULSE_getter() : Int { return untyped __php__("imagick::NOISE_IMPULSE"); }
	public static inline var NOISE_LAPLACIAN(NOISE_LAPLACIAN_getter, null) : Int; private static inline function NOISE_LAPLACIAN_getter() : Int { return untyped __php__("imagick::NOISE_LAPLACIAN"); }
	public static inline var NOISE_POISSON(NOISE_POISSON_getter, null) : Int; private static inline function NOISE_POISSON_getter() : Int { return untyped __php__("imagick::NOISE_POISSON"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.6 or higher. 
	 */
	public static inline var NOISE_RANDOM(NOISE_RANDOM_getter, null) : Int; private static inline function NOISE_RANDOM_getter() : Int { return untyped __php__("imagick::NOISE_RANDOM"); }
	public static inline var CHANNEL_UNDEFINED(CHANNEL_UNDEFINED_getter, null) : Int; private static inline function CHANNEL_UNDEFINED_getter() : Int { return untyped __php__("imagick::CHANNEL_UNDEFINED"); }
	public static inline var CHANNEL_RED(CHANNEL_RED_getter, null) : Int; private static inline function CHANNEL_RED_getter() : Int { return untyped __php__("imagick::CHANNEL_RED"); }
	public static inline var CHANNEL_GRAY(CHANNEL_GRAY_getter, null) : Int; private static inline function CHANNEL_GRAY_getter() : Int { return untyped __php__("imagick::CHANNEL_GRAY"); }
	public static inline var CHANNEL_CYAN(CHANNEL_CYAN_getter, null) : Int; private static inline function CHANNEL_CYAN_getter() : Int { return untyped __php__("imagick::CHANNEL_CYAN"); }
	public static inline var CHANNEL_GREEN(CHANNEL_GREEN_getter, null) : Int; private static inline function CHANNEL_GREEN_getter() : Int { return untyped __php__("imagick::CHANNEL_GREEN"); }
	public static inline var CHANNEL_MAGENTA(CHANNEL_MAGENTA_getter, null) : Int; private static inline function CHANNEL_MAGENTA_getter() : Int { return untyped __php__("imagick::CHANNEL_MAGENTA"); }
	public static inline var CHANNEL_BLUE(CHANNEL_BLUE_getter, null) : Int; private static inline function CHANNEL_BLUE_getter() : Int { return untyped __php__("imagick::CHANNEL_BLUE"); }
	public static inline var CHANNEL_YELLOW(CHANNEL_YELLOW_getter, null) : Int; private static inline function CHANNEL_YELLOW_getter() : Int { return untyped __php__("imagick::CHANNEL_YELLOW"); }
	public static inline var CHANNEL_ALPHA(CHANNEL_ALPHA_getter, null) : Int; private static inline function CHANNEL_ALPHA_getter() : Int { return untyped __php__("imagick::CHANNEL_ALPHA"); }
	public static inline var CHANNEL_OPACITY(CHANNEL_OPACITY_getter, null) : Int; private static inline function CHANNEL_OPACITY_getter() : Int { return untyped __php__("imagick::CHANNEL_OPACITY"); }
	public static inline var CHANNEL_MATTE(CHANNEL_MATTE_getter, null) : Int; private static inline function CHANNEL_MATTE_getter() : Int { return untyped __php__("imagick::CHANNEL_MATTE"); }
	public static inline var CHANNEL_BLACK(CHANNEL_BLACK_getter, null) : Int; private static inline function CHANNEL_BLACK_getter() : Int { return untyped __php__("imagick::CHANNEL_BLACK"); }
	public static inline var CHANNEL_INDEX(CHANNEL_INDEX_getter, null) : Int; private static inline function CHANNEL_INDEX_getter() : Int { return untyped __php__("imagick::CHANNEL_INDEX"); }
	public static inline var CHANNEL_ALL(CHANNEL_ALL_getter, null) : Int; private static inline function CHANNEL_ALL_getter() : Int { return untyped __php__("imagick::CHANNEL_ALL"); }
	public static inline var CHANNEL_DEFAULT(CHANNEL_DEFAULT_getter, null) : Int; private static inline function CHANNEL_DEFAULT_getter() : Int { return untyped __php__("imagick::CHANNEL_DEFAULT"); }
	public static inline var METRIC_UNDEFINED(METRIC_UNDEFINED_getter, null) : Int; private static inline function METRIC_UNDEFINED_getter() : Int { return untyped __php__("imagick::METRIC_UNDEFINED"); }
	public static inline var METRIC_MEANABSOLUTEERROR(METRIC_MEANABSOLUTEERROR_getter, null) : Int; private static inline function METRIC_MEANABSOLUTEERROR_getter() : Int { return untyped __php__("imagick::METRIC_MEANABSOLUTEERROR"); }
	public static inline var METRIC_MEANSQUAREERROR(METRIC_MEANSQUAREERROR_getter, null) : Int; private static inline function METRIC_MEANSQUAREERROR_getter() : Int { return untyped __php__("imagick::METRIC_MEANSQUAREERROR"); }
	public static inline var METRIC_PEAKABSOLUTEERROR(METRIC_PEAKABSOLUTEERROR_getter, null) : Int; private static inline function METRIC_PEAKABSOLUTEERROR_getter() : Int { return untyped __php__("imagick::METRIC_PEAKABSOLUTEERROR"); }
	public static inline var METRIC_PEAKSIGNALTONOISERATIO(METRIC_PEAKSIGNALTONOISERATIO_getter, null) : Int; private static inline function METRIC_PEAKSIGNALTONOISERATIO_getter() : Int { return untyped __php__("imagick::METRIC_PEAKSIGNALTONOISERATIO"); }
	public static inline var METRIC_ROOTMEANSQUAREDERROR(METRIC_ROOTMEANSQUAREDERROR_getter, null) : Int; private static inline function METRIC_ROOTMEANSQUAREDERROR_getter() : Int { return untyped __php__("imagick::METRIC_ROOTMEANSQUAREDERROR"); }
	public static inline var PIXEL_CHAR(PIXEL_CHAR_getter, null) : Int; private static inline function PIXEL_CHAR_getter() : Int { return untyped __php__("imagick::PIXEL_CHAR"); }
	public static inline var PIXEL_DOUBLE(PIXEL_DOUBLE_getter, null) : Int; private static inline function PIXEL_DOUBLE_getter() : Int { return untyped __php__("imagick::PIXEL_DOUBLE"); }
	public static inline var PIXEL_FLOAT(PIXEL_FLOAT_getter, null) : Int; private static inline function PIXEL_FLOAT_getter() : Int { return untyped __php__("imagick::PIXEL_FLOAT"); }
	public static inline var PIXEL_INTEGER(PIXEL_INTEGER_getter, null) : Int; private static inline function PIXEL_INTEGER_getter() : Int { return untyped __php__("imagick::PIXEL_INTEGER"); }
	public static inline var PIXEL_LONG(PIXEL_LONG_getter, null) : Int; private static inline function PIXEL_LONG_getter() : Int { return untyped __php__("imagick::PIXEL_LONG"); }
	public static inline var PIXEL_QUANTUM(PIXEL_QUANTUM_getter, null) : Int; private static inline function PIXEL_QUANTUM_getter() : Int { return untyped __php__("imagick::PIXEL_QUANTUM"); }
	public static inline var PIXEL_SHORT(PIXEL_SHORT_getter, null) : Int; private static inline function PIXEL_SHORT_getter() : Int { return untyped __php__("imagick::PIXEL_SHORT"); }
	public static inline var EVALUATE_UNDEFINED(EVALUATE_UNDEFINED_getter, null) : Int; private static inline function EVALUATE_UNDEFINED_getter() : Int { return untyped __php__("imagick::EVALUATE_UNDEFINED"); }
	public static inline var EVALUATE_ADD(EVALUATE_ADD_getter, null) : Int; private static inline function EVALUATE_ADD_getter() : Int { return untyped __php__("imagick::EVALUATE_ADD"); }
	public static inline var EVALUATE_AND(EVALUATE_AND_getter, null) : Int; private static inline function EVALUATE_AND_getter() : Int { return untyped __php__("imagick::EVALUATE_AND"); }
	public static inline var EVALUATE_DIVIDE(EVALUATE_DIVIDE_getter, null) : Int; private static inline function EVALUATE_DIVIDE_getter() : Int { return untyped __php__("imagick::EVALUATE_DIVIDE"); }
	public static inline var EVALUATE_LEFTSHIFT(EVALUATE_LEFTSHIFT_getter, null) : Int; private static inline function EVALUATE_LEFTSHIFT_getter() : Int { return untyped __php__("imagick::EVALUATE_LEFTSHIFT"); }
	public static inline var EVALUATE_MAX(EVALUATE_MAX_getter, null) : Int; private static inline function EVALUATE_MAX_getter() : Int { return untyped __php__("imagick::EVALUATE_MAX"); }
	public static inline var EVALUATE_MIN(EVALUATE_MIN_getter, null) : Int; private static inline function EVALUATE_MIN_getter() : Int { return untyped __php__("imagick::EVALUATE_MIN"); }
	public static inline var EVALUATE_MULTIPLY(EVALUATE_MULTIPLY_getter, null) : Int; private static inline function EVALUATE_MULTIPLY_getter() : Int { return untyped __php__("imagick::EVALUATE_MULTIPLY"); }
	public static inline var EVALUATE_OR(EVALUATE_OR_getter, null) : Int; private static inline function EVALUATE_OR_getter() : Int { return untyped __php__("imagick::EVALUATE_OR"); }
	public static inline var EVALUATE_RIGHTSHIFT(EVALUATE_RIGHTSHIFT_getter, null) : Int; private static inline function EVALUATE_RIGHTSHIFT_getter() : Int { return untyped __php__("imagick::EVALUATE_RIGHTSHIFT"); }
	public static inline var EVALUATE_SET(EVALUATE_SET_getter, null) : Int; private static inline function EVALUATE_SET_getter() : Int { return untyped __php__("imagick::EVALUATE_SET"); }
	public static inline var EVALUATE_SUBTRACT(EVALUATE_SUBTRACT_getter, null) : Int; private static inline function EVALUATE_SUBTRACT_getter() : Int { return untyped __php__("imagick::EVALUATE_SUBTRACT"); }
	public static inline var EVALUATE_XOR(EVALUATE_XOR_getter, null) : Int; private static inline function EVALUATE_XOR_getter() : Int { return untyped __php__("imagick::EVALUATE_XOR"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.4 or higher. 
	 */
	public static inline var EVALUATE_POW(EVALUATE_POW_getter, null) : Int; private static inline function EVALUATE_POW_getter() : Int { return untyped __php__("imagick::EVALUATE_POW"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.4 or higher. 
	 */
	public static inline var EVALUATE_LOG(EVALUATE_LOG_getter, null) : Int; private static inline function EVALUATE_LOG_getter() : Int { return untyped __php__("imagick::EVALUATE_LOG"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.4 or higher. 
	 */
	public static inline var EVALUATE_THRESHOLD(EVALUATE_THRESHOLD_getter, null) : Int; private static inline function EVALUATE_THRESHOLD_getter() : Int { return untyped __php__("imagick::EVALUATE_THRESHOLD"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.4 or higher. 
	 */
	public static inline var EVALUATE_THRESHOLDBLACK(EVALUATE_THRESHOLDBLACK_getter, null) : Int; private static inline function EVALUATE_THRESHOLDBLACK_getter() : Int { return untyped __php__("imagick::EVALUATE_THRESHOLDBLACK"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.4 or higher. 
	 */
	public static inline var EVALUATE_THRESHOLDWHITE(EVALUATE_THRESHOLDWHITE_getter, null) : Int; private static inline function EVALUATE_THRESHOLDWHITE_getter() : Int { return untyped __php__("imagick::EVALUATE_THRESHOLDWHITE"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.4 or higher. 
	 */
	public static inline var EVALUATE_GAUSSIANNOISE(EVALUATE_GAUSSIANNOISE_getter, null) : Int; private static inline function EVALUATE_GAUSSIANNOISE_getter() : Int { return untyped __php__("imagick::EVALUATE_GAUSSIANNOISE"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.4 or higher. 
	 */
	public static inline var EVALUATE_IMPULSENOISE(EVALUATE_IMPULSENOISE_getter, null) : Int; private static inline function EVALUATE_IMPULSENOISE_getter() : Int { return untyped __php__("imagick::EVALUATE_IMPULSENOISE"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.4 or higher. 
	 */
	public static inline var EVALUATE_LAPLACIANNOISE(EVALUATE_LAPLACIANNOISE_getter, null) : Int; private static inline function EVALUATE_LAPLACIANNOISE_getter() : Int { return untyped __php__("imagick::EVALUATE_LAPLACIANNOISE"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.4 or higher. 
	 */
	public static inline var EVALUATE_MULTIPLICATIVENOISE(EVALUATE_MULTIPLICATIVENOISE_getter, null) : Int; private static inline function EVALUATE_MULTIPLICATIVENOISE_getter() : Int { return untyped __php__("imagick::EVALUATE_MULTIPLICATIVENOISE"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.4 or higher. 
	 */
	public static inline var EVALUATE_POISSONNOISE(EVALUATE_POISSONNOISE_getter, null) : Int; private static inline function EVALUATE_POISSONNOISE_getter() : Int { return untyped __php__("imagick::EVALUATE_POISSONNOISE"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.4 or higher. 
	 */
	public static inline var EVALUATE_UNIFORMNOISE(EVALUATE_UNIFORMNOISE_getter, null) : Int; private static inline function EVALUATE_UNIFORMNOISE_getter() : Int { return untyped __php__("imagick::EVALUATE_UNIFORMNOISE"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.4 or higher. 
	 */
	public static inline var EVALUATE_COSINE(EVALUATE_COSINE_getter, null) : Int; private static inline function EVALUATE_COSINE_getter() : Int { return untyped __php__("imagick::EVALUATE_COSINE"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.4 or higher. 
	 */
	public static inline var EVALUATE_SINE(EVALUATE_SINE_getter, null) : Int; private static inline function EVALUATE_SINE_getter() : Int { return untyped __php__("imagick::EVALUATE_SINE"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.4 or higher. 
	 */
	public static inline var EVALUATE_ADDMODULUS(EVALUATE_ADDMODULUS_getter, null) : Int; private static inline function EVALUATE_ADDMODULUS_getter() : Int { return untyped __php__("imagick::EVALUATE_ADDMODULUS"); }
	public static inline var COLORSPACE_UNDEFINED(COLORSPACE_UNDEFINED_getter, null) : Int; private static inline function COLORSPACE_UNDEFINED_getter() : Int { return untyped __php__("imagick::COLORSPACE_UNDEFINED"); }
	public static inline var COLORSPACE_RGB(COLORSPACE_RGB_getter, null) : Int; private static inline function COLORSPACE_RGB_getter() : Int { return untyped __php__("imagick::COLORSPACE_RGB"); }
	public static inline var COLORSPACE_GRAY(COLORSPACE_GRAY_getter, null) : Int; private static inline function COLORSPACE_GRAY_getter() : Int { return untyped __php__("imagick::COLORSPACE_GRAY"); }
	public static inline var COLORSPACE_TRANSPARENT(COLORSPACE_TRANSPARENT_getter, null) : Int; private static inline function COLORSPACE_TRANSPARENT_getter() : Int { return untyped __php__("imagick::COLORSPACE_TRANSPARENT"); }
	public static inline var COLORSPACE_OHTA(COLORSPACE_OHTA_getter, null) : Int; private static inline function COLORSPACE_OHTA_getter() : Int { return untyped __php__("imagick::COLORSPACE_OHTA"); }
	public static inline var COLORSPACE_LAB(COLORSPACE_LAB_getter, null) : Int; private static inline function COLORSPACE_LAB_getter() : Int { return untyped __php__("imagick::COLORSPACE_LAB"); }
	public static inline var COLORSPACE_XYZ(COLORSPACE_XYZ_getter, null) : Int; private static inline function COLORSPACE_XYZ_getter() : Int { return untyped __php__("imagick::COLORSPACE_XYZ"); }
	public static inline var COLORSPACE_YCBCR(COLORSPACE_YCBCR_getter, null) : Int; private static inline function COLORSPACE_YCBCR_getter() : Int { return untyped __php__("imagick::COLORSPACE_YCBCR"); }
	public static inline var COLORSPACE_YCC(COLORSPACE_YCC_getter, null) : Int; private static inline function COLORSPACE_YCC_getter() : Int { return untyped __php__("imagick::COLORSPACE_YCC"); }
	public static inline var COLORSPACE_YIQ(COLORSPACE_YIQ_getter, null) : Int; private static inline function COLORSPACE_YIQ_getter() : Int { return untyped __php__("imagick::COLORSPACE_YIQ"); }
	public static inline var COLORSPACE_YPBPR(COLORSPACE_YPBPR_getter, null) : Int; private static inline function COLORSPACE_YPBPR_getter() : Int { return untyped __php__("imagick::COLORSPACE_YPBPR"); }
	public static inline var COLORSPACE_YUV(COLORSPACE_YUV_getter, null) : Int; private static inline function COLORSPACE_YUV_getter() : Int { return untyped __php__("imagick::COLORSPACE_YUV"); }
	public static inline var COLORSPACE_CMYK(COLORSPACE_CMYK_getter, null) : Int; private static inline function COLORSPACE_CMYK_getter() : Int { return untyped __php__("imagick::COLORSPACE_CMYK"); }
	public static inline var COLORSPACE_SRGB(COLORSPACE_SRGB_getter, null) : Int; private static inline function COLORSPACE_SRGB_getter() : Int { return untyped __php__("imagick::COLORSPACE_SRGB"); }
	public static inline var COLORSPACE_HSB(COLORSPACE_HSB_getter, null) : Int; private static inline function COLORSPACE_HSB_getter() : Int { return untyped __php__("imagick::COLORSPACE_HSB"); }
	public static inline var COLORSPACE_HSL(COLORSPACE_HSL_getter, null) : Int; private static inline function COLORSPACE_HSL_getter() : Int { return untyped __php__("imagick::COLORSPACE_HSL"); }
	public static inline var COLORSPACE_HWB(COLORSPACE_HWB_getter, null) : Int; private static inline function COLORSPACE_HWB_getter() : Int { return untyped __php__("imagick::COLORSPACE_HWB"); }
	public static inline var COLORSPACE_REC601LUMA(COLORSPACE_REC601LUMA_getter, null) : Int; private static inline function COLORSPACE_REC601LUMA_getter() : Int { return untyped __php__("imagick::COLORSPACE_REC601LUMA"); }
	public static inline var COLORSPACE_REC709LUMA(COLORSPACE_REC709LUMA_getter, null) : Int; private static inline function COLORSPACE_REC709LUMA_getter() : Int { return untyped __php__("imagick::COLORSPACE_REC709LUMA"); }
	public static inline var COLORSPACE_LOG(COLORSPACE_LOG_getter, null) : Int; private static inline function COLORSPACE_LOG_getter() : Int { return untyped __php__("imagick::COLORSPACE_LOG"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.2 or higher. 
	 */
	public static inline var COLORSPACE_CMY(COLORSPACE_CMY_getter, null) : Int; private static inline function COLORSPACE_CMY_getter() : Int { return untyped __php__("imagick::COLORSPACE_CMY"); }
	public static inline var VIRTUALPIXELMETHOD_UNDEFINED(VIRTUALPIXELMETHOD_UNDEFINED_getter, null) : Int; private static inline function VIRTUALPIXELMETHOD_UNDEFINED_getter() : Int { return untyped __php__("imagick::VIRTUALPIXELMETHOD_UNDEFINED"); }
	public static inline var VIRTUALPIXELMETHOD_BACKGROUND(VIRTUALPIXELMETHOD_BACKGROUND_getter, null) : Int; private static inline function VIRTUALPIXELMETHOD_BACKGROUND_getter() : Int { return untyped __php__("imagick::VIRTUALPIXELMETHOD_BACKGROUND"); }
	public static inline var VIRTUALPIXELMETHOD_CONSTANT(VIRTUALPIXELMETHOD_CONSTANT_getter, null) : Int; private static inline function VIRTUALPIXELMETHOD_CONSTANT_getter() : Int { return untyped __php__("imagick::VIRTUALPIXELMETHOD_CONSTANT"); }
	public static inline var VIRTUALPIXELMETHOD_EDGE(VIRTUALPIXELMETHOD_EDGE_getter, null) : Int; private static inline function VIRTUALPIXELMETHOD_EDGE_getter() : Int { return untyped __php__("imagick::VIRTUALPIXELMETHOD_EDGE"); }
	public static inline var VIRTUALPIXELMETHOD_MIRROR(VIRTUALPIXELMETHOD_MIRROR_getter, null) : Int; private static inline function VIRTUALPIXELMETHOD_MIRROR_getter() : Int { return untyped __php__("imagick::VIRTUALPIXELMETHOD_MIRROR"); }
	public static inline var VIRTUALPIXELMETHOD_TILE(VIRTUALPIXELMETHOD_TILE_getter, null) : Int; private static inline function VIRTUALPIXELMETHOD_TILE_getter() : Int { return untyped __php__("imagick::VIRTUALPIXELMETHOD_TILE"); }
	public static inline var VIRTUALPIXELMETHOD_TRANSPARENT(VIRTUALPIXELMETHOD_TRANSPARENT_getter, null) : Int; private static inline function VIRTUALPIXELMETHOD_TRANSPARENT_getter() : Int { return untyped __php__("imagick::VIRTUALPIXELMETHOD_TRANSPARENT"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.2 or higher. 
	 */
	public static inline var VIRTUALPIXELMETHOD_MASK(VIRTUALPIXELMETHOD_MASK_getter, null) : Int; private static inline function VIRTUALPIXELMETHOD_MASK_getter() : Int { return untyped __php__("imagick::VIRTUALPIXELMETHOD_MASK"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.2 or higher. 
	 */
	public static inline var VIRTUALPIXELMETHOD_BLACK(VIRTUALPIXELMETHOD_BLACK_getter, null) : Int; private static inline function VIRTUALPIXELMETHOD_BLACK_getter() : Int { return untyped __php__("imagick::VIRTUALPIXELMETHOD_BLACK"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.2 or higher. 
	 */
	public static inline var VIRTUALPIXELMETHOD_GRAY(VIRTUALPIXELMETHOD_GRAY_getter, null) : Int; private static inline function VIRTUALPIXELMETHOD_GRAY_getter() : Int { return untyped __php__("imagick::VIRTUALPIXELMETHOD_GRAY"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.2 or higher. 
	 */
	public static inline var VIRTUALPIXELMETHOD_WHITE(VIRTUALPIXELMETHOD_WHITE_getter, null) : Int; private static inline function VIRTUALPIXELMETHOD_WHITE_getter() : Int { return untyped __php__("imagick::VIRTUALPIXELMETHOD_WHITE"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.3 or higher. 
	 */
	public static inline var VIRTUALPIXELMETHOD_HORIZONTALTILE(VIRTUALPIXELMETHOD_HORIZONTALTILE_getter, null) : Int; private static inline function VIRTUALPIXELMETHOD_HORIZONTALTILE_getter() : Int { return untyped __php__("imagick::VIRTUALPIXELMETHOD_HORIZONTALTILE"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.3 or higher. 
	 */
	public static inline var VIRTUALPIXELMETHOD_VERTICALTILE(VIRTUALPIXELMETHOD_VERTICALTILE_getter, null) : Int; private static inline function VIRTUALPIXELMETHOD_VERTICALTILE_getter() : Int { return untyped __php__("imagick::VIRTUALPIXELMETHOD_VERTICALTILE"); }
	public static inline var PREVIEW_UNDEFINED(PREVIEW_UNDEFINED_getter, null) : Int; private static inline function PREVIEW_UNDEFINED_getter() : Int { return untyped __php__("imagick::PREVIEW_UNDEFINED"); }
	public static inline var PREVIEW_ROTATE(PREVIEW_ROTATE_getter, null) : Int; private static inline function PREVIEW_ROTATE_getter() : Int { return untyped __php__("imagick::PREVIEW_ROTATE"); }
	public static inline var PREVIEW_SHEAR(PREVIEW_SHEAR_getter, null) : Int; private static inline function PREVIEW_SHEAR_getter() : Int { return untyped __php__("imagick::PREVIEW_SHEAR"); }
	public static inline var PREVIEW_ROLL(PREVIEW_ROLL_getter, null) : Int; private static inline function PREVIEW_ROLL_getter() : Int { return untyped __php__("imagick::PREVIEW_ROLL"); }
	public static inline var PREVIEW_HUE(PREVIEW_HUE_getter, null) : Int; private static inline function PREVIEW_HUE_getter() : Int { return untyped __php__("imagick::PREVIEW_HUE"); }
	public static inline var PREVIEW_SATURATION(PREVIEW_SATURATION_getter, null) : Int; private static inline function PREVIEW_SATURATION_getter() : Int { return untyped __php__("imagick::PREVIEW_SATURATION"); }
	public static inline var PREVIEW_BRIGHTNESS(PREVIEW_BRIGHTNESS_getter, null) : Int; private static inline function PREVIEW_BRIGHTNESS_getter() : Int { return untyped __php__("imagick::PREVIEW_BRIGHTNESS"); }
	public static inline var PREVIEW_GAMMA(PREVIEW_GAMMA_getter, null) : Int; private static inline function PREVIEW_GAMMA_getter() : Int { return untyped __php__("imagick::PREVIEW_GAMMA"); }
	public static inline var PREVIEW_SPIFF(PREVIEW_SPIFF_getter, null) : Int; private static inline function PREVIEW_SPIFF_getter() : Int { return untyped __php__("imagick::PREVIEW_SPIFF"); }
	public static inline var PREVIEW_DULL(PREVIEW_DULL_getter, null) : Int; private static inline function PREVIEW_DULL_getter() : Int { return untyped __php__("imagick::PREVIEW_DULL"); }
	public static inline var PREVIEW_GRAYSCALE(PREVIEW_GRAYSCALE_getter, null) : Int; private static inline function PREVIEW_GRAYSCALE_getter() : Int { return untyped __php__("imagick::PREVIEW_GRAYSCALE"); }
	public static inline var PREVIEW_QUANTIZE(PREVIEW_QUANTIZE_getter, null) : Int; private static inline function PREVIEW_QUANTIZE_getter() : Int { return untyped __php__("imagick::PREVIEW_QUANTIZE"); }
	public static inline var PREVIEW_DESPECKLE(PREVIEW_DESPECKLE_getter, null) : Int; private static inline function PREVIEW_DESPECKLE_getter() : Int { return untyped __php__("imagick::PREVIEW_DESPECKLE"); }
	public static inline var PREVIEW_REDUCENOISE(PREVIEW_REDUCENOISE_getter, null) : Int; private static inline function PREVIEW_REDUCENOISE_getter() : Int { return untyped __php__("imagick::PREVIEW_REDUCENOISE"); }
	public static inline var PREVIEW_ADDNOISE(PREVIEW_ADDNOISE_getter, null) : Int; private static inline function PREVIEW_ADDNOISE_getter() : Int { return untyped __php__("imagick::PREVIEW_ADDNOISE"); }
	public static inline var PREVIEW_SHARPEN(PREVIEW_SHARPEN_getter, null) : Int; private static inline function PREVIEW_SHARPEN_getter() : Int { return untyped __php__("imagick::PREVIEW_SHARPEN"); }
	public static inline var PREVIEW_BLUR(PREVIEW_BLUR_getter, null) : Int; private static inline function PREVIEW_BLUR_getter() : Int { return untyped __php__("imagick::PREVIEW_BLUR"); }
	public static inline var PREVIEW_THRESHOLD(PREVIEW_THRESHOLD_getter, null) : Int; private static inline function PREVIEW_THRESHOLD_getter() : Int { return untyped __php__("imagick::PREVIEW_THRESHOLD"); }
	public static inline var PREVIEW_EDGEDETECT(PREVIEW_EDGEDETECT_getter, null) : Int; private static inline function PREVIEW_EDGEDETECT_getter() : Int { return untyped __php__("imagick::PREVIEW_EDGEDETECT"); }
	public static inline var PREVIEW_SPREAD(PREVIEW_SPREAD_getter, null) : Int; private static inline function PREVIEW_SPREAD_getter() : Int { return untyped __php__("imagick::PREVIEW_SPREAD"); }
	public static inline var PREVIEW_SOLARIZE(PREVIEW_SOLARIZE_getter, null) : Int; private static inline function PREVIEW_SOLARIZE_getter() : Int { return untyped __php__("imagick::PREVIEW_SOLARIZE"); }
	public static inline var PREVIEW_SHADE(PREVIEW_SHADE_getter, null) : Int; private static inline function PREVIEW_SHADE_getter() : Int { return untyped __php__("imagick::PREVIEW_SHADE"); }
	public static inline var PREVIEW_RAISE(PREVIEW_RAISE_getter, null) : Int; private static inline function PREVIEW_RAISE_getter() : Int { return untyped __php__("imagick::PREVIEW_RAISE"); }
	public static inline var PREVIEW_SEGMENT(PREVIEW_SEGMENT_getter, null) : Int; private static inline function PREVIEW_SEGMENT_getter() : Int { return untyped __php__("imagick::PREVIEW_SEGMENT"); }
	public static inline var PREVIEW_SWIRL(PREVIEW_SWIRL_getter, null) : Int; private static inline function PREVIEW_SWIRL_getter() : Int { return untyped __php__("imagick::PREVIEW_SWIRL"); }
	public static inline var PREVIEW_IMPLODE(PREVIEW_IMPLODE_getter, null) : Int; private static inline function PREVIEW_IMPLODE_getter() : Int { return untyped __php__("imagick::PREVIEW_IMPLODE"); }
	public static inline var PREVIEW_WAVE(PREVIEW_WAVE_getter, null) : Int; private static inline function PREVIEW_WAVE_getter() : Int { return untyped __php__("imagick::PREVIEW_WAVE"); }
	public static inline var PREVIEW_OILPAINT(PREVIEW_OILPAINT_getter, null) : Int; private static inline function PREVIEW_OILPAINT_getter() : Int { return untyped __php__("imagick::PREVIEW_OILPAINT"); }
	public static inline var PREVIEW_CHARCOALDRAWING(PREVIEW_CHARCOALDRAWING_getter, null) : Int; private static inline function PREVIEW_CHARCOALDRAWING_getter() : Int { return untyped __php__("imagick::PREVIEW_CHARCOALDRAWING"); }
	public static inline var PREVIEW_JPEG(PREVIEW_JPEG_getter, null) : Int; private static inline function PREVIEW_JPEG_getter() : Int { return untyped __php__("imagick::PREVIEW_JPEG"); }
	public static inline var RENDERINGINTENT_UNDEFINED(RENDERINGINTENT_UNDEFINED_getter, null) : Int; private static inline function RENDERINGINTENT_UNDEFINED_getter() : Int { return untyped __php__("imagick::RENDERINGINTENT_UNDEFINED"); }
	public static inline var RENDERINGINTENT_SATURATION(RENDERINGINTENT_SATURATION_getter, null) : Int; private static inline function RENDERINGINTENT_SATURATION_getter() : Int { return untyped __php__("imagick::RENDERINGINTENT_SATURATION"); }
	public static inline var RENDERINGINTENT_PERCEPTUAL(RENDERINGINTENT_PERCEPTUAL_getter, null) : Int; private static inline function RENDERINGINTENT_PERCEPTUAL_getter() : Int { return untyped __php__("imagick::RENDERINGINTENT_PERCEPTUAL"); }
	public static inline var RENDERINGINTENT_ABSOLUTE(RENDERINGINTENT_ABSOLUTE_getter, null) : Int; private static inline function RENDERINGINTENT_ABSOLUTE_getter() : Int { return untyped __php__("imagick::RENDERINGINTENT_ABSOLUTE"); }
	public static inline var RENDERINGINTENT_RELATIVE(RENDERINGINTENT_RELATIVE_getter, null) : Int; private static inline function RENDERINGINTENT_RELATIVE_getter() : Int { return untyped __php__("imagick::RENDERINGINTENT_RELATIVE"); }
	public static inline var INTERLACE_UNDEFINED(INTERLACE_UNDEFINED_getter, null) : Int; private static inline function INTERLACE_UNDEFINED_getter() : Int { return untyped __php__("imagick::INTERLACE_UNDEFINED"); }
	public static inline var INTERLACE_NO(INTERLACE_NO_getter, null) : Int; private static inline function INTERLACE_NO_getter() : Int { return untyped __php__("imagick::INTERLACE_NO"); }
	public static inline var INTERLACE_LINE(INTERLACE_LINE_getter, null) : Int; private static inline function INTERLACE_LINE_getter() : Int { return untyped __php__("imagick::INTERLACE_LINE"); }
	public static inline var INTERLACE_PLANE(INTERLACE_PLANE_getter, null) : Int; private static inline function INTERLACE_PLANE_getter() : Int { return untyped __php__("imagick::INTERLACE_PLANE"); }
	public static inline var INTERLACE_PARTITION(INTERLACE_PARTITION_getter, null) : Int; private static inline function INTERLACE_PARTITION_getter() : Int { return untyped __php__("imagick::INTERLACE_PARTITION"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.4 or higher. 
	 */
	public static inline var INTERLACE_GIF(INTERLACE_GIF_getter, null) : Int; private static inline function INTERLACE_GIF_getter() : Int { return untyped __php__("imagick::INTERLACE_GIF"); }
	public static inline var INTERLACE_JPEG(INTERLACE_JPEG_getter, null) : Int; private static inline function INTERLACE_JPEG_getter() : Int { return untyped __php__("imagick::INTERLACE_JPEG"); }
	public static inline var INTERLACE_PNG(INTERLACE_PNG_getter, null) : Int; private static inline function INTERLACE_PNG_getter() : Int { return untyped __php__("imagick::INTERLACE_PNG"); }
	public static inline var FILLRULE_UNDEFINED(FILLRULE_UNDEFINED_getter, null) : Int; private static inline function FILLRULE_UNDEFINED_getter() : Int { return untyped __php__("imagick::FILLRULE_UNDEFINED"); }
	public static inline var FILLRULE_EVENODD(FILLRULE_EVENODD_getter, null) : Int; private static inline function FILLRULE_EVENODD_getter() : Int { return untyped __php__("imagick::FILLRULE_EVENODD"); }
	public static inline var FILLRULE_NONZERO(FILLRULE_NONZERO_getter, null) : Int; private static inline function FILLRULE_NONZERO_getter() : Int { return untyped __php__("imagick::FILLRULE_NONZERO"); }
	public static inline var PATHUNITS_UNDEFINED(PATHUNITS_UNDEFINED_getter, null) : Int; private static inline function PATHUNITS_UNDEFINED_getter() : Int { return untyped __php__("imagick::PATHUNITS_UNDEFINED"); }
	public static inline var PATHUNITS_USERSPACE(PATHUNITS_USERSPACE_getter, null) : Int; private static inline function PATHUNITS_USERSPACE_getter() : Int { return untyped __php__("imagick::PATHUNITS_USERSPACE"); }
	public static inline var PATHUNITS_USERSPACEONUSE(PATHUNITS_USERSPACEONUSE_getter, null) : Int; private static inline function PATHUNITS_USERSPACEONUSE_getter() : Int { return untyped __php__("imagick::PATHUNITS_USERSPACEONUSE"); }
	public static inline var PATHUNITS_OBJECTBOUNDINGBOX(PATHUNITS_OBJECTBOUNDINGBOX_getter, null) : Int; private static inline function PATHUNITS_OBJECTBOUNDINGBOX_getter() : Int { return untyped __php__("imagick::PATHUNITS_OBJECTBOUNDINGBOX"); }
	public static inline var LINECAP_UNDEFINED(LINECAP_UNDEFINED_getter, null) : Int; private static inline function LINECAP_UNDEFINED_getter() : Int { return untyped __php__("imagick::LINECAP_UNDEFINED"); }
	public static inline var LINECAP_BUTT(LINECAP_BUTT_getter, null) : Int; private static inline function LINECAP_BUTT_getter() : Int { return untyped __php__("imagick::LINECAP_BUTT"); }
	public static inline var LINECAP_ROUND(LINECAP_ROUND_getter, null) : Int; private static inline function LINECAP_ROUND_getter() : Int { return untyped __php__("imagick::LINECAP_ROUND"); }
	public static inline var LINECAP_SQUARE(LINECAP_SQUARE_getter, null) : Int; private static inline function LINECAP_SQUARE_getter() : Int { return untyped __php__("imagick::LINECAP_SQUARE"); }
	public static inline var LINEJOIN_UNDEFINED(LINEJOIN_UNDEFINED_getter, null) : Int; private static inline function LINEJOIN_UNDEFINED_getter() : Int { return untyped __php__("imagick::LINEJOIN_UNDEFINED"); }
	public static inline var LINEJOIN_MITER(LINEJOIN_MITER_getter, null) : Int; private static inline function LINEJOIN_MITER_getter() : Int { return untyped __php__("imagick::LINEJOIN_MITER"); }
	public static inline var LINEJOIN_ROUND(LINEJOIN_ROUND_getter, null) : Int; private static inline function LINEJOIN_ROUND_getter() : Int { return untyped __php__("imagick::LINEJOIN_ROUND"); }
	public static inline var LINEJOIN_BEVEL(LINEJOIN_BEVEL_getter, null) : Int; private static inline function LINEJOIN_BEVEL_getter() : Int { return untyped __php__("imagick::LINEJOIN_BEVEL"); }
	public static inline var RESOURCETYPE_UNDEFINED(RESOURCETYPE_UNDEFINED_getter, null) : Int; private static inline function RESOURCETYPE_UNDEFINED_getter() : Int { return untyped __php__("imagick::RESOURCETYPE_UNDEFINED"); }
	public static inline var RESOURCETYPE_AREA(RESOURCETYPE_AREA_getter, null) : Int; private static inline function RESOURCETYPE_AREA_getter() : Int { return untyped __php__("imagick::RESOURCETYPE_AREA"); }
	public static inline var RESOURCETYPE_DISK(RESOURCETYPE_DISK_getter, null) : Int; private static inline function RESOURCETYPE_DISK_getter() : Int { return untyped __php__("imagick::RESOURCETYPE_DISK"); }
	public static inline var RESOURCETYPE_FILE(RESOURCETYPE_FILE_getter, null) : Int; private static inline function RESOURCETYPE_FILE_getter() : Int { return untyped __php__("imagick::RESOURCETYPE_FILE"); }
	public static inline var RESOURCETYPE_MAP(RESOURCETYPE_MAP_getter, null) : Int; private static inline function RESOURCETYPE_MAP_getter() : Int { return untyped __php__("imagick::RESOURCETYPE_MAP"); }
	public static inline var RESOURCETYPE_MEMORY(RESOURCETYPE_MEMORY_getter, null) : Int; private static inline function RESOURCETYPE_MEMORY_getter() : Int { return untyped __php__("imagick::RESOURCETYPE_MEMORY"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.2.9 or higher. 
	 */
	public static inline var LAYERMETHOD_UNDEFINED(LAYERMETHOD_UNDEFINED_getter, null) : Int; private static inline function LAYERMETHOD_UNDEFINED_getter() : Int { return untyped __php__("imagick::LAYERMETHOD_UNDEFINED"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.2.9 or higher. 
	 */
	public static inline var LAYERMETHOD_COALESCE(LAYERMETHOD_COALESCE_getter, null) : Int; private static inline function LAYERMETHOD_COALESCE_getter() : Int { return untyped __php__("imagick::LAYERMETHOD_COALESCE"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.2.9 or higher. 
	 */
	public static inline var LAYERMETHOD_COMPAREANY(LAYERMETHOD_COMPAREANY_getter, null) : Int; private static inline function LAYERMETHOD_COMPAREANY_getter() : Int { return untyped __php__("imagick::LAYERMETHOD_COMPAREANY"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.2.9 or higher. 
	 */
	public static inline var LAYERMETHOD_COMPARECLEAR(LAYERMETHOD_COMPARECLEAR_getter, null) : Int; private static inline function LAYERMETHOD_COMPARECLEAR_getter() : Int { return untyped __php__("imagick::LAYERMETHOD_COMPARECLEAR"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.2.9 or higher. 
	 */
	public static inline var LAYERMETHOD_COMPAREOVERLAY(LAYERMETHOD_COMPAREOVERLAY_getter, null) : Int; private static inline function LAYERMETHOD_COMPAREOVERLAY_getter() : Int { return untyped __php__("imagick::LAYERMETHOD_COMPAREOVERLAY"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.2.9 or higher. 
	 */
	public static inline var LAYERMETHOD_DISPOSE(LAYERMETHOD_DISPOSE_getter, null) : Int; private static inline function LAYERMETHOD_DISPOSE_getter() : Int { return untyped __php__("imagick::LAYERMETHOD_DISPOSE"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.2.9 or higher. 
	 */
	public static inline var LAYERMETHOD_OPTIMIZE(LAYERMETHOD_OPTIMIZE_getter, null) : Int; private static inline function LAYERMETHOD_OPTIMIZE_getter() : Int { return untyped __php__("imagick::LAYERMETHOD_OPTIMIZE"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.2.9 or higher. 
	 */
	public static inline var LAYERMETHOD_OPTIMIZEPLUS(LAYERMETHOD_OPTIMIZEPLUS_getter, null) : Int; private static inline function LAYERMETHOD_OPTIMIZEPLUS_getter() : Int { return untyped __php__("imagick::LAYERMETHOD_OPTIMIZEPLUS"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.0 or higher. 
	 */
	public static inline var LAYERMETHOD_OPTIMIZEIMAGE(LAYERMETHOD_OPTIMIZEIMAGE_getter, null) : Int; private static inline function LAYERMETHOD_OPTIMIZEIMAGE_getter() : Int { return untyped __php__("imagick::LAYERMETHOD_OPTIMIZEIMAGE"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.0 or higher. 
	 */
	public static inline var LAYERMETHOD_OPTIMIZETRANS(LAYERMETHOD_OPTIMIZETRANS_getter, null) : Int; private static inline function LAYERMETHOD_OPTIMIZETRANS_getter() : Int { return untyped __php__("imagick::LAYERMETHOD_OPTIMIZETRANS"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.0 or higher. 
	 */
	public static inline var LAYERMETHOD_REMOVEDUPS(LAYERMETHOD_REMOVEDUPS_getter, null) : Int; private static inline function LAYERMETHOD_REMOVEDUPS_getter() : Int { return untyped __php__("imagick::LAYERMETHOD_REMOVEDUPS"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.0 or higher. 
	 */
	public static inline var LAYERMETHOD_REMOVEZERO(LAYERMETHOD_REMOVEZERO_getter, null) : Int; private static inline function LAYERMETHOD_REMOVEZERO_getter() : Int { return untyped __php__("imagick::LAYERMETHOD_REMOVEZERO"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.0 or higher. 
	 */
	public static inline var LAYERMETHOD_COMPOSITE(LAYERMETHOD_COMPOSITE_getter, null) : Int; private static inline function LAYERMETHOD_COMPOSITE_getter() : Int { return untyped __php__("imagick::LAYERMETHOD_COMPOSITE"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.7 or higher. 
	 */
	public static inline var LAYERMETHOD_MERGE(LAYERMETHOD_MERGE_getter, null) : Int; private static inline function LAYERMETHOD_MERGE_getter() : Int { return untyped __php__("imagick::LAYERMETHOD_MERGE"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.7 or higher. 
	 */
	public static inline var LAYERMETHOD_FLATTEN(LAYERMETHOD_FLATTEN_getter, null) : Int; private static inline function LAYERMETHOD_FLATTEN_getter() : Int { return untyped __php__("imagick::LAYERMETHOD_FLATTEN"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.7 or higher. 
	 */
	public static inline var LAYERMETHOD_MOSAIC(LAYERMETHOD_MOSAIC_getter, null) : Int; private static inline function LAYERMETHOD_MOSAIC_getter() : Int { return untyped __php__("imagick::LAYERMETHOD_MOSAIC"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.0 or higher. 
	 */
	public static inline var ORIENTATION_UNDEFINED(ORIENTATION_UNDEFINED_getter, null) : Int; private static inline function ORIENTATION_UNDEFINED_getter() : Int { return untyped __php__("imagick::ORIENTATION_UNDEFINED"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.0 or higher. 
	 */
	public static inline var ORIENTATION_TOPLEFT(ORIENTATION_TOPLEFT_getter, null) : Int; private static inline function ORIENTATION_TOPLEFT_getter() : Int { return untyped __php__("imagick::ORIENTATION_TOPLEFT"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.0 or higher. 
	 */
	public static inline var ORIENTATION_TOPRIGHT(ORIENTATION_TOPRIGHT_getter, null) : Int; private static inline function ORIENTATION_TOPRIGHT_getter() : Int { return untyped __php__("imagick::ORIENTATION_TOPRIGHT"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.0 or higher. 
	 */
	public static inline var ORIENTATION_BOTTOMRIGHT(ORIENTATION_BOTTOMRIGHT_getter, null) : Int; private static inline function ORIENTATION_BOTTOMRIGHT_getter() : Int { return untyped __php__("imagick::ORIENTATION_BOTTOMRIGHT"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.0 or higher. 
	 */
	public static inline var ORIENTATION_BOTTOMLEFT(ORIENTATION_BOTTOMLEFT_getter, null) : Int; private static inline function ORIENTATION_BOTTOMLEFT_getter() : Int { return untyped __php__("imagick::ORIENTATION_BOTTOMLEFT"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.0 or higher. 
	 */
	public static inline var ORIENTATION_LEFTTOP(ORIENTATION_LEFTTOP_getter, null) : Int; private static inline function ORIENTATION_LEFTTOP_getter() : Int { return untyped __php__("imagick::ORIENTATION_LEFTTOP"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.0 or higher. 
	 */
	public static inline var ORIENTATION_RIGHTTOP(ORIENTATION_RIGHTTOP_getter, null) : Int; private static inline function ORIENTATION_RIGHTTOP_getter() : Int { return untyped __php__("imagick::ORIENTATION_RIGHTTOP"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.0 or higher. 
	 */
	public static inline var ORIENTATION_RIGHTBOTTOM(ORIENTATION_RIGHTBOTTOM_getter, null) : Int; private static inline function ORIENTATION_RIGHTBOTTOM_getter() : Int { return untyped __php__("imagick::ORIENTATION_RIGHTBOTTOM"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.0 or higher. 
	 */
	public static inline var ORIENTATION_LEFTBOTTOM(ORIENTATION_LEFTBOTTOM_getter, null) : Int; private static inline function ORIENTATION_LEFTBOTTOM_getter() : Int { return untyped __php__("imagick::ORIENTATION_LEFTBOTTOM"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.6 or higher. 
	 */
	public static inline var DISTORTION_UNDEFINED(DISTORTION_UNDEFINED_getter, null) : Int; private static inline function DISTORTION_UNDEFINED_getter() : Int { return untyped __php__("imagick::DISTORTION_UNDEFINED"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.6 or higher. 
	 */
	public static inline var DISTORTION_AFFINE(DISTORTION_AFFINE_getter, null) : Int; private static inline function DISTORTION_AFFINE_getter() : Int { return untyped __php__("imagick::DISTORTION_AFFINE"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.6 or higher. 
	 */
	public static inline var DISTORTION_AFFINEPROJECTION(DISTORTION_AFFINEPROJECTION_getter, null) : Int; private static inline function DISTORTION_AFFINEPROJECTION_getter() : Int { return untyped __php__("imagick::DISTORTION_AFFINEPROJECTION"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.6 or higher. 
	 */
	public static inline var DISTORTION_ARC(DISTORTION_ARC_getter, null) : Int; private static inline function DISTORTION_ARC_getter() : Int { return untyped __php__("imagick::DISTORTION_ARC"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.6 or higher. 
	 */
	public static inline var DISTORTION_BILINEAR(DISTORTION_BILINEAR_getter, null) : Int; private static inline function DISTORTION_BILINEAR_getter() : Int { return untyped __php__("imagick::DISTORTION_BILINEAR"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.6 or higher. 
	 */
	public static inline var DISTORTION_PERSPECTIVE(DISTORTION_PERSPECTIVE_getter, null) : Int; private static inline function DISTORTION_PERSPECTIVE_getter() : Int { return untyped __php__("imagick::DISTORTION_PERSPECTIVE"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.6 or higher. 
	 */
	public static inline var DISTORTION_PERSPECTIVEPROJECTION(DISTORTION_PERSPECTIVEPROJECTION_getter, null) : Int; private static inline function DISTORTION_PERSPECTIVEPROJECTION_getter() : Int { return untyped __php__("imagick::DISTORTION_PERSPECTIVEPROJECTION"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.6 or higher. 
	 */
	public static inline var DISTORTION_SCALEROTATETRANSLATE(DISTORTION_SCALEROTATETRANSLATE_getter, null) : Int; private static inline function DISTORTION_SCALEROTATETRANSLATE_getter() : Int { return untyped __php__("imagick::DISTORTION_SCALEROTATETRANSLATE"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.6 or higher. 
	 */
	public static inline var DISTORTION_POLYNOMIAL(DISTORTION_POLYNOMIAL_getter, null) : Int; private static inline function DISTORTION_POLYNOMIAL_getter() : Int { return untyped __php__("imagick::DISTORTION_POLYNOMIAL"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.6 or higher. 
	 */
	public static inline var DISTORTION_POLAR(DISTORTION_POLAR_getter, null) : Int; private static inline function DISTORTION_POLAR_getter() : Int { return untyped __php__("imagick::DISTORTION_POLAR"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.6 or higher. 
	 */
	public static inline var DISTORTION_DEPOLAR(DISTORTION_DEPOLAR_getter, null) : Int; private static inline function DISTORTION_DEPOLAR_getter() : Int { return untyped __php__("imagick::DISTORTION_DEPOLAR"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.6 or higher. 
	 */
	public static inline var DISTORTION_BARREL(DISTORTION_BARREL_getter, null) : Int; private static inline function DISTORTION_BARREL_getter() : Int { return untyped __php__("imagick::DISTORTION_BARREL"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.6 or higher. 
	 */
	public static inline var DISTORTION_BARRELINVERSE(DISTORTION_BARRELINVERSE_getter, null) : Int; private static inline function DISTORTION_BARRELINVERSE_getter() : Int { return untyped __php__("imagick::DISTORTION_BARRELINVERSE"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.6 or higher. 
	 */
	public static inline var DISTORTION_SHEPARDS(DISTORTION_SHEPARDS_getter, null) : Int; private static inline function DISTORTION_SHEPARDS_getter() : Int { return untyped __php__("imagick::DISTORTION_SHEPARDS"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.6 or higher. 
	 */
	public static inline var DISTORTION_SENTINEL(DISTORTION_SENTINEL_getter, null) : Int; private static inline function DISTORTION_SENTINEL_getter() : Int { return untyped __php__("imagick::DISTORTION_SENTINEL"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.8 or higher. 
	 */
	public static inline var ALPHACHANNEL_ACTIVATE(ALPHACHANNEL_ACTIVATE_getter, null) : Int; private static inline function ALPHACHANNEL_ACTIVATE_getter() : Int { return untyped __php__("imagick::ALPHACHANNEL_ACTIVATE"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.8 or higher. 
	 */
	public static inline var ALPHACHANNEL_DEACTIVATE(ALPHACHANNEL_DEACTIVATE_getter, null) : Int; private static inline function ALPHACHANNEL_DEACTIVATE_getter() : Int { return untyped __php__("imagick::ALPHACHANNEL_DEACTIVATE"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.8 or higher. 
	 */
	public static inline var ALPHACHANNEL_RESET(ALPHACHANNEL_RESET_getter, null) : Int; private static inline function ALPHACHANNEL_RESET_getter() : Int { return untyped __php__("imagick::ALPHACHANNEL_RESET"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.8 or higher. 
	 */
	public static inline var ALPHACHANNEL_SET(ALPHACHANNEL_SET_getter, null) : Int; private static inline function ALPHACHANNEL_SET_getter() : Int { return untyped __php__("imagick::ALPHACHANNEL_SET"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.6 or higher. 
	 */
	public static inline var ALPHACHANNEL_UNDEFINED(ALPHACHANNEL_UNDEFINED_getter, null) : Int; private static inline function ALPHACHANNEL_UNDEFINED_getter() : Int { return untyped __php__("imagick::ALPHACHANNEL_UNDEFINED"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.6 or higher. 
	 */
	public static inline var ALPHACHANNEL_COPY(ALPHACHANNEL_COPY_getter, null) : Int; private static inline function ALPHACHANNEL_COPY_getter() : Int { return untyped __php__("imagick::ALPHACHANNEL_COPY"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.6 or higher. 
	 */
	public static inline var ALPHACHANNEL_EXTRACT(ALPHACHANNEL_EXTRACT_getter, null) : Int; private static inline function ALPHACHANNEL_EXTRACT_getter() : Int { return untyped __php__("imagick::ALPHACHANNEL_EXTRACT"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.6 or higher. 
	 */
	public static inline var ALPHACHANNEL_OPAQUE(ALPHACHANNEL_OPAQUE_getter, null) : Int; private static inline function ALPHACHANNEL_OPAQUE_getter() : Int { return untyped __php__("imagick::ALPHACHANNEL_OPAQUE"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.6 or higher. 
	 */
	public static inline var ALPHACHANNEL_SHAPE(ALPHACHANNEL_SHAPE_getter, null) : Int; private static inline function ALPHACHANNEL_SHAPE_getter() : Int { return untyped __php__("imagick::ALPHACHANNEL_SHAPE"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.6 or higher. 
	 */
	public static inline var ALPHACHANNEL_TRANSPARENT(ALPHACHANNEL_TRANSPARENT_getter, null) : Int; private static inline function ALPHACHANNEL_TRANSPARENT_getter() : Int { return untyped __php__("imagick::ALPHACHANNEL_TRANSPARENT"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.6 or higher. 
	 */
	public static inline var SPARSECOLORMETHOD_UNDEFINED(SPARSECOLORMETHOD_UNDEFINED_getter, null) : Int; private static inline function SPARSECOLORMETHOD_UNDEFINED_getter() : Int { return untyped __php__("imagick::SPARSECOLORMETHOD_UNDEFINED"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.6 or higher. 
	 */
	public static inline var SPARSECOLORMETHOD_BARYCENTRIC(SPARSECOLORMETHOD_BARYCENTRIC_getter, null) : Int; private static inline function SPARSECOLORMETHOD_BARYCENTRIC_getter() : Int { return untyped __php__("imagick::SPARSECOLORMETHOD_BARYCENTRIC"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.6 or higher. 
	 */
	public static inline var SPARSECOLORMETHOD_BILINEAR(SPARSECOLORMETHOD_BILINEAR_getter, null) : Int; private static inline function SPARSECOLORMETHOD_BILINEAR_getter() : Int { return untyped __php__("imagick::SPARSECOLORMETHOD_BILINEAR"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.6 or higher. 
	 */
	public static inline var SPARSECOLORMETHOD_POLYNOMIAL(SPARSECOLORMETHOD_POLYNOMIAL_getter, null) : Int; private static inline function SPARSECOLORMETHOD_POLYNOMIAL_getter() : Int { return untyped __php__("imagick::SPARSECOLORMETHOD_POLYNOMIAL"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.6 or higher. 
	 */
	public static inline var SPARSECOLORMETHOD_SPEPARDS(SPARSECOLORMETHOD_SPEPARDS_getter, null) : Int; private static inline function SPARSECOLORMETHOD_SPEPARDS_getter() : Int { return untyped __php__("imagick::SPARSECOLORMETHOD_SPEPARDS"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.6 or higher. 
	 */
	public static inline var SPARSECOLORMETHOD_VORONOI(SPARSECOLORMETHOD_VORONOI_getter, null) : Int; private static inline function SPARSECOLORMETHOD_VORONOI_getter() : Int { return untyped __php__("imagick::SPARSECOLORMETHOD_VORONOI"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.9 or higher. 
	 */
	public static inline var FUNCTION_UNDEFINED(FUNCTION_UNDEFINED_getter, null) : Int; private static inline function FUNCTION_UNDEFINED_getter() : Int { return untyped __php__("imagick::FUNCTION_UNDEFINED"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.9 or higher. 
	 */
	public static inline var FUNCTION_POLYNOMIAL(FUNCTION_POLYNOMIAL_getter, null) : Int; private static inline function FUNCTION_POLYNOMIAL_getter() : Int { return untyped __php__("imagick::FUNCTION_POLYNOMIAL"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.9 or higher. 
	 */
	public static inline var FUNCTION_SINUSOID(FUNCTION_SINUSOID_getter, null) : Int; private static inline function FUNCTION_SINUSOID_getter() : Int { return untyped __php__("imagick::FUNCTION_SINUSOID"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.2 or higher. 
	 */
	public static inline var INTERPOLATE_UNDEFINED(INTERPOLATE_UNDEFINED_getter, null) : Int; private static inline function INTERPOLATE_UNDEFINED_getter() : Int { return untyped __php__("imagick::INTERPOLATE_UNDEFINED"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.2 or higher. 
	 */
	public static inline var INTERPOLATE_AVERAGE(INTERPOLATE_AVERAGE_getter, null) : Int; private static inline function INTERPOLATE_AVERAGE_getter() : Int { return untyped __php__("imagick::INTERPOLATE_AVERAGE"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.2 or higher. 
	 */
	public static inline var INTERPOLATE_BICUBIC(INTERPOLATE_BICUBIC_getter, null) : Int; private static inline function INTERPOLATE_BICUBIC_getter() : Int { return untyped __php__("imagick::INTERPOLATE_BICUBIC"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.2 or higher. 
	 */
	public static inline var INTERPOLATE_BILINEAR(INTERPOLATE_BILINEAR_getter, null) : Int; private static inline function INTERPOLATE_BILINEAR_getter() : Int { return untyped __php__("imagick::INTERPOLATE_BILINEAR"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.2 or higher. 
	 */
	public static inline var INTERPOLATE_FILTER(INTERPOLATE_FILTER_getter, null) : Int; private static inline function INTERPOLATE_FILTER_getter() : Int { return untyped __php__("imagick::INTERPOLATE_FILTER"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.2 or higher. 
	 */
	public static inline var INTERPOLATE_INTEGER(INTERPOLATE_INTEGER_getter, null) : Int; private static inline function INTERPOLATE_INTEGER_getter() : Int { return untyped __php__("imagick::INTERPOLATE_INTEGER"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.2 or higher. 
	 */
	public static inline var INTERPOLATE_MESH(INTERPOLATE_MESH_getter, null) : Int; private static inline function INTERPOLATE_MESH_getter() : Int { return untyped __php__("imagick::INTERPOLATE_MESH"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.2 or higher. 
	 */
	public static inline var INTERPOLATE_NEARESTNEIGHBOR(INTERPOLATE_NEARESTNEIGHBOR_getter, null) : Int; private static inline function INTERPOLATE_NEARESTNEIGHBOR_getter() : Int { return untyped __php__("imagick::INTERPOLATE_NEARESTNEIGHBOR"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.3.4 or higher. 
	 */
	public static inline var INTERPOLATE_SPLINE(INTERPOLATE_SPLINE_getter, null) : Int; private static inline function INTERPOLATE_SPLINE_getter() : Int { return untyped __php__("imagick::INTERPOLATE_SPLINE"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.6 or higher. 
	 */
	public static inline var DITHERMETHOD_UNDEFINED(DITHERMETHOD_UNDEFINED_getter, null) : Int; private static inline function DITHERMETHOD_UNDEFINED_getter() : Int { return untyped __php__("imagick::DITHERMETHOD_UNDEFINED"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.6 or higher. 
	 */
	public static inline var DITHERMETHOD_NO(DITHERMETHOD_NO_getter, null) : Int; private static inline function DITHERMETHOD_NO_getter() : Int { return untyped __php__("imagick::DITHERMETHOD_NO"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.6 or higher. 
	 */
	public static inline var DITHERMETHOD_RIEMERSMA(DITHERMETHOD_RIEMERSMA_getter, null) : Int; private static inline function DITHERMETHOD_RIEMERSMA_getter() : Int { return untyped __php__("imagick::DITHERMETHOD_RIEMERSMA"); }

	/**
	 * This constant is available if Imagick has been compiled against ImageMagick version 6.4.6 or higher. 
	 */
	public static inline var DITHERMETHOD_FLOYDSTEINBERG(DITHERMETHOD_FLOYDSTEINBERG_getter, null) : Int; private static inline function DITHERMETHOD_FLOYDSTEINBERG_getter() : Int { return untyped __php__("imagick::DITHERMETHOD_FLOYDSTEINBERG"); }  

	public function adaptiveBlurImage(radius:Float, sigma:Float, ?channel:Int = Imagick.CHANNEL_DEFAULT) : Bool;
	public function adaptiveResizeImage(columns:Int, rows:Int, ?bestfit:Bool = false) : Bool;
	public function adaptiveSharpenImage(radius:Float, sigma:Float, ?channel:Int = Imagick.CHANNEL_DEFAULT) : Bool;
	public function adaptiveThresholdImage(width:Int, height:Int, offset:Int) : Bool;
	public function addImage(source:Imagick) : Bool;
	public function addNoiseImage(noise_type:Int, ?channel:Int = Imagick.CHANNEL_DEFAULT) : Bool;
	public function affineTransformImage(matrix:ImagickDraw) : Bool;
	public function animateImages(x_server:String) : Bool;
	public function annotateImage(draw_settings:ImagickDraw, x:Float, y:Float, angle:Float, text:String) : Bool;
	public function appendImages(stack:Bool) : Imagick;
	public function averageImages() : Imagick;
	public function blackThresholdImage(threshold:Dynamic) : Bool;
	public function blurImage(radius:Float, sigma:Float, ?channel:Int) : Bool;
	public function borderImage(bordercolor:Dynamic, width:Int, height:Int) : Bool;
	public function charcoalImage(radius:Float, sigma:Float) : Bool;
	public function chopImage(width:Int, height:Int, x:Int, y:Int) : Bool;
	public function clear() : Bool;
	public function clipImage() : Bool;
	public function clipPathImage(pathname:String, inside:Bool) : Bool;
	
    inline public function clone() : Imagick { return Reflect.callMethod(this, 'clone', []); }
	
    public function clutImage(lookup_table:Imagick, ?channel:Float = Imagick.CHANNEL_DEFAULT) : Bool;
	public function coalesceImages() : Imagick;
	public function colorFloodfillImage(fill:Dynamic, fuzz:Float, bordercolor:Dynamic, x:Int, y:Int) : Bool;
	public function colorizeImage(colorize:Dynamic, opacity:Dynamic) : Bool;
	public function combineImages(channelType:Int) : Imagick;
	public function commentImage(comment:String) : Bool;
	public function compareImageChannels(image:Imagick, channelType:Int, metricType:Int) : NativeArray;
	public function compareImageLayers(method:Int) : Imagick;
	public function compareImages(compare:Imagick, metric:Int) : NativeArray;
	public function compositeImage(composite_object:Imagick, composite:Int, x:Int, y:Int, ?channel:Int = Imagick.CHANNEL_ALL) : Bool;
	public function new(?files:Dynamic) : Void;
	public function contrastImage(sharpen:Bool) : Bool;
	public function contrastStretchImage(black_point:Float, white_point:Float, ?channel:Int = Imagick.CHANNEL_ALL) : Bool;
	public function convolveImage(kernel:NativeArray, ?channel:Int = Imagick.CHANNEL_ALL) : Bool;
	public function cropImage(width:Int, height:Int, x:Int, y:Int) : Bool;
	public function cropThumbnailImage(width:Int, height:Int) : Bool;
	public function current() : Imagick;
	public function cycleColormapImage(displace:Int) : Bool;
	public function decipherImage(passphrase:String) : Bool;
	public function deconstructImages() : Imagick;
	public function deleteImageArtifact(artifact:String) : Bool;
	public function deskewImage(threshold:Float) : Bool;
	public function despeckleImage() : Bool;
	public function destroy() : Bool;
	public function displayImage(servername:String) : Bool;
	public function displayImages(servername:String) : Bool;
	public function distortImage(method:Int, arguments:NativeArray, bestfit:Bool) : Bool;
	public function drawImage(draw:ImagickDraw) : Bool;
	public function edgeImage(radius:Float) : Bool;
	public function embossImage(radius:Float, sigma:Float) : Bool;
	public function encipherImage(passphrase:String) : Bool;
	public function enhanceImage() : Bool;
	public function equalizeImage() : Bool;
	public function evaluateImage(op:Int, constant:Float, ?channel:Int = Imagick.CHANNEL_ALL) : Bool;
	public function exportImagePixels(x:Int, y:Int, width:Int, height:Int, map:String, STORAGE:Int) : NativeArray;
	public function extentImage(width:Int, height:Int, x:Int, y:Int) : Bool;
	public function flattenImages() : Imagick;
	public function flipImage() : Bool;
	public function floodFillPaintImage(fill:Dynamic, fuzz:Float, target:Dynamic, x:Int, y:Int, invert:Bool, ?channel:Int = Imagick.CHANNEL_DEFAULT) : Bool;
	public function flopImage() : Bool;
	public function frameImage(matte_color:Dynamic, width:Int, height:Int, inner_bevel:Int, outer_bevel:Int) : Bool;
	public function functionImage(func:Int, arguments:NativeArray, ?channel:Int = Imagick.CHANNEL_DEFAULT) : Bool;
	public function fxImage(expression:String, ?channel:Int = Imagick.CHANNEL_ALL) : Imagick;
	public function gammaImage(gamma:Float, ?channel:Int = Imagick.CHANNEL_ALL) : Bool;
	public function gaussianBlurImage(radius:Float, sigma:Float, ?channel:Int = Imagick.CHANNEL_ALL) : Bool;
	public function getColorspace() : Int;
	public function getCompression() : Int;
	public function getCompressionQuality() : Int;
	public function getCopyright() : String;
	public function getFilename() : String;
	public function getFont() : String;
	public function getFormat() : String;
	public function getGravity() : Int;
	public function getHomeURL() : String;
	public function getImage() : Imagick;
	public function getImageAlphaChannel() : Int;
	public function getImageArtifact(artifact:String) : String;
	public function getImageBackgroundColor() : ImagickPixel;
	public function getImageBlob() : String;
	public function getImageBluePrimary() : NativeArray;
	public function getImageBorderColor() : ImagickPixel;
	public function getImageChannelDepth(channel:Int) : Int;
	public function getImageChannelDistortion(reference:Imagick, channel:Int, metric:Int) : Float;
	public function getImageChannelDistortions(reference:Imagick, metric:Int, ?channel:Int = Imagick.CHANNEL_DEFAULT) : Float;
	public function getImageChannelExtrema(channel:Int) : NativeArray;
	public function getImageChannelKurtosis(?channel:Int = Imagick.CHANNEL_DEFAULT) : NativeArray;
	public function getImageChannelMean(channel:Int) : NativeArray;
	public function getImageChannelRange(channel:Int) : NativeArray;
	public function getImageChannelStatistics() : NativeArray;
	public function getImageClipMask() : Imagick;
	public function getImageColormapColor(index:Int) : ImagickPixel;
	public function getImageColors() : Int;
	public function getImageColorspace() : Int;
	public function getImageCompose() : Int;
	public function getImageCompression() : Int;
	public function getImageDelay() : Int;
	public function getImageDepth() : Int;
	public function getImageDispose() : Int;
	public function getImageDistortion(magickWand:Imagick, metric:Int) : Float;
	public function getImageExtrema() : NativeArray;
	public function getImageFilename() : String;
	public function getImageFormat() : String;
	public function getImageGamma() : Float;
	public function getImageGeometry() : NativeArray;
	public function getImageGravity() : Int;
	public function getImageGreenPrimary() : NativeArray;
	public function getImageHeight() : Int;
	public function getImageHistogram() : NativeArray;
	public function getImageIndex() : Int;
	public function getImageInterlaceScheme() : Int;
	public function getImageInterpolateMethod() : Int;
	public function getImageIterations() : Int;
	public function getImageLength() : Int;
	public function getImageMagickLicense() : String;
	public function getImageMatte() : Bool;
	public function getImageMatteColor() : ImagickPixel;
	public function getImageOrientation() : Int;
	public function getImagePage() : NativeArray;
	public function getImagePixelColor(x:Int, y:Int) : ImagickPixel;
	public function getImageProfile(name:String) : String;
	public function getImageProfiles(?pattern:String = "*", ?only_names:Bool = true) : NativeArray;
	public function getImageProperties(?pattern:String = "*", ?only_names:Bool = true) : NativeArray;
	public function getImageProperty(name:String) : String;
	public function getImageRedPrimary() : NativeArray;
	public function getImageRegion(width:Int, height:Int, x:Int, y:Int) : Imagick;
	public function getImageRenderingIntent() : Int;
	public function getImageResolution() : NativeArray;
	public function getImagesBlob() : String;
	public function getImageScene() : Int;
	public function getImageSignature() : String;
	public function getImageSize() : Int;
	public function getImageTicksPerSecond() : Int;
	public function getImageTotalInkDensity() : Float;
	public function getImageType() : Int;
	public function getImageUnits() : Int;
	public function getImageVirtualPixelMethod() : Int;
	public function getImageWhitePoint() : NativeArray;
	public function getImageWidth() : Int;
	public function getInterlaceScheme() : Int;
	public function getIteratorIndex() : Int;
	public function getNumberImages() : Int;
	public function getOption(key:String) : String;
	public function getPackageName() : String;
	public function getPage() : NativeArray;
	public function getPixelIterator() : ImagickPixelIterator;
	public function getPixelRegionIterator(x:Int, y:Int, columns:Int, rows:Int) : ImagickPixelIterator;
	public function getPointSize() : Float;
	public function getQuantumDepth() : NativeArray;
	public function getQuantumRange() : NativeArray;
	public function getReleaseDate() : String;
	public function getResource(type:Int) : Int;
	public function getResourceLimit(type:Int) : Int;
	public function getSamplingFactors() : NativeArray;
	public function getSize() : NativeArray;
	public function getSizeOffset() : Int;
	public function getVersion() : NativeArray;
	public function haldClutImage(clut:Imagick, ?channel:Int = Imagick.CHANNEL_DEFAULT) : Bool;
	public function hasNextImage() : Bool;
	public function hasPreviousImage() : Bool;
	public function identifyImage(?appendRawOutput:Bool = false) : NativeArray;
	public function implodeImage(radius:Float) : Bool;
	public function importImagePixels(x:Int, y:Int, width:Int, height:Int, map:String, storage:Int, pixels:NativeArray) : Bool;
	public function labelImage(label:String) : Bool;
	public function levelImage(blackPoint:Float, gamma:Float, whitePoint:Float, ?channel:Int = Imagick.CHANNEL_ALL) : Bool;
	public function linearStretchImage(blackPoint:Float, whitePoint:Float) : Bool;
	public function liquidRescaleImage(width:Int, height:Int, delta_x:Float, rigidity:Float) : Bool;
	public function magnifyImage() : Bool;
	public function mapImage(map:Imagick, dither:Bool) : Bool;
	public function matteFloodfillImage(alpha:Float, fuzz:Float, bordercolor:Dynamic, x:Int, y:Int) : Bool;
	public function medianFilterImage(radius:Float) : Bool;
	public function mergeImageLayers(layer_method:Int) : Bool;
	public function minifyImage() : Bool;
	public function modulateImage(brightness:Float, saturation:Float, hue:Float) : Bool;
	public function montageImage(draw:ImagickDraw, tile_geometry:String, thumbnail_geometry:String, mode:Int, frame:String) : Imagick;
	public function morphImages(number_frames:Int) : Imagick;
	public function mosaicImages() : Imagick;
	public function motionBlurImage(radius:Float, sigma:Float, angle:Float, ?channel:Int = Imagick.CHANNEL_DEFAULT) : Bool;
	public function negateImage(gray:Bool, ?channel:Int = Imagick.CHANNEL_ALL) : Bool;
	public function newImage(cols:Int, rows:Int, background:Dynamic, ?format:String) : Bool;
	public function newPseudoImage(columns:Int, rows:Int, pseudoString:String) : Bool;
	public function nextImage() : Bool;
	public function normalizeImage(?channel:Int = Imagick.CHANNEL_ALL) : Bool;
	public function oilPaintImage(radius:Float) : Bool;
	public function opaquePaintImage(target:Dynamic, fill:Dynamic, fuzz:Float, invert:Bool, ?channel:Int = Imagick.CHANNEL_DEFAULT) : Bool;
	public function optimizeImageLayers() : Bool;
	public function orderedPosterizeImage(threshold_map:String, ?channel:Int = Imagick.CHANNEL_ALL) : Bool;
	public function paintFloodfillImage(fill:Dynamic, fuzz:Float, bordercolor:Dynamic, x:Int, y:Int, ?channel:Int = Imagick.CHANNEL_ALL) : Bool;
	public function paintOpaqueImage(target:Dynamic, fill:Dynamic, fuzz:Float, ?channel:Int = Imagick.CHANNEL_ALL) : Bool;
	public function paintTransparentImage(target:Dynamic, alpha:Float, fuzz:Float) : Bool;
	public function pingImage(filename:String) : Bool;
	public function pingImageBlob(image:String) : Bool;
	public function pingImageFile(filehandle:Int/*resource*/, ?fileName:String) : Bool;
	public function polaroidImage(properties:ImagickDraw, angle:Float) : Bool;
	public function posterizeImage(levels:Int, dither:Bool) : Bool;
	public function previewImages(preview:Int) : Bool;
	public function previousImage() : Bool;
	public function profileImage(name:String, profile:String) : Bool;
	public function quantizeImage(numberColors:Int, colorspace:Int, treedepth:Int, dither:Bool, measureError:Bool) : Bool;
	public function quantizeImages(numberColors:Int, colorspace:Int, treedepth:Int, dither:Bool, measureError:Bool) : Bool;
	public function queryFontMetrics(properties:ImagickDraw, text:String, ?multiline:Bool) : NativeArray;
	public function queryFonts(?pattern:String = "*") : NativeArray;
	public function queryFormats(?pattern:String = "*") : NativeArray;
	public function radialBlurImage(angle:Float, ?channel:Int = Imagick.CHANNEL_ALL) : Bool;
	public function raiseImage(width:Int, height:Int, x:Int, y:Int, raise:Bool) : Bool;
	public function randomThresholdImage(low:Float, high:Float, ?channel:Int = Imagick.CHANNEL_ALL) : Bool;
	public function readImage(filename:String) : Bool;
	public function readImageBlob(image:String, ?filename:String) : Bool;
	public function readImageFile(filehandle:Int/*resource*/, ?fileName:String = null) : Bool;
	public function recolorImage(matrix:NativeArray) : Bool;
	public function reduceNoiseImage(radius:Float) : Bool;
	public function remapImage(replacement:Imagick, DITHER:Int) : Bool;
	public function removeImage() : Bool;
	public function removeImageProfile(name:String) : String;
	public function render() : Bool;
	public function resampleImage(x_resolution:Float, y_resolution:Float, filter:Int, blur:Float) : Bool;
	public function resetImagePage(page:String) : Bool;
	public function resizeImage(columns:Int, rows:Int, filter:Int, blur:Float, ?bestfit:Bool = false) : Bool;
	public function rollImage(x:Int, y:Int) : Bool;
	public function rotateImage(background:Dynamic, degrees:Float) : Bool;
	public function roundCorners(x_rounding:Float, y_rounding:Float, ?stroke_width:Float = 10, ?displace:Float = 5, ?size_correction:Float = -6) : Bool;
	public function sampleImage(columns:Int, rows:Int) : Bool;
	public function scaleImage(cols:Int, rows:Int, ?bestfit:Bool = false) : Bool;
	public function segmentImage(COLORSPACE:Int, cluster_threshold:Float, smooth_threshold:Float, ?verbose:Bool = false) : Bool;
	public function separateImageChannel(channel:Int) : Bool;
	public function sepiaToneImage(threshold:Float) : Bool;
	public function setBackgroundColor(background:Dynamic) : Bool;
	public function setColorspace(COLORSPACE:Int) : Bool;
	public function setCompression(compression:Int) : Bool;
	public function setCompressionQuality(quality:Int) : Bool;
	public function setFilename(filename:String) : Bool;
	public function setFirstIterator() : Bool;
	public function setFont(font:String) : Bool;
	public function setFormat(format:String) : Bool;
	public function setGravity(gravity:Int) : Bool;
	public function setImage(replace:Imagick) : Bool;
	public function setImageAlphaChannel(mode:Int) : Bool;
	public function setImageArtifact(artifact:String, value:String) : Bool;
	public function setImageBackgroundColor(background:Dynamic) : Bool;
	public function setImageBias(bias:Float) : Bool;
	public function setImageBluePrimary(x:Float, y:Float) : Bool;
	public function setImageBorderColor(border:Dynamic) : Bool;
	public function setImageChannelDepth(channel:Int, depth:Int) : Bool;
	public function setImageClipMask(clip_mask:Imagick) : Bool;
	public function setImageColormapColor(index:Int, color:ImagickPixel) : Bool;
	public function setImageColorspace(colorspace:Int) : Bool;
	public function setImageCompose(compose:Int) : Bool;
	public function setImageCompression(compression:Int) : Bool;
	public function setImageCompressionQuality(quality:Int) : Bool;
	public function setImageDelay(delay:Int) : Bool;
	public function setImageDepth(depth:Int) : Bool;
	public function setImageDispose(dispose:Int) : Bool;
	public function setImageExtent(columns:Int, rows:Int) : Bool;
	public function setImageFilename(filename:String) : Bool;
	public function setImageFormat(format:String) : Bool;
	public function setImageGamma(gamma:Float) : Bool;
	public function setImageGravity(gravity:Int) : Bool;
	public function setImageGreenPrimary(x:Float, y:Float) : Bool;
	public function setImageIndex(index:Int) : Bool;
	public function setImageInterlaceScheme(interlace_scheme:Int) : Bool;
	public function setImageInterpolateMethod(method:Int) : Bool;
	public function setImageIterations(iterations:Int) : Bool;
	public function setImageMatte(matte:Bool) : Bool;
	public function setImageMatteColor(matte:Dynamic) : Bool;
	public function setImageOpacity(opacity:Float) : Bool;
	public function setImageOrientation(orientation:Int) : Bool;
	public function setImagePage(width:Int, height:Int, x:Int, y:Int) : Bool;
	public function setImageProfile(name:String, profile:String) : Bool;
	public function setImageProperty(name:String, value:String) : Bool;
	public function setImageRedPrimary(x:Float, y:Float) : Bool;
	public function setImageRenderingIntent(rendering_intent:Int) : Bool;
	public function setImageResolution(x_resolution:Float, y_resolution:Float) : Bool;
	public function setImageScene(scene:Int) : Bool;
	public function setImageTicksPerSecond(ticks_per_second:Int) : Bool;
	public function setImageType(image_type:Int) : Bool;
	public function setImageUnits(units:Int) : Bool;
	public function setImageVirtualPixelMethod(method:Int) : Bool;
	public function setImageWhitePoint(x:Float, y:Float) : Bool;
	public function setInterlaceScheme(interlace_scheme:Int) : Bool;
	public function setIteratorIndex(index:Int) : Bool;
	public function setLastIterator() : Bool;
	public function setOption(key:String, value:String) : Bool;
	public function setPage(width:Int, height:Int, x:Int, y:Int) : Bool;
	public function setPointSize(point_size:Float) : Bool;
	public function setResolution(x_resolution:Float, y_resolution:Float) : Bool;
	public function setResourceLimit(type:Int, limit:Int) : Bool;
	public function setSamplingFactors(factors:NativeArray) : Bool;
	public function setSize(columns:Int, rows:Int) : Bool;
	public function setSizeOffset(columns:Int, rows:Int, offset:Int) : Bool;
	public function setType(image_type:Int) : Bool;
	public function shadeImage(gray:Bool, azimuth:Float, elevation:Float) : Bool;
	public function shadowImage(opacity:Float, sigma:Float, x:Int, y:Int) : Bool;
	public function sharpenImage(radius:Float, sigma:Float, ?channel:Int = Imagick.CHANNEL_ALL) : Bool;
	public function shaveImage(columns:Int, rows:Int) : Bool;
	public function shearImage(background:Dynamic, x_shear:Float, y_shear:Float) : Bool;
	public function sigmoidalContrastImage(sharpen:Bool, alpha:Float, beta:Float, ?channel:Int = Imagick.CHANNEL_ALL) : Bool;
	public function sketchImage(radius:Float, sigma:Float, angle:Float) : Bool;
	public function solarizeImage(threshold:Int) : Bool;
	public function sparseColorImage(SPARSE_METHOD:Int, arguments:NativeArray, ?channel:Int = Imagick.CHANNEL_DEFAULT) : Bool;
	public function spliceImage(width:Int, height:Int, x:Int, y:Int) : Bool;
	public function spreadImage(radius:Float) : Bool;
	public function steganoImage(watermark_wand:Imagick, offset:Int) : Imagick;
	public function stereoImage(offset_wand:Imagick) : Bool;
	public function stripImage() : Bool;
	public function swirlImage(degrees:Float) : Bool;
	public function textureImage(texture_wand:Imagick) : Bool;
	public function thresholdImage(threshold:Float, ?channel:Int = Imagick.CHANNEL_ALL) : Bool;
	public function thumbnailImage(columns:Int, rows:Int, ?bestfit:Bool = false, ?fill:Bool = false) : Bool;
	public function tintImage(tint:Dynamic, opacity:Dynamic) : Bool;
	public function transformImage(crop:String, geometry:String) : Imagick;
	public function transparentPaintImage(target:Dynamic, alpha:Float, fuzz:Float, invert:Bool) : Bool;
	public function transposeImage() : Bool;
	public function transverseImage() : Bool;
	public function trimImage(fuzz:Float) : Bool;
	public function uniqueImageColors() : Bool;
	public function unsharpMaskImage(radius:Float, sigma:Float, amount:Float, threshold:Float, ?channel:Int = Imagick.CHANNEL_ALL) : Bool;
	public function valid() : Bool;
	public function vignetteImage(blackPoint:Float, whitePoint:Float, x:Int, y:Int) : Bool;
	public function waveImage(amplitude:Float, length:Float) : Bool;
	public function whiteThresholdImage(threshold:Dynamic) : Bool;
	public function writeImage(?filename:String) : Bool;
	public function writeImageFile(filehandle:Int/*resource*/) : Bool;
	public function writeImages(filename:String, adjoin:Bool) : Bool;
	public function writeImagesFile(filehandle:Int/*resource*/) : Bool;
}