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

// ============================================================================

void nMagick_pixel_finalize(value pixel)
{
	DestroyPixelWand(PIXEL(pixel));
}

value nMagick_pixel_close(value pixel)
{
	val_check_kind(pixel, k_pixel);
	val_gc(pixel, NULL);
	nMagick_pixel_finalize(pixel);
	return val_null;
}

value nMagick_pixel_clear(value pixel)
{
	val_check_kind(pixel, k_pixel);
	ClearPixelWand(PIXEL(pixel));
}

value nMagick_pixel_new()
{
	PixelWand *pix = NewPixelWand();
	value v = alloc_abstract(k_pixel, pix);
	val_gc(v, nMagick_pixel_finalize);
	return v;
}

value nMagick_pixel_get_alpha(value pixel)
{
	val_check_kind(pixel, k_pixel);
	return alloc_float(PixelGetAlpha(PIXEL(pixel)));
}

value nMagick_pixel_set_alpha(value pixel, value alpha)
{
	val_check_kind(pixel, k_pixel);
	val_check(alpha, float);

	PixelSetAlpha(PIXEL(pixel), val_float(alpha));
}

value nMagick_pixel_get_black(value pixel)
{
	val_check_kind(pixel, k_pixel);
	return alloc_float(PixelGetBlack(PIXEL(pixel)));
}

value nMagick_pixel_set_black(value pixel, value black)
{
	val_check_kind(pixel, k_pixel);
	val_check(black, float);

	PixelSetBlack(PIXEL(pixel), val_float(black));
}

value nMagick_pixel_get_red(value pixel)
{
	val_check_kind(pixel, k_pixel);
	return alloc_float(PixelGetRed(PIXEL(pixel)));
}

value nMagick_pixel_set_red(value pixel, value red)
{
	val_check_kind(pixel, k_pixel);
	val_check(red, float);

	PixelSetRed(PIXEL(pixel), val_float(red));
}

value nMagick_pixel_get_green(value pixel)
{
	val_check_kind(pixel, k_pixel);
	return alloc_float(PixelGetGreen(PIXEL(pixel)));
}

value nMagick_pixel_set_green(value pixel, value green)
{
	val_check_kind(pixel, k_pixel);
	val_check(green, float);

	PixelSetGreen(PIXEL(pixel), val_float(green));
}

value nMagick_pixel_get_blue(value pixel)
{
	val_check_kind(pixel, k_pixel);
	return alloc_float(PixelGetBlue(PIXEL(pixel)));
}

value nMagick_pixel_set_blue(value pixel, value blue)
{
	val_check_kind(pixel, k_pixel);
	val_check(blue, float);
	
	PixelSetBlue(PIXEL(pixel), val_float(blue));
}

value nMagick_pixel_set_color(value pixel, value color)
{
	val_check_kind(pixel, k_pixel);
	val_check(color, string);
	
	return alloc_bool(PixelSetColor(PIXEL(pixel), val_string(color)));
}

value nMagick_pixel_set_color_count(value pixel, value count)
{
	val_check_kind(pixel, k_pixel);
	val_check(count, int);
	PixelSetColorCount(PIXEL(pixel), val_int(count));
	return val_null;
}

DEFINE_PRIM(nMagick_pixel_close, 1);
DEFINE_PRIM(nMagick_pixel_clear, 1);
DEFINE_PRIM(nMagick_pixel_new, 0);
DEFINE_PRIM(nMagick_pixel_get_alpha, 1);
DEFINE_PRIM(nMagick_pixel_set_alpha, 2);
DEFINE_PRIM(nMagick_pixel_get_black, 1);
DEFINE_PRIM(nMagick_pixel_set_black, 2);
DEFINE_PRIM(nMagick_pixel_get_red, 1);
DEFINE_PRIM(nMagick_pixel_set_red, 2);
DEFINE_PRIM(nMagick_pixel_get_green, 1);
DEFINE_PRIM(nMagick_pixel_set_green, 2);
DEFINE_PRIM(nMagick_pixel_get_blue, 1);
DEFINE_PRIM(nMagick_pixel_set_blue, 2);
DEFINE_PRIM(nMagick_pixel_set_color, 2);
DEFINE_PRIM(nMagick_pixel_set_color_count, 2);
