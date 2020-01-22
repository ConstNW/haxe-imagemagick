import utest.Runner;
import utest.ui.Report;

class Main
{
    static function main()
	{
        var runner = new Runner();

        runner.addCase(new IMagickTest());

        Report.create(runner);
		runner.run();
	}
}
