set NEKOPATH=%NEKOPATH%;..\..\library\ndll\Windows

haxe -cp ../../library -cp . -main Main -neko Main.n
neko Main.n
