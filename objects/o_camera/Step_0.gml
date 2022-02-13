if (instance_exists(o_marcel)) {
	if ((keyboard_check(vk_up) or keyboard_check(ord("W")) or (gamepad_axis_value(0, gp_axislv) < 0)) and o_marcel.xspeed = 0 and o_marcel.yspeed = 0) {
		if (buffer > -5) {
			buffer -= 1
		}
	} else if (buffer != 0) {
		buffer += 1;
	};
};
alarm[0] = 1;



