// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Death(){
	if (marcelhp <= 0) {
		room_goto(r_died)
	} else {
		if (checkpointr != -1) {
			marcelhp -= 0;
			if (marcelhp <= 0) {
				room_goto(r_died)
			} else {
			room_goto(checkpointr)
			};
		}
		else {
		marcelhp -= 0;
		room_restart();
		};
	};
}