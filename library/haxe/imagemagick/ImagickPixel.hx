package haxe.imagemagick;

#if php
typedef ImagickPixel = php.imagemagick.ImagickPixel;
#elseif neko
typedef ImagickPixel = neko.imagemagick.ImagickPixel;
#end
