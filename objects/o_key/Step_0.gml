switch (state) {

	case key.idle:
	if (place_meeting(x, y, o_marcel)) {
		state = key.collected
	};
	break;
	
	case key.collected:
	key_collected = key_id
	instance_destroy();
	break;
	
};