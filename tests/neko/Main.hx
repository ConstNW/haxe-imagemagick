package ;

#if php
typedef Lib = php.Lib;
#elseif neko
typedef Lib = neko.Lib;
#end

class Main
{
    static function main()
	{
		var r = new haxe.unit.TestRunner();
		r.add(new ImagickTest());
		Lib.println("<pre>");
		r.run();
		Lib.println("</pre>");
	}
}
