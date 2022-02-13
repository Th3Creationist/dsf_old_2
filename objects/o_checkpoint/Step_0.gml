if (place_meeting(x, y, o_marcel)) {
	checkpoint = id;
	checkpointr = room;
	checkpointx = x;
	checkpointy = y;
};

if (checkpointr = room) and (checkpoint = id) {
	sprite_index = s_check_2;
	
} else {
	sprite_index = s_check_1
};