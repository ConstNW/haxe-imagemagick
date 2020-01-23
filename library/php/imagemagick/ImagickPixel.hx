package php.imagemagick;

import php.NativeArray;

@:native('ImagickPixel') extern class ImagickPixel
{
	public function clear() : Bool;
	public function new(?color:String) : Void;
	public function destroy() : Bool;
	public function getColor(normalized=false) : NativeArray;
	public function getColorAsString() : String;
	public function getColorCount() : Int;
	public function getColorValue(color:Int) : Float;
	public function getHSL() : NativeArray;
	public function isSimilar(color:ImagickPixel, fuzz:Float) : Bool;
	public function setColor(color:String) : Bool;
	public function setColorValue(color:Int, value:Float) : Bool;
	public function setHSL(hue:Float, saturation:Float, luminosity:Float) : Bool;
	
	public function getAlpha() : Float
	{
		var c = getColor();
		return c[untyped "a"] / 255.0;
	}

	public function getRed() : Float
	{
		var c = getColor();
		return c[untyped "r"] / 255.0;
	}

	public function getGreen() : Float
	{
		var c = getColor();
		return c[untyped "g"] / 255.0;
	}

	public function getBlue() : Float
	{
		var c = getColor();
		return c[untyped "b"] / 255.0;
	}
}