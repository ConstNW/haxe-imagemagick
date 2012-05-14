package haxe.imagemagick;

#if php
private typedef PhpImagick = php.imagemagick.Imagick;
#elseif neko
private typedef NekoImagick = neko.imagemagick.Imagick;
import neko.imagemagick.ImagickPoint;
#end

import haxe.imagemagick.ImagickEnums;

class ImagickUnsupportedMethodException
{
	public function new() {}
}

class Imagick 
{
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
		var r = new Imagick(null, new NekoImagick());
		r.newImage(nimg.width, nimg.height, new ImagickPixel("black"));
		r.composite(this, CompositeOperator.CopyCompositeOp, 0, 0);
		return r;
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
	
	public function composite(img:Imagick, op:CompositeOperator, x:Int, y:Int)
	{
		#if php
		return pimg.compositeImage(img.pimg, pimg.getCompositeOperator(op), x, y);
		#elseif neko
		var oldCompositeMode = nimg.composite;
		nimg.composite = op;
		var r = nimg.compositeImage(img.nimg, new ImagickPoint(x, y)); 
		nimg.composite = oldCompositeMode;
		return r;
		#end
	}
	
	public function crop(x:Int, y:Int, w:Int, h:Int)
	{
		#if php
		return pimg.cropImage(x, y, w, h);
		#elseif neko
		return nimg.crop(x, y, new ImagickPoint(w, h));
		#end
	}
}