package entities 
{
    import net.flashpunk.FP;
    import net.flashpunk.Entity;

    public class Actions extends Entity {
	private var
	    actionsIndex:Number;

	public function Actions():void {
	    super();
	    actionsIndex = -1;
	}

	public function advanceActions():void {
	    actionsIndex++;
	    FP.console.log(actionsIndex);
	}
    }
}