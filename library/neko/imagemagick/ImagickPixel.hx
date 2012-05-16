/*
 * @author Lee McColl Sylvester - lee@designrealm.co.uk
 *
 * Copyright (c) 2005, The haXe Project Contributors
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *   - Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   - Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE HAXE PROJECT CONTRIBUTORS "AS IS" AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE HAXE PROJECT CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
 * DAMAGE.
 */

package neko.imagemagick;

class ImagickPixel
{
	public var __d : Void;
	
	public function new( ?color : String, ?handle : Void )
	{
		__d = handle != null ? handle : nMagick_pixel_new();
		
		if (color != null)
		{
			setColor(color);
		}
	}
	
	public function close()
	{
		nMagick_pixel_close( __d );
	}
	
	public function clear() : Bool
	{
		return nMagick_pixel_clear( __d );
	}

	/*
	@description	Returns the normalized alpha value of the pixel wand.
	*/
	public function getAlpha() : Float
	{
		return nMagick_pixel_get_alpha( __d );
	}

	/*
	@description	Sets the normalized alpha value of the pixel wand.
	*/
	public function setAlpha( alpha : Float ) : Void
	{
		nMagick_pixel_set_alpha( __d, alpha );
	}

	/*
	@description	Returns the normalized black color of the pixel wand.
	*/
	public function getBlack() : Float
	{
		return nMagick_pixel_get_black( __d );
	}

	/*
	@description	Sets the normalized black color of the pixel wand.
	*/
	public function setBlack( black : Float ) : Void
	{
		nMagick_pixel_set_black( __d, black );
	}

	/*
	@description	Returns the normalized red color of the pixel wand.
	*/
	public function getRed() : Float
	{
		return nMagick_pixel_get_red( __d );
	}

	/*
	@description	Sets the normalized red color of the pixel wand.
	*/
	public function setRed( red : Float ) : Void
	{
		nMagick_pixel_set_red( __d, red );
	}

	/*
	@description	Returns the normalized green color of the pixel wand.
	*/
	public function getGreen() : Float
	{
		return nMagick_pixel_get_green( __d );
	}

	/*
	@description	Sets the normalized green color of the pixel wand.
	*/
	public function setGreen( green : Float ) : Void
	{
		nMagick_pixel_set_green( __d, green );
	}

	/*
	@description	Returns the normalized blue color of the pixel wand.
	*/
	public function getBlue() : Float
	{
		return nMagick_pixel_get_blue( __d );
	}

	/*
	@description	Sets the normalized blue color of the pixel wand.
	*/
	public function setBlue( blue : Float ) : Void
	{
		nMagick_pixel_set_blue( __d, blue );
	}

	/*
	@description	Sets the color of the pixel wand with a string 
					(e.g. "blue", "#0000ff", "rgb(0,0,255)", "cmyk(100,100,100,10)", 
					etc.).
	@param			color	The string to convert.
	*/
	public function setColor( color : String ) : Void
	{
		nMagick_pixel_set_color( __d, untyped color.__s );
	}

	/*
	@description	Sets the color count of the pixel wand.
	@param			count	The number of colors required
	*/
	public function setColorCount( count : Int ) : Void
	{
		nMagick_pixel_set_color_count( __d, count );
	}
	
	static var nMagick_pixel_close = neko.Lib.load("nMagick","nMagick_pixel_close",1);
	static var nMagick_pixel_clear = neko.Lib.load("nMagick","nMagick_pixel_clear",1);
	static var nMagick_pixel_new = neko.Lib.load("nMagick","nMagick_pixel_new",0);
	static var nMagick_pixel_get_alpha = neko.Lib.load("nMagick","nMagick_pixel_get_alpha",1);
	static var nMagick_pixel_set_alpha = neko.Lib.load("nMagick","nMagick_pixel_set_alpha",2);
	static var nMagick_pixel_get_black = neko.Lib.load("nMagick","nMagick_pixel_get_black",1);
	static var nMagick_pixel_set_black = neko.Lib.load("nMagick","nMagick_pixel_set_black",2);
	static var nMagick_pixel_get_red = neko.Lib.load("nMagick","nMagick_pixel_get_red",1);
	static var nMagick_pixel_set_red = neko.Lib.load("nMagick","nMagick_pixel_set_red",2);
	static var nMagick_pixel_get_green = neko.Lib.load("nMagick","nMagick_pixel_get_green",1);
	static var nMagick_pixel_set_green = neko.Lib.load("nMagick","nMagick_pixel_set_green",2);
	static var nMagick_pixel_get_blue = neko.Lib.load("nMagick","nMagick_pixel_get_blue",1);
	static var nMagick_pixel_set_blue = neko.Lib.load("nMagick","nMagick_pixel_set_blue",2);
	static var nMagick_pixel_set_color = neko.Lib.load("nMagick","nMagick_pixel_set_color",2);
	static var nMagick_pixel_set_color_count = neko.Lib.load("nMagick","nMagick_pixel_set_color_count",2);
}