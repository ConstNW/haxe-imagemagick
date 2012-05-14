package;

import haxe.imagemagick.Imagick;
import haxe.imagemagick.ImagickPixel;

class ImagickTest extends haxe.unit.TestCase
{
    public function testNew()
	{
		var pic = new Imagick();
		this.assertTrue(pic != null);
		
		pic.newImage(200, 100, new ImagickPixel("green"));
		pic.save("pic0-out.png");
		this.assertTrue(pic != null);
		
	}
	
	public function testLoad()
    {
		var pic = new Imagick("pic1.jpg");
		this.assertTrue(pic != null);
    }
	
	public function testSave()
	{
		var pic = new Imagick("pic1.jpg");
		this.assertTrue(pic != null);
		pic.save("pic1-out.png");
	}
	
	public function testMatteFloodFill()
	{
		var pic : Imagick = new Imagick("pic2.png");
		this.assertTrue(pic != null);
		pic.matteFloodFill(0, 10, new ImagickPixel("black"), 100, 50);
		pic.save("png32:pic2-out.png");
	}
}
