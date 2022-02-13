state = state_return;
if (yspeed < 0) {
	yspeed = -4
}
if (xspeed != 0 and !dash_moment = true and !wall_kick) {
	max_speed = reset_speed;
	xspeed = max_speed * image_dir * 2;
	if (yspeed < 0) {
		yspeed = -4
	};
} else {
	dash_moment = false
};
