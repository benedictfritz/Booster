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

	    actions = new Actions(FP.width, FP.height/3);
	    add(actions);

	    dialogueBox = new DialogueBox(FP.width, FP.height/3 * 2);
	    dialogueBox.actions = actions;
	    add(dialogueBox);
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