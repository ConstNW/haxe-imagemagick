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

void nMagick_draw_finalize(value draw)
{
	DestroyDrawingWand(DRAW(draw));
}

value nMagick_draw_close(value draw)
{
	val_check_kind(draw, k_pixel);
	val_gc(draw, NULL);
	
	nMagick_draw_finalize(draw);
}

value nMagick_draw_new()
{
	DrawingWand *draw = NewDrawingWand();
	value v = alloc_abstract(k_draw, draw);
	val_gc(v, nMagick_draw_finalize);
	return v;
}

value nMagick_draw_clear(value draw)
{
	val_check_kind(draw, k_draw);
	ClearDrawingWand(DRAW(draw));
}

value nMagick_draw_destroy(value draw)
{
	val_check_kind(draw, k_draw);
	DestroyDrawingWand(DRAW(draw));
}

/*
@description	Returns an identical copy of the DrawingWand.
*/
value nMagick_draw_clone(value draw)
{
	val_check_kind(draw, k_draw);
	DrawingWand *drw = DRAW(draw);
	value v = alloc_abstract(k_draw, CloneDrawingWand(drw));
	val_gc(v, nMagick_draw_finalize);
	return v;
}




DEFINE_PRIM(nMagick_draw_close, 1);
DEFINE_PRIM(nMagick_draw_new, 0);
DEFINE_PRIM(nMagick_draw_clear, 1);
DEFINE_PRIM(nMagick_draw_destroy, 1);
DEFINE_PRIM(nMagick_draw_clone, 1);
