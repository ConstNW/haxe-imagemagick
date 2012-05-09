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

#include "nMagick.h"

/* =========================================================================
Pixel wand methods
*/

/*
@description	Deallocates resources associated with a PixelWand.
*/
value nMagick_pixel_close( value pixel )
{
	PixelWand *pw;

	val_check_kind( pixel, k_pixel );
	val_gc( pixel, NULL );

	pw = PIXEL( pixel );

	DestroyPixelWand( pw );

	if (objCount==1)
		MagickWandTerminus();
	objCount--;
}

/*
@description	Clears resources associated with the wand.
*/
value nMagick_pixel_clear( value pixel )
{
	PixelWand *pix;

	val_check_kind( pixel, k_pixel );

	pix = PIXEL( pixel );

	ClearPixelWand( pix );
}

/*
@description	Returns a new pixel wand.
*/
value nMagick_pixel_new()
{
	value v;
	PixelWand  *pix;

	if (objCount==0)
		MagickWandGenesis();
	objCount++;

	pix = NewPixelWand();

	v = alloc_abstract( k_pixel, pix );
	val_gc( v, nMagick_pixel_close );
	return v;
}

/*
@description	Returns the normalized alpha color of the pixel wand.
*/
value nMagick_pixel_get_alpha( value pixel )
{
	PixelWand *pix;

	val_check_kind( pixel, k_pixel );

	pix = PIXEL( pixel );

	return alloc_float( PixelGetAlpha( pix ) );
}

/*
@description	Sets the normalized alpha color of the pixel wand.
*/
value nMagick_pixel_set_alpha( value pixel, value alpha )
{
	PixelWand *pix;

	val_check_kind( pixel, k_pixel );
	val_check( alpha, float );

	pix = PIXEL( pixel );

	PixelSetAlpha( pix, val_float( alpha ) );
}

/*
@description	Returns the normalized black color of the pixel wand.
*/
value nMagick_pixel_get_black( value pixel )
{
	PixelWand *pix;

	val_check_kind( pixel, k_pixel );

	pix = PIXEL( pixel );

	return alloc_float( PixelGetBlack( pix ) );
}

/*
@description	Sets the normalized black color of the pixel wand.
*/
value nMagick_pixel_set_black( value pixel, value black )
{
	PixelWand *pix;

	val_check_kind( pixel, k_pixel );
	val_check( black, float );

	pix = PIXEL( pixel );

	PixelSetBlack( pix, val_float( black ) );
}

/*
@description	Returns the normalized black color of the pixel wand.
*/
value nMagick_pixel_get_red( value pixel )
{
	PixelWand *pix;

	val_check_kind( pixel, k_pixel );

	pix = PIXEL( pixel );

	return alloc_float( PixelGetRed( pix ) );
}

/*
@description	Sets the normalized black color of the pixel wand.
*/
value nMagick_pixel_set_red( value pixel, value red )
{
	PixelWand *pix;

	val_check_kind( pixel, k_pixel );
	val_check( red, float );

	pix = PIXEL( pixel );

	PixelSetRed( pix, val_float( red ) );
}

/*
@description	Returns the normalized green color of the pixel wand.
*/
value nMagick_pixel_get_green( value pixel )
{
	PixelWand *pix;

	val_check_kind( pixel, k_pixel );

	pix = PIXEL( pixel );

	return alloc_float( PixelGetGreen( pix ) );
}

/*
@description	Sets the normalized green color of the pixel wand.
*/
value nMagick_pixel_set_green( value pixel, value green )
{
	PixelWand *pix;

	val_check_kind( pixel, k_pixel );
	val_check( green, float );

	pix = PIXEL( pixel );

	PixelSetGreen( pix, val_float( green ) );
}

/*
@description	Returns the normalized blue color of the pixel wand.
*/
value nMagick_pixel_get_blue( value pixel )
{
	PixelWand *pix;

	val_check_kind( pixel, k_pixel );

	pix = PIXEL( pixel );

	return alloc_float( PixelGetBlue( pix ) );
}

/*
@description	Sets the normalized blue color of the pixel wand.
*/
value nMagick_pixel_set_blue( value pixel, value blue )
{
	PixelWand *pix;

	val_check_kind( pixel, k_pixel );
	val_check( blue, float );

	pix = PIXEL( pixel );

	PixelSetBlue( pix, val_float( blue ) );
}

/*
@description	Sets the color of the pixel wand with a string 
				(e.g. "blue", "#0000ff", "rgb(0,0,255)", "cmyk(100,100,100,10)", 
				etc.).
@param			color	The string to convert.
*/
value nMagick_pixel_set_color( value pixel, value color )
{
	PixelWand *pix;

	val_check_kind( pixel, k_pixel );
	val_check( color, string );

	pix = PIXEL( pixel );

	return alloc_bool( PixelSetColor( pix, val_string( color ) ) );
}

/*
@description	Sets the color count of the pixel wand.
@param			count	The number of colors required
*/
void nMagick_pixel_set_color_count( value pixel, value count )
{
	PixelWand *pix;

	val_check_kind( pixel, k_pixel );
	val_check( count, int );

	pix = PIXEL( pixel );

	PixelSetColorCount( pix, val_int( count ) );
}

DEFINE_PRIM(nMagick_pixel_close,1);
DEFINE_PRIM(nMagick_pixel_clear,1);
DEFINE_PRIM(nMagick_pixel_new,0);
DEFINE_PRIM(nMagick_pixel_get_alpha,1);
DEFINE_PRIM(nMagick_pixel_set_alpha,2);
DEFINE_PRIM(nMagick_pixel_get_black,1);
DEFINE_PRIM(nMagick_pixel_set_black,2);
DEFINE_PRIM(nMagick_pixel_get_red,1);
DEFINE_PRIM(nMagick_pixel_set_red,2);
DEFINE_PRIM(nMagick_pixel_get_green,1);
DEFINE_PRIM(nMagick_pixel_set_green,2);
DEFINE_PRIM(nMagick_pixel_get_blue,1);
DEFINE_PRIM(nMagick_pixel_set_blue,2);
DEFINE_PRIM(nMagick_pixel_set_color,2);
DEFINE_PRIM(nMagick_pixel_set_color_count,2);
