if (instance_exists(o_marcel)) {
	if (place_meeting(x, y, o_marcel) and o_marcel.state = marcel.dash) {
		instance_destroy();
		o_marcel.xspeed = 0;
	};
};