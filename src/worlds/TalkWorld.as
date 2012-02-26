package worlds
{
    import net.flashpunk.FP;
    import net.flashpunk.World;
    import net.flashpunk.utils.Key;
    import net.flashpunk.utils.Input;

    import entities.DialogueBox;
    import entities.Actions;

    public class TalkWorld extends World
    {
	private var 
	    dialogueBox:DialogueBox,
	    actions:Actions;
	
	public function TalkWorld():void {
	    super();
	    dialogueBox = new DialogueBox();
	    add(dialogueBox);

	    actions = new Actions();
	    add(actions);
	}

	override public function update():void {
	    super.update();
	    if (Input.pressed(Key.X)) { 
		dialogueBox.advanceText(); 
		actions.advanceActions();
	    }
	}
    }
}