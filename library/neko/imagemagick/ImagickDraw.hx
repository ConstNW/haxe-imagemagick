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

typedef ImagickDrawHandle = { __ImagickDrawHandle : Dynamic }

class ImagickDraw
{
	public var __d : ImagickDrawHandle;
	
	public function new()
	{
		__d = nMagick_draw_new();
	}
	
	public function close()
	{
		nMagick_draw_close( __d );
	}
	
	public function clear() : Bool
	{
		return nMagick_draw_clear( __d );
	}
	
	public function clone() : ImagickDraw
	{
		return nMagick_draw_clone( __d );
	}
	
	public function dispose()
	{
		return nMagick_draw_destroy( __d );
	}
	
	static var nMagick_draw_close = neko.Lib.load("nMagick","nMagick_draw_close",1);
	static var nMagick_draw_new = neko.Lib.load("nMagick","nMagick_draw_new",0);
	static var nMagick_draw_clear = neko.Lib.load("nMagick","nMagick_draw_clear",1);
	static var nMagick_draw_clone = neko.Lib.load("nMagick","nMagick_draw_clone",1);
	static var nMagick_draw_destroy = neko.Lib.load("nMagick","nMagick_draw_destroy",1);
}