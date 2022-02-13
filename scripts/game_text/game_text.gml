/// @param id
function game_text(_text_id){
	switch (_text_id) {
		
		case "slime_prince": 
			texts("Heyo, I'm just a prince");
			texts("And a slime!");
			texts("and uh...... unfortunately. I lack what you humans call 'Legs'....");
			texts("I can't move.");
			texts("What's your favorite color");
				options("Blue", "sp_b")
				options("Yellow", "sp_y")
				options("Red", "sp_r")
		 break;
			case "sp_r": 
				texts("Not a bad color, but what's your real favorite color!");
					options("Green", "sp_g")
					options("Anything but Green", "sp_butg")
			break;
				case "sp_g": 
					texts("You know it!");
				break;
				case "sp_butg": 
					texts("that's... really, really specific. I guess you're not a green fan huh?");
				break;
			case "sp_b": 
				texts("Blue is pretty nice, but I'm more of a green guy myself");
					options("Green is nice too", "sp_gn")
					options("I can tell, you're green!", "sp_urg")
			break;
				case "sp_gn": 
					texts("Wooooo! Nice to meet another green fan");
				break;
				case "sp_urg": 
					texts("I know I'm green, that's why it's my favorite");
				break;
				case "sp_y": 
				texts("That's an awful choice...");
			break;
			break;
		
		case "s_1": {
			texts("Despite what you may think, I am a different guy.");
			texts("I just happen to use the same exact sprite because my developers were lazy hahaha!");
		} break;
	};
}