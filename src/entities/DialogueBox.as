package entities
{
    import net.flashpunk.FP;
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Text;

    public class DialogueBox extends Entity {
	private static const
	    PRINT_INTERVAL:Number = 0.1;

	public var
	    actions:Actions;

	private var 
	    text:Text,
	    textArray:Array,
	    printing:Boolean,
	    currentWord:String,
	    currentChar:Number,
	    lastPrint:Number;

	public function DialogueBox():void {
	    super();

	    textArray = new Array("", "Hello there player...", "Oh my... you seem quite average.", "Let's see if we can do something about that...", "Are you more of a space marine... or a powerful wizard?");
	    textArray.reverse();

	    text = new Text(textArray.pop(), 0, 0, FP.width, FP.height/3);
	    text.wordWrap = true;
	    text.size = 45;
	    graphic = text;
	}

	override public function update():void {
	    super.update();
	    if (printing) {
		lastPrint += FP.elapsed;
		if (lastPrint > PRINT_INTERVAL) { continuePrinting(); }
	    }
	}

	public function advanceText():void {
	    if (!printing) {
		FP.console.log("wasn't printing. starting print.");
		printing = true;
		currentWord = textArray.pop();
		FP.console.log("current word: " + currentWord);
		currentChar = -1;
		lastPrint = PRINT_INTERVAL;
		text.text = "";
	    }
	}

	private function continuePrinting():void {
	    lastPrint = 0;
	    currentChar++;
		    
	    if (currentChar > currentWord.length-1) { 
		printing = false;
		actions.act();
	    }
	    else { 
		concatCharactersToDialogue(); 
	    }
	}

	private function concatCharactersToDialogue():void {
	    var nextChar:String = currentWord.charAt(currentChar);
	    var currText:String = text.text;

	    currText = currText.concat(nextChar);
	    text.text = currText;
	}

    }
}