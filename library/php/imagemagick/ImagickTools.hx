package php.imagemagick;

class ImagickTools
{
	public static function iteratePixels(img:Imagick, sy:Int, f:Int->Int->ImagickPixel->Bool) : Void
    {
        if (img == null) return;
        
        untyped __php__("
            $it = $img->getPixelIterator();    
            $y = 0;
            foreach ($it as $row => $pixels)
            {
				if ($y >= $sy)
				{
					$x = 0;
					foreach ($pixels as $column => $pixel)
					{
						if (!call_user_func_array($f, array($x, $y, $pixel))) return;
						$x++;
					}
				}
                $it->syncIterator();
                $y++;
            }        
        ");
    }
	
	public static function pixel2color(p:ImagickPixel) : { r:Int, g:Int, b:Int, a:Int}
    {
        var c = p.getColor(true);
        return { r:c[untyped 'r'], g:c[untyped 'g'], b:c[untyped 'b'], a:c[untyped 'a'] };
    }
}