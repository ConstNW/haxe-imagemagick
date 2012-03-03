package php.imagemagick;

@:native('ImagickPixelIterator') extern class ImagickPixelIterator implements ArrayAccess<ArrayAccess<ImagickPixel>>
{
	public function clear() : Bool;
	public function new(wand:Imagick) : Void;
	public function destroy() : Bool;
	public function getCurrentIteratorRow() : NativeArray;
	public function getIteratorRow() : Int;
	public function getNextIteratorRow() : NativeArray;
	public function getPreviousIteratorRow() : NativeArray;
	public function newPixelIterator(wand:Imagick) : Bool;
	public function newPixelRegionIterator(wand:Imagick, x:Int, y:Int, columns:Int, rows:Int) : Bool;
	public function resetIterator() : Bool;
	public function setIteratorFirstRow() : Bool;
	public function setIteratorLastRow() : Bool;
	public function setIteratorRow(row:Int) : Bool;
	public function syncIterator() : Bool;
}