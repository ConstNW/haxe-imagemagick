package haxe.imagemagick;

#if php
private typedef PhpImagick = php.imagemagick.Imagick;
#elseif neko
private typedef NekoImagick = neko.imagemagick.Imagick;
import neko.imagemagick.ImagickPoint;
typedef ImagickCompositeOperator = neko.imagemagick.Imagick.ImagickCompositeOperator;
#end

class Imagick 
{
	#if php
	var pimg : PhpImagick;
	#elseif neko
	var nimg : NekoImagick;
	#end

	public function new(?file:String, ?img : #if php PhpImagick #elseif neko NekoImagick #end)
	{
		if (img != null)
		{
			#if php
			pimg = img;
			if (file != null ) pimg.readImage(file);
			#elseif neko
			nimg = img;
			if (file != null ) nimg.load(file);
			#end
		}
		else
		{
			#if php
			pimg = new PhpImagick(file);
			#elseif neko
			nimg = new NekoImagick(file);
			#end
		}
	}
	
	public function dispose()
	{
		#if php
		pimg.clear();
		pimg.destroy();
		#elseif neko
		//nimg.close();
		//nimg.Dispose();
		#end
	}
	
	public var width(width_getter, null) : Int;
	function width_getter() : Int
	{
		#if php
		return pimg.getImageWidth();
		#elseif neko
		return nimg.getWidth();
		#end
	}
	
	public var height(height_getter, null) : Int;
	function height_getter() : Int
	{
		#if php
		return pimg.getImageHeight();
		#elseif neko
		return nimg.getHeight();
		#end
	}
	
	public function resize(w:Int, h:Int)
	{
		#if php
		pimg.resizeImage(w, h, php.imagemagick.Imagick.FILTER_LANCZOS, 1.0);
		#elseif neko
		nimg.resize(w, h); 
		#end
	}
	
	public function save(path:String)
	{
		#if php
		pimg.writeImage(path);
		#elseif neko
		nimg.save(path);
		#end
	}
	
	public function colorFloodFill(fill:ImagickPixel, fuzz:Float, bordercolor:ImagickPixel, x:Int, y:Int) : Bool
	{
		#if php
		return pimg.colorFloodfillImage(fill, fuzz, bordercolor, x, y);
		#elseif neko
		return nimg.colorFloodFill(fill, fuzz, bordercolor, new ImagickPoint(x, y));
		#end
	}
	
	public function modulate(a:Float, b:Float, c:Float)
	{
		#if php
		return pimg.modulateImage(a, b, c);
		#elseif neko
		return nimg.modulate(a, b, c);
		#end
	}
	
	public function clone() : Imagick
	{
		#if php
		return new Imagick(null, pimg.clone());
		#elseif neko
		return new Imagick(null, nimg.clone());
		#end
	}
	
	public function blackThreshold(color:ImagickPixel)
	{
		#if php
		pimg.blackThresholdImage(color);
		#elseif neko
		nimg.blackThreshold(color);
		#end
	}
	
	public function whiteThreshold(color:ImagickPixel)
	{
		#if php
		pimg.whiteThresholdImage(color);
		#elseif neko
		nimg.whiteThreshold(color);
		#end
	}
	
	public function setMatte(b:Bool)
	{
		#if php
		return pimg.setImageMatte(b);
		#elseif neko
		return nimg.setMatte(b);
		#end
	}
	
	public function matteFloodFill(alpha:Float, fuzz:Float, color:ImagickPixel, x:Int, y:Int)
	{
		#if php
		pimg.matteFloodfillImage(alpha, fuzz, color, x, y);
		#elseif neko
		nimg.matteFloodFill(alpha, fuzz, color, x, y);
		#end
	}
	
	public function newImage(w:Int, h:Int, color:ImagickPixel)
	{
		#if php
		pimg.newImage(w, h, color);
		#elseif neko
		nimg.newImage(w, h, color);
		#end
	}
	
	public function composite(img:Imagick, op:ImagickCompositeOperator, x:Int, y:Int)
	{
		#if php
		return pimg.compositeImage(img.pimg, getCompositeOperator(op), x, y);
		#elseif neko
		return nimg.compositeImage(img.nimg, op, new ImagickPoint(x, y)); 
		#end
	}
	
	public function crop(w:Int, h:Int, x:Int, y:Int)
	{
		#if php
		return pimg.cropImage(w, h, x, y);
		#elseif neko
		return nimg.crop(w, h, new ImagickPoint(x, y));
		#end
	}
	
	public function iteratePixels(f:Int->Int->ImagickPixel->Void, x=0, y=0, w=-1, h=-1)
    {
        #if php
        if (w < 0) w = width - x;
        if (h < 0) h = height - y;
		
		var it = pimg.getPixelIterator();
		var py = 0;
		
		untyped __php__("
            foreach ($it as $row => $pixels)
            {
                if ($py >= $y + $h) break;
				if ($py >= $y)
				{
					$px = 0;
					foreach ($pixels as $column => $pixel)
					{
						if ($px >= $x + $w) break;
						if ($px >= $x)
						{
							call_user_func_array($f, array($px, $py, $pixel));
						}
						$px++;
					}
				}
                $it->syncIterator();
                $py++;
            }        
        ");
		#elseif neko
		nimg.iteratePixels(f, x, y, w, h);
		#end
    }
	
	#if php
	static function getCompositeOperator(op:ImagickCompositeOperator) : Int
	{
		return switch (op)
		{
			case Undefined:	untyped __php__("imagick::COMPOSITE_UNDEFINED");
			case No:		untyped __php__("imagick::COMPOSITE_NO");
			case Add:		untyped __php__("imagick::COMPOSITE_ADD");
			case Atop:		untyped __php__("imagick::COMPOSITE_ATOP");
			case Blend:		untyped __php__("imagick::COMPOSITE_BLEND");
			case Bumpmap:	untyped __php__("imagick::COMPOSITE_BUMPMAP");
			case Clear:		untyped __php__("imagick::COMPOSITE_CLEAR");
			case ColorBurn:	untyped __php__("imagick::COMPOSITE_COLORBURN");
			case ColorDodge:untyped __php__("imagick::COMPOSITE_COLORDODGE");
			case Colorize:	untyped __php__("imagick::COMPOSITE_COLORIZE");
			case CopyBlack:	untyped __php__("imagick::COMPOSITE_COPYBLACK");
			case CopyBlue:	untyped __php__("imagick::COMPOSITE_COPYBLUE");
			case Copy:		untyped __php__("imagick::COMPOSITE_COPY");
			case CopyCyan:	untyped __php__("imagick::COMPOSITE_COPYCYAN");
			case CopyGreen:	untyped __php__("imagick::COMPOSITE_COPYGREEN");
			case CopyMagenta:untyped __php__("imagick::COMPOSITE_COPYMAGENTA");
			case CopyOpacity:untyped __php__("imagick::COMPOSITE_COPYOPACITY");
			case CopyRed:	untyped __php__("imagick::COMPOSITE_COPYRED");
			case CopyYellow:untyped __php__("imagick::COMPOSITE_COPYYELLOW");
			case Darken:	untyped __php__("imagick::COMPOSITE_DARKEN");
			case DstAtop:	untyped __php__("imagick::COMPOSITE_DSTATOP");
			case Dst:		untyped __php__("imagick::COMPOSITE_DST");
			case DstIn:		untyped __php__("imagick::COMPOSITE_DSTIN");
			case DstOut:	untyped __php__("imagick::COMPOSITE_DSTOUT");
			case DstOver:	untyped __php__("imagick::COMPOSITE_DSTOVER");
			case Difference:untyped __php__("imagick::COMPOSITE_DIFFERENCE");
			case Displace:	untyped __php__("imagick::COMPOSITE_DISPLACE");
			case Dissolve:	untyped __php__("imagick::COMPOSITE_DISSOLVE");
			case Exclusion:	untyped __php__("imagick::COMPOSITE_EXCLUSION");
			case HardLight:	untyped __php__("imagick::COMPOSITE_HARDLIGHT");
			case Hue:		untyped __php__("imagick::COMPOSITE_HUE");
			case In:		untyped __php__("imagick::COMPOSITE_IN");
			case Lighten:	untyped __php__("imagick::COMPOSITE_LIGHTEN");
			case Luminize:	untyped __php__("imagick::COMPOSITE_LUMINIZE");
			case Minus:		untyped __php__("imagick::COMPOSITE_MINUS");
			case Modulate:	untyped __php__("imagick::COMPOSITE_MODULATE");
			case Multiply:	untyped __php__("imagick::COMPOSITE_MULTIPLY");
			case Out:		untyped __php__("imagick::COMPOSITE_OUT");
			case Over:		untyped __php__("imagick::COMPOSITE_OVER");
			case Overlay:	untyped __php__("imagick::COMPOSITE_OVERLAY");
			case Plus:		untyped __php__("imagick::COMPOSITE_PLUS");
			case Replace:	untyped __php__("imagick::COMPOSITE_REPLACE");
			case Saturate:	untyped __php__("imagick::COMPOSITE_SATURATE");
			case Screen:	untyped __php__("imagick::COMPOSITE_SCREEN");
			case SoftLight:	untyped __php__("imagick::COMPOSITE_SOFTLIGHT");
			case SrcAtop:	untyped __php__("imagick::COMPOSITE_SRCATOP");
			case Src:		untyped __php__("imagick::COMPOSITE_SRC");
			case SrcIn:		untyped __php__("imagick::COMPOSITE_SRCIN");
			case SrcOut:	untyped __php__("imagick::COMPOSITE_SRCOUT");
			case SrcOver:	untyped __php__("imagick::COMPOSITE_SRCOVER");
			case Subtract:	untyped __php__("imagick::COMPOSITE_SUBTRACT");
			case Threshold:	untyped __php__("imagick::COMPOSITE_THRESHOLD");
			case Xor:		untyped __php__("imagick::COMPOSITE_XOR");
		}
	}
	#end
	
}