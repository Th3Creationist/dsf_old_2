
if (place_meeting(x, y, o_solid) and status_of_hook != 1) {
	status_of_hook = 0
	instance_destroy()
} else  if (!place_meeting(x, y, o_rope)) {
	move_towards_point(grapple_x, grapple_y, 18);
	image_angle = point_direction(x, y, grapple_x, grapple_y);
} else {
	status_of_hook = 1
	speed = 0;
	image_angle = point_direction(o_marcel.x, o_marcel.y, x, y);
	x = grapple_x;
	y = grapple_y;
};


	