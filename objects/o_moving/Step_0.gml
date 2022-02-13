mask_index = s_moving

xspeed = dir * movespeed;

if (place_meeting(x+xspeed, y, o_movedirect)) {
	while (!place_meeting(x+sign(xspeed), y, o_movedirect)) {
		x += sign(xspeed)
	}
	xspeed = 0
	dir *= -1;
}

x += xspeed;



if (instance_exists(o_marcel)) {
	if round(o_marcel.y + (o_marcel .sprite_height/2) > y) or keyboard_check(vk_down) or keyboard_check(ord("S")) or (gamepad_axis_value(0, gp_axislv) > 0) or o_marcel.state = marcel.dash {
		mask_index = -1
	} else {              
		mask_index = s_moving   
		if (place_meeting(x, y-1, o_marcel)) {
			o_marcel.xspeed_carry = xspeed
		};
	};  
}             