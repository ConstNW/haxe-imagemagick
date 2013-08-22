package;

import haxe.imagemagick.Imagick;
import haxe.imagemagick.ImagickPixel;

class IMagickTest extends haxe.unit.TestCase
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
	
	public function testResize()
	{
		var pic : Imagick = new Imagick("pic2.png");
		this.assertTrue(pic != null);
		pic.resize(30, 15);
		pic.save("pic3-out.png");
	}
	
	public function testIteratorFull()
	{
		var pic : Imagick = new Imagick("pic4.png");
		this.assertTrue(pic != null);
		trace("\ntestIteratorFull");
		pic.iteratePixels(function(x:Int, y:Int, p:ImagickPixel)
		{
			trace("x = " + x + ", y = " + y + ", r/g/b = " + p.getRed() + "/" + p.getGreen() + "/" + p.getBlue());
		});
	}
	
	public function testIteratorRegion1()
	{
		var pic : Imagick = new Imagick("pic4.png");
		this.assertTrue(pic != null);
		trace("\ntestIteratorRegion1");
		pic.iteratePixels(function(x:Int, y:Int, p:ImagickPixel)
		{
			trace("x = " + x + ", y = " + y + ", r/g/b = " + p.getRed() + "/" + p.getGreen() + "/" + p.getBlue());
		}, 2, 1);
	}
	
	public function testIteratorRegion2()
	{
		var pic : Imagick = new Imagick("pic4.png");
		this.assertTrue(pic != null);
		trace("\ntestIteratorRegion2");
		pic.iteratePixels(function(x:Int, y:Int, p:ImagickPixel)
		{
			trace("x = " + x + ", y = " + y + ", r/g/b = " + p.getRed() + "/" + p.getGreen() + "/" + p.getBlue());
		}, 0, 0, 2, 1);
	}
	
	public function testWhiteThreshold()
	{
		var pic : Imagick = new Imagick("pic1.jpg");
		this.assertTrue(pic != null);
		pic.whiteThreshold(new ImagickPixel("gray"));
		pic.save("pic5-out.jpg");
	}
	
	public function testClone()
	{
		var pic : Imagick = new Imagick("pic1.jpg");
		this.assertTrue(pic != null);
		var pic2 = pic.clone();
		pic2.save("pic6-out.jpg");
	}
	
	public function testComposite()
	{
		var picA = new Imagick("pic7-A.png");
		this.assertTrue(picA != null);
		
		var picB = new Imagick("pic7-B.png");
		this.assertTrue(picB != null);
		
		var pic : Imagick;
		
		pic = picA.clone();
		pic.composite(picB, ImagickCompositeOperator.Copy, 0, 0);
		pic.save("pic7-copy-out.png");
		
		pic = picA.clone();
		pic.composite(picB, ImagickCompositeOperator.Over, 0, 0);
		pic.save("pic7-over-out.png");
		
		pic = picA.clone();
		pic.composite(picB, ImagickCompositeOperator.Overlay, 0, 0);
		pic.save("pic7-overlay-out.png");
		
		pic = picA.clone();
		pic.composite(picB, ImagickCompositeOperator.Replace, 0, 0);
		pic.save("pic7-replace-out.png");
	}
	
	public function testDispose()
	{
		var pic = new Imagick();
		pic.newImage(200, 100, new ImagickPixel("green"));
		pic.dispose();
		
		this.assertTrue(true);
	}
}
