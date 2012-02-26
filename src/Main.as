package
{
    import net.flashpunk.Engine;
    import net.flashpunk.FP;

    import worlds.*;

    [SWF(width="640", height="380")]

    public class Main extends Engine {
	public function Main() {
	    super(640, 380, 60, false);
	    FP.console.enable();
	    FP.world = new TalkWorld();
	}
    }
}