package entities 
{
    import net.flashpunk.FP;
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Text;

    public class Actions extends Entity {
	private var
	    text:Text,
	    actionsIndex:Number,
	    actionIndexes:Array,
	    actionsArray:Array;

	public function Actions(width:Number, height:Number):void {
	    super();
	    actionsIndex = -1;
	    actionIndexes = new Array(0, 1, 4);
	    actionsArray = new Array("zero", "one", "four");

	    text = new Text("", 0, FP.height - height, width, height);
	    text.wordWrap = true;
	    text.size = 45;
	    graphic = text;
	}

	public function advanceActions():void {
	    actionsIndex++;
	}

	public function act():void {
	    FP.console.log("Act on index: " + actionsIndex);
	    if (actionIndexes[0] == actionsIndex) {
		actionIndexes.shift();
	    }
	}
	
	override public function update():void {
	    
	}
    }
}