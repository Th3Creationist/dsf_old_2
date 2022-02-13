// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function movement(){
	//Check if player is on the ground
	
	#region Y
	if (!place_meeting(x, y + 1, o_solid)) {
		var final_yspeed = gravity_acceleration
		if (on_wall != 0) && (yspeed > 0) {
			final_yspeed = wall_gravity
			yspeed += final_yspeed
		} else {
		yspeed += gravity_acceleration;
		}
		
		//Player is in the air


		
		
		//Control the jump height
	}
	if (down) and (!place_meeting(x, y+1, o_solid)) {
		yspeed += 0.3
	};
	
	if (place_meeting(x, y+1, o_solid)) {
			jumps = 12
		} else {
			jumps -= 1
		};

	if (up_release and yspeed < -3 and jumps > 0) {
			yspeed = -2;
		} else {
			if (jump and jumps > 0) {
			yspeed = jump_height;
			jumps = 0;
		}
		};
	if (xspeed != 0) {
		image_xscale = sign(xspeed);
	}
	if (yspeed > 10) {
		yspeed = 10
	};
	#endregion 
	
	if (right or left) {
		xspeed += (right - left) * acceleration;
		xspeed = clamp(xspeed, -max_speed, max_speed);
	}
	else {
		apply_friction(acceleration);
	}
	move(o_solid);

}