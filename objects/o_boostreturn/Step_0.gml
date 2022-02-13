switch (state) {
	case Boost.true:
	mask_index = s_boost_return;
	image_index = 0;
	if (place_meeting(x, y, o_marcel)) {
		state = Boost.false
		alarm[0] = 240;
		o_marcel.able_to_boost = true;
	}; 
	break;
	
	case Boost.false:
	mask_index = -1
	image_index = 1
	break
};