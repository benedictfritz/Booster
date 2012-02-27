package
{
    import net.flashpunk.Engine;
    import net.flashpunk.FP;

    import worlds.*;

    [SWF(width="640", height="100")]

    public class Main extends Engine {
	public function Main() {
	    super(640, 100, 60, false);
	    FP.world = new TalkWorld();
	}
    }
}