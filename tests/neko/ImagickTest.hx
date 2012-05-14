package;

import haxe.imagemagick.Imagick;

class ImagickTest extends haxe.unit.TestCase
{
    public function testLoad()
    {
		var pic = new Imagick("pic1.jpg");
		this.assertTrue(pic != null);
    }
	
	public function testSave()
	{
		var pic = new Imagick("pic1.jpg");
		pic.save("pic1-out.png");
	}
}
