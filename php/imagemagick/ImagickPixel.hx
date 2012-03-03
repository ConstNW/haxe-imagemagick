package php.imagemagick;

import php.NativeArray;

@:native('ImagickPixel') extern class ImagickPixel
{
	public function clear() : Bool;
	public function new(?color:String) : Void;
	public function destroy() : Bool;
	public function getColor(normalized:Bool = false) : NativeArray;
	public function getColorAsString() : String;
	public function getColorCount() : Int;
	public function getColorValue(color:Int) : Float;
	public function getHSL() : NativeArray;
	public function isSimilar(color:ImagickPixel, fuzz:Float) : Bool;
	public function setColor(color:String) : Bool;
	public function setColorValue(color:Int, value:Float) : Bool;
	public function setHSL(hue:Float, saturation:Float, luminosity:Float) : Bool;
}