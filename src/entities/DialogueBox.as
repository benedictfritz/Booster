package entities
{
    import net.flashpunk.FP;
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Text;

    public class DialogueBox extends Entity {
	private static const
	    PRINT_INTERVAL:Number = 0.1;

	private var 
	    text:Text,
	    textArray:Array,
	    printing:Boolean,
	    currentWord:String,
	    currentChar:Number,
	    lastPrint:Number;

	public function DialogueBox(width:Number, height:Number):void {
	    super();

	    textArray = 
		new Array(
			  "Press x to advance...", 
			  "Hello there, player...", 
			  "You seem quite average...", 
			  "But wait...", 
			  "I see something more inside of you...", 
			  "Yes...", 
			  "A gallant space marine...", 
			  "Survivor of unimaginable horrors...", 
			  "Bulging muscles...", 
			  "So bulging indeed...", 
			  "You face unimaginable trials...",
			  "Herculean feats of strength...",
			  "The only waypoints on the road of survival...",
			  "You face hordes of inconvievably depraved...",
			  "Disgusting...",
			  "Filthy...",
			  "Pathetic...",
			  "Puny aliens...",
			  "You pull out your big gun...", 
			  "Oh my...", 
			  "So very very large indeed...",
			  "I want to hear you shoot it...", 
			  "Pull the trigger...",
			  "I want to hear you pull it...",
			  "BOOOOOOOOOOOOOOOOOOOOM", 
			  "Oh...... yes.....", 
			  "Ohhh yes...",
			  "Say it out loud...",
			  "Say 'I shoot the big gun...'",
			  "Say it...",
			  "Yes...",
			  "You shoot the big gun...",
			  "My silicon heart quivers...",
			  "As the shockwaves of your pistol blast...",
			  "Reverberate through the very fabric...",
			  "Of our universe...",
			  "Your equally beefy comrades...",
			  "Turn their heads towards...",
			  "Your immaculately chiseled abs...",
			  "You...",
			  "You are the reason they will survive.",
			  "After you dispatch of the alien matriarch...",
			  "You return to Earth a hero...",
			  "But inside you're still just a humble space marine...",
			  "Doing your job...",
			  "Saving the world...",
			  "So smart...",
			  "The way you pulled that trigger...",
			  "So handsome...",
			  "The way you chiseled those abs...",
			  "You are the best...",
			  "Everyone loves you...",
			  "Your family loves you...",
			  "Your friends love you...",
			  "Women love you...",
			  "Men love you...",
			  "...",
			  "I love you...",
			  "...",
			  "We all love you...",
			  "Just the way you are...",
			  "We all love you...",
			  "...",
			  "So very very much...",
			  "The End."
			  );
	    textArray.reverse();

	    text = new Text("", 0, 0, width, height);
	    text.wordWrap = true;
	    text.size = 45;
	    text.color = 0x00FF00;
	    graphic = text;

	    printing = false;
	    advanceText();
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
		printing = true;
		currentWord = textArray.pop();
		currentChar = -1;
		lastPrint = PRINT_INTERVAL;
		text.text = "";
	    }
	    else {
		printing = false;
		text.text = currentWord;
	    }
	}

	private function continuePrinting():void {
	    lastPrint = 0;
	    currentChar++;
		    
	    if (currentChar > currentWord.length-1) { printing = false; }
	    else { concatCharactersToDialogue(); }
	}

	private function concatCharactersToDialogue():void {
	    var nextChar:String = currentWord.charAt(currentChar);
	    var currText:String = text.text;

	    currText = currText.concat(nextChar);
	    text.text = currText;
	}

    }
}