package entities 
{
    import net.flashpunk.FP;
    import net.flashpunk.Entity;

    public class Actions extends Entity {
	private var
	    actionsIndex:Number,
	    actionIndexes:Array,
	    actionsArray:Array;

	public function Actions():void {
	    super();
	    actionsIndex = -1;
	    actionIndexes = new Array(0, 1, 4);
	    actionsArray = new Array("zero", "one", "four");
	}

	public function advanceActions():void {
	    actionsIndex++;
	}

	public function act():void {
	    FP.console.log("Act on index: " + actionsIndex);
	    if (actionIndexes[0] == actionsIndex) {
		actionIndexes.shift();
		var string:String = actionsArray.shift();
		FP.console.log("Action: " + string);
	    }
	}
    }
}