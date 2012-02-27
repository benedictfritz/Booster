package worlds
{
    import net.flashpunk.FP;
    import net.flashpunk.World;
    import net.flashpunk.utils.Key;
    import net.flashpunk.utils.Input;

    import entities.DialogueBox;

    public class TalkWorld extends World
    {
	private var 
	    dialogueBox:DialogueBox;
	
	public function TalkWorld():void {
	    super();

	    FP.screen.color = 0x000000;
	    dialogueBox = new DialogueBox(FP.width, FP.height);
	    add(dialogueBox);
	}

	override public function update():void {
	    super.update();
	    if (Input.pressed(Key.X)) { dialogueBox.advanceText(); }
	}

    }
}