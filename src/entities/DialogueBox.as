package entities
{
    import net.flashpunk.FP;
    import net.flashpunk.Sfx;
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Text;

    public class DialogueBox extends Entity {
	[Embed(source='../../assets/sounds/1.mp3')]
	    private var SOUND1:Class;
	[Embed(source='../../assets/sounds/2.mp3')]
	    private var SOUND2:Class;
	[Embed(source='../../assets/sounds/3.mp3')]
	    private var SOUND3:Class;
	[Embed(source='../../assets/sounds/4.mp3')]
	    private var SOUND4:Class;
	[Embed(source='../../assets/sounds/5.mp3')]
	    private var SOUND5:Class;
	[Embed(source='../../assets/sounds/6.mp3')]
	    private var SOUND6:Class;
	[Embed(source='../../assets/sounds/7.mp3')]
	    private var SOUND7:Class;
	[Embed(source='../../assets/sounds/8.mp3')]
	    private var SOUND8:Class;
	[Embed(source='../../assets/sounds/9.mp3')]
	    private var SOUND9:Class;
	[Embed(source='../../assets/sounds/10.mp3')]
	    private var SOUND10:Class;
	[Embed(source='../../assets/sounds/11.mp3')]
	    private var SOUND11:Class;
	[Embed(source='../../assets/sounds/12.mp3')]
	    private var SOUND12:Class;
	[Embed(source='../../assets/sounds/13.mp3')]
	    private var SOUND13:Class;

	private static const
	    PRINT_INTERVAL:Number = 0.1;

	private var 
	    text:Text,
	    textArray:Array,
	    printing:Boolean,
	    currentWord:String,
	    currentChar:Number,
	    lastPrint:Number,
	    soundsArray:Array,
	    theEnd:Boolean;

	public function DialogueBox(width:Number, height:Number):void {
	    super();

	    theEnd = false;

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
			  "Of our shared universe...",
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

	    soundsArray = new Array(new Sfx(SOUND1), new Sfx(SOUND2), new Sfx(SOUND3),
				    new Sfx(SOUND4), new Sfx(SOUND5), new Sfx(SOUND6),
				    new Sfx(SOUND7), new Sfx(SOUND8), new Sfx(SOUND9),
				    new Sfx(SOUND10), new Sfx(SOUND11), 
				    new Sfx(SOUND12), new Sfx(SOUND13));
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
	    if (theEnd) { return; }

	    if (!printing) {
		printing = true;
		currentWord = textArray.pop();
		currentChar = -1;
		lastPrint = PRINT_INTERVAL;
		text.text = "";

		if (currentWord == null) {
		    theEnd = true;
		}
	    }
	    // else {
	    // 	printing = false;
	    // 	text.text = currentWord;
	    // }
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

	    var randomSoundIndex:Number = Math.floor(FP.random * 13);
	    var randomSound:Sfx = soundsArray[randomSoundIndex];
	    randomSound.play();
	}

    }
}