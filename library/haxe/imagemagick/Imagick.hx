package haxe.imagemagick;

#if php
private typedef PhpImagick = php.imagemagick.Imagick;
#elseif neko
private typedef NekoImagick = neko.imagemagick.Imagick;
#end

class ImagickUnsupportedMethodException
{
	public function new() {}
}

class Imagick 
{
	/**
	 * The parts outside the source replace the target 
	 */
	public static inline var COMPOSITE_DSTOUT(COMPOSITE_DSTOUT_getter, null) : Int; private static inline function COMPOSITE_DSTOUT_getter() : Int { return untyped __php__("imagick::COMPOSITE_DSTOUT"); }
	
	/**
	 * The part of the source lying inside of the destination replaces the destination 
	 */
	public static inline var COMPOSITE_SRCIN(COMPOSITE_SRCIN_getter, null) : Int; private static inline function COMPOSITE_SRCIN_getter() : Int { return untyped __php__("imagick::COMPOSITE_SRCIN"); }
	
	/**
	 * The default composite operator 
	 */
	public static inline var COMPOSITE_DEFAULT(COMPOSITE_DEFAULT_getter, null) : Int; private static inline function COMPOSITE_DEFAULT_getter() : Int { return untyped __php__("imagick::COMPOSITE_DEFAULT"); }
	
	/**
	 * Copies the source image on the target image 
	 */
	public static inline var COMPOSITE_COPY(COMPOSITE_COPY_getter, null) : Int; private static inline function COMPOSITE_COPY_getter() : Int { return untyped __php__("imagick::COMPOSITE_COPY"); }
	
	
	#if php
	var pimg : PhpImagick;
	#elseif neko
	var nimg : NekoImagick;
	#end

	public function new(?path:String, ?img : #if php PhpImagick #elseif neko NekoImagick #end)
	{
		if (img != null)
		{
			#if php
			pimg = img;
			#elseif neko
			nimg = img;
			#end
		}
		else
		{
			#if php
			pimg = new PhpImagick(path);
			#elseif neko
			nimg = new NekoImagick();
			if (path != null)
			{
				nimg.load(path);
			}
			#end
		}
	}
	
	public function dispose()
	{
		#if php
		pimg.clear();
		pimg.destroy();
		#elseif neko
		nimg.close();
		nimg.Dispose();
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
	
	public function colorFloodFill(fill:Dynamic, fuzz:Float, bordercolor:Dynamic, x:Int, y:Int) : Bool
	{
		#if php
		return pimg.colorFloodfillImage(fill, fuzz, bordercolor, x, y);
		#elseif neko
		return nimg.colorFloodFill(fill, fuzz, bordercolor, new nMagick.Point(x, y));
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
		var r = new Imagick(null, new NekoImagick());
		r.newImage(nimg.width, nimg.height, "black");
		r.composite(this, COMPOSITE_COPY, 0, 0);
		return r;
		#end
	}
	
	public function blackThreshold(color:Dynamic)
	{
		#if php
		return pimg.blackThresholdImage(color);
		#elseif neko
		throw new ImagickUnsupportedMethodException();
		#end
	}
	
	public function whiteThreshold(color:Dynamic)
	{
		#if php
		return pimg.whiteThresholdImage(color);
		#elseif neko
		throw new ImagickUnsupportedMethodException();
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
	
	public function matteFloodFill(a:Float, b:Float, color:Dynamic, x:Int, y:Int)
	{
		#if php
		pimg.matteFloodfillImage(a, b, color, x, y);
		#elseif neko
		throw new ImagickUnsupportedMethodException();
		#end
	}
	
	public function newImage(w:Int, h:Int, color:Dynamic)
	{
		#if php
		pimg.newImage(w, h, color);
		#elseif neko
		throw new ImagickUnsupportedMethodException();
		#end
	}
	
	public function composite(img:Imagick, op:Int, x:Int, y:Int)
	{
		#if php
		return pimg.compositeImage(img.pimg, op, x, y);
		#elseif neko
		var oldCompositeMode = nimg.composite;
		nimg.composite = nimg.getCompositeOperatorEnum(op);
		var r = nimg.compositeImage(img.nimg, new nMagick.Point(x, y)); 
		nimg.composite = oldCompositeMode;
		return r;
		#end
	}
	
	public function crop(a:Int, b:Int, c:Int, d:Int)
	{
		#if php
		return pimg.cropImage(a, b, c, d);
		#elseif neko
		return nimg.crop(a, b, new nMagick.Point(c, d));
		#end
	}
}