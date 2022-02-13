 //Set Up the Main Inputs
left = keyboard_check(vk_left) or keyboard_check(ord("A"))  or (gamepad_axis_value(0, gp_axislh) < 0);
right = keyboard_check(vk_right) or keyboard_check(ord("D")) or (gamepad_axis_value(0, gp_axislh) > 0);
down = keyboard_check(vk_down) or keyboard_check(ord("S")) or (gamepad_axis_value(0, gp_axislv) > 0);
up = keyboard_check(vk_up) or keyboard_check(ord("W")) or (gamepad_axis_value(0, gp_axislv) < 0);
jump = keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(0, gp_face1) or gamepad_button_check_pressed(0, gp_face2);
up_release = keyboard_check_released(vk_space) or gamepad_button_check_released(0, gp_face1) or gamepad_button_check_released(0, gp_face2)
hInput = (right - left);
vInput = (down - up);

//Extra Input
dashmove = mouse_check_button_pressed(mb_left) or (gamepad_button_check_pressed(0, gp_shoulderrb))
swingmove = mouse_check_button_pressed(mb_side1) or (gamepad_button_check_pressed(0, gp_shoulderlb))
homingmove = mouse_check_button_pressed(mb_side2) or (gamepad_button_check_pressed(0, gp_shoulderl))
interact = keyboard_check_pressed(ord("E")) or gamepad_button_check_pressed(0, gp_face2)
grab = keyboard_check(ord("Q")) or gamepad_button_check(0, gp_shoulderl)

//Textbox State
if (instance_exists(o_textbox)) {
	state = marcel.textbox;
};

//Death Control
if (place_meeting(x, y, o_die)) {
	Death();
};

//Max Speed Control
if (max_speed > 15) {
	max_speed = 15
};

//Camera Controls 2
if (place_meeting(x, y, o_camadd)) {
	inadd = true 
} else {
	inadd = false 
};

#region STATES
 switch (state) {
	#region Moving
	case marcel.moving:
	
	//Checks Direction
	directioncheck();
	
	//Check and Set Max Speed
	if (max_speed != reset_speed) {
		dir_par();
		image_blend = c_white;
		if (!InWater) {
		xspeed = max_speed
		};
	};
	
	//Prepare Acceleration Values
	var finalAccel;
	var finalFric;
	if (onGround) {
	    finalAccel = acceleration;
	    finalFric  = fric;
	} else {
		finalAccel = airaccel;
	    finalFric  = airfric;
	}

//Y Values
	
	//Gravity (If player is falling)
	if (!onGround) {
		var final_yspeed = gravity_acceleration
		if (on_wall != 0) and (yspeed > 0) {
			final_yspeed = wall_gravity
			yspeed += final_yspeed
		} else {
		yspeed += gravity_acceleration;
		}
	};
	
	//Check if player is on a wall
	on_wall = place_meeting(x + 1, y, o_solid) - place_meeting(x-1, y, o_solid);
	
	//Fast Fall
	if (down and !onGround) {
		draw_yscale = lerp(draw_yscale, 1.25, 0.1);
		draw_xscale = lerp(draw_xscale, 0.5, 0.1);
		max_fall = 8
	} else {
		max_fall = 5
	};
	
	//Crouch
	if (onGround and down) {
		sprite_index = 1;
	} else {
		sprite_index = 0;
	};
	
	//Wall Jump / Player is on a wall
	if (on_wall != 0) {
		
		//Dust Particle Control
		var side = bbox_left
		if (on_wall == 1) {side = bbox_right};
			dust++;
			if ((dust > 2) && (yspeed > 0)) with (instance_create_layer(side, bbox_top, "Effects", o_dust)) {
				other.dust = 0
				xspeed = -other.on_wall * 0.5;
			}
		} else {
			dust = 0
		};
		
	//The Wall Jump
	if (on_wall != 0) && (!place_meeting(x, y + 1, o_solid)) && (jump) {
		max_speed = reset_speed
		xspeed = -on_wall * xwall;
		yspeed = ywall;
		wall_jump_delay = max_wall_delay;
		draw_yscale = 1.2
		draw_xscale = 0.75
	};
	
	//Wall Jump Delay
	wall_jump_delay = max(wall_jump_delay - 1, 0);
	
	//The Player is Grounded
	if (onGround) {
			max_fall = 10;
			glide = 1;
			jumps = 15
			
			//Check if player is semi-submerged in water
			if (!place_meeting(x, y - 6, o_water)) {
			max_speed = reset_speed
			};
		} else {
			jumps -= 1
		};
		
	//Jump Buffer (Gives the player a little time after they click jump to still activate it)
	if (jump and !dashmove and !down) {
		jumpbuffer = 11
	} else {
		jumpbuffer -= 1;
	};

	//The Jump
	if (up_release and yspeed < 0) {
			yspeed = -2;
			jumps = 0;
		} else {
			if (jumpbuffer > 0 and jumps > 0) {
			yspeed = jump_height
			jumps = 0;
			draw_yscale = 1.5
			draw_xscale = 0.25
		}
	};
	
	//Squish Return
	if (!down) {
		if (draw_xscale > 0) {
			draw_xscale = lerp(draw_xscale, 1, 0.1)	
		} else if (draw_xscale < 0) {
			draw_xscale = lerp(draw_xscale, -1, 0.1)	
		};
			draw_yscale = lerp(draw_yscale, 1, 0.1)	
	};
	//Set Max Falling Speed
	if (yspeed > max_fall) {
		yspeed = max_fall
	};
	
//X Values
	//Control Direction
	if (xspeed != 0) {
		image_dir = sign(xspeed);
	}
	
	//Movement
	if (wall_jump_delay = 0) {
		
		//Move
		if (right) {
			xspeed = Approach(xspeed, max_speed, finalAccel);
			xspeed = clamp(xspeed, -max_speed, max_speed);
		} else if (left) {
			xspeed = Approach(xspeed, -max_speed, finalAccel);
			xspeed = clamp(xspeed, -max_speed, max_speed);
		} else {
			apply_friction(finalFric)
		}
	};
	
	//Dash
	if (dashmove and dashes = true) {
		shake(2, 5, 0.1);
		state = marcel.dash
		alarm[1] = 10;
		dashes = false;
		state_return = marcel.moving
			if (!place_meeting(x, y+1, o_solid)) {
				 dash_bounce = true;
			};
	} else if (place_meeting(x, y+1, o_solid)) {
		dashes = true;
	};
	
	//Rope Swing
	if(swingmove){
		max_speed = reset_speed;
		
		//Create the Hook
		if (!instance_exists(o_hook) and instance_exists(o_rope) and !instance_exists(o_hookhoming)) {
			instance_create_layer(x, y, "Items", o_hook)
		};
	};
	
	//Rope Swing Set Up
	if (status_of_hook = 1 and instance_exists(o_hook)) {
		grapple_x = instance_nearest(x, y, o_hook).x;
		grapple_y = instance_nearest(x, y, o_hook).y;
		ropeX = x;
		ropeY = y;
		ropeAngleVelocity = xspeed       
		ropeAngle = point_direction(grapple_x, grapple_y, x, y);
		ropeLength = point_distance(grapple_x, grapple_y, x, y);
		state = marcel.rope
	};
	
	//Homing Hook
		
		//Set-Up Cooldown
		homing_cooldown -= 0.1
		if (homing_cooldown < 0) {
			homing_cooldown = 0
		};
		
	//Homing Move
	if(homingmove and homing_cooldown <= 0){
		max_speed = reset_speed;
		
		//Create the Hook
		if (!instance_exists(o_hook) and instance_exists(o_rope) and !instance_exists(o_hookhoming)) {
			instance_create_layer(x, y, "Items", o_hookhoming)
		};
	};
	
	//Homing Attack
	if (status_of_hook = 1 and instance_exists(o_hookhoming)) {
			if instance_exists(o_homingtarget) {
			targetx = o_hookhoming.x
			targety = o_hookhoming.y
			move_towards_point(targetx, targety, 20)
			homing = true
			
		//Move Player to Target
		if (place_meeting(x, y, o_homingtarget)) and (speed > 0) and (homing = true) {
				speed = 0
				yspeed = jump_height
				homing = false
				homing_cooldown = 1;
				status_of_hook = 0;
				targetx = 0
				targety = 0;
				instance_destroy(o_hookhoming)
			};
		};
	};
	
	//Control the Range of the Homing and Swing moves
	if (yspeed < 0 or up) {
		ybonus = -75
		xbonus = 0;
	} else if (down) {
		ybonus = 40
		xbonus = 0;
	} else if ((dash_direction = "E" or dash_direction = "NE" or dash_direction = "SE") and right) {
		xbonus = 40;
		ybonus = 0;
	} else if ((dash_direction = "NW" or dash_direction = "W" or dash_direction = "SW") and left) {
		xbonus = -40
		ybonus = 0;
	} else {
		xbonus = 0;
		ybonus = 0;
	} 
	
	//Enter Swim State
	if (place_meeting(x, y - 15, o_water)) {
		state = marcel.swim
	} else if (place_meeting(x, y - 8, o_water)) {
		max_speed = 2;
		alarm[0] = 2;
	}
	
	//Spring Control (Can be edited)
	if (place_meeting(x, y, o_spring)) {
		yspeed = jump_height * 2;
		shake(2, 5, 0.1);
		dashes = 1;
		draw_yscale = 1.6
		draw_xscale = 0.5
	} else if (place_meeting(x, y, o_springl)) {
		xspeed = -14
		yspeed = jump_height * 1.2
		max_speed = 14;
		alarm[1] = 12;
		shake(2, 5, 0.1);
		dashes = 1;
		wall_jump_delay = max_wall_delay;
	} else if (place_meeting(x, y, o_springr)) {
		xspeed = 14
		yspeed = jump_height * 1.2
		max_speed = 14;
		alarm[1] = 12;
		shake(2, 5, 0.1);
		dashes = 1;
		wall_jump_delay = max_wall_delay;
	};
	
	//Orbs
	if (place_meeting(x, y, o_bounce) and (jump)) {
		jumps = 5;
		yspeed = jump_height * 1.2;
	};
	
	//Squish Return
	if (draw_xscale > 0) {
		draw_xscale = lerp(draw_xscale, 1, 0.1)	
	} else if (draw_xscale < 0) {
		draw_xscale = lerp(draw_xscale, -1, 0.1)	
	};
		draw_yscale = lerp(draw_yscale, 1, 0.1)	
	
	
	//Collision
	move(o_solid);
	
	break;
	#endregion
	
	#region Dash
	case marcel.dash:
	
	//Control Dash Particles
	pardash();
	
	//Check if the Player is on a Wall
	on_wall = place_meeting(x + 1, y, o_solid) - place_meeting(x-1, y, o_solid);
	
	//The Code for the Dash
	#region Dash Code is Wrapped because it's messy
	if (dash_direction = "N") {
		 yspeed =  dash_speed
		 dash_direction = 0;
		 xspeed = 0;
		 dash_bounce = false;
		 wall_kick = true;
	} else if (dash_direction = "NE") {
		 yspeed =  dash_speed_slant;
		 max_speed = -dash_speed_slant;
		 image_dir = 1;
		 xspeed = max_speed * image_dir
		 dash_direction = 0;
		 able_to_boost = true;
		  dash_bounce = false;
		  wall_kick = false;
	 } else if (dash_direction = "E") {
		 max_speed = -dash_speed;
		  image_dir = 1;
		 xspeed = max_speed * image_dir
		 dash_direction = 0;
		 yspeed = 0;
		 able_to_boost = true;
		  dash_bounce = false;
		  wall_kick = false;
	 } else if (dash_direction = "SE") {
		 yspeed =  -dash_speed_slant;
		 max_speed = -dash_speed_slant;
		  image_dir = 1;
		 xspeed = max_speed * image_dir
		 dash_direction = 0;
		 able_to_boost = true;
		  dash_bounce = false;
		  wall_kick = false;
	 } else if (dash_direction = "S") {
		 yspeed =  -dash_speed;
		 dash_direction = 0;
		 xspeed = 0;
		 alarm[1] += 5;
		 wall_kick = false;
	} else if (dash_direction = "SW") {
		 yspeed =  -dash_speed_slant;
		 max_speed = - dash_speed_slant;
		  image_dir = -1;
		 xspeed = max_speed * image_dir
		 dash_direction = 0;
		 able_to_boost = true;
		  dash_bounce = false;
		  wall_kick = false;
	} else if (dash_direction = "W" or dash_direction = "N/A") {
		 max_speed = -dash_speed;
		 xspeed = max_speed * image_dir
		  image_dir = -1;
		 dash_direction = 0;
		 yspeed = 0;
		 able_to_boost = true;
		  dash_bounce = false;
		  wall_kick = false;
	} else if (dash_direction = "NW") {
		 yspeed =  dash_speed_slant;
		  image_dir = -1;
		 max_speed = - dash_speed_slant;
		 xspeed = max_speed * image_dir
		 dash_direction = 0;
		 able_to_boost = true;
		 dash_bounce = false;
		  wall_kick = false;
 };
	#endregion
	
	//Allow for a Continuous Dash if Grounded
	 if (place_meeting(x,y+1,o_solid)) and (dashmove) {
		 alarm[1] += 5;
	 };
	 
	 //Long Jump
	 if (place_meeting(x, y+1, o_solid) and jump and (able_to_boost = true)) {
		yspeed = jump_height * 0.8;
		xspeed = (dash_speed * 1.2) * -image_dir
		alarm[0] = 15;
		alarm[1] = 5;
		dash_moment = true;
		dashes = true;
	};
	
	//Spring Dash
	if (place_meeting(x, y+1, o_solid) and jump and (dash_bounce = true)) {
		yspeed = jump_height * 2
		xspeed = 0
		alarm[1] = 8;
		dash_bounce = false
		dashes = true;
	};
	
	//Wall Kick
	if (on_wall != 0) and (!place_meeting(x, y + 1, o_solid)) and (jump) and (wall_kick) {
		xspeed = -on_wall * 3;
		yspeed = jump_height * 2;
		alarm[1] = 8;
	};
	
	//Collisions
	move(o_solid)
	
	break;
	#endregion
	
	#region Gliding
	case marcel.gliding:

//Glide Movement

	//Special Glide Vars
	var max_speed_gld = 6
	var accel_gld = 0.8
	var boost = -12
	
	//Fast Fall
	if (down) {
		var gravity_acceleration_gld = 0.5
		var max_fall_gld = 8
		var max_speed_gld = 6
	} else if (!place_meeting(x, y, o_windy) and windreset > 0) {
		windreset -= 1
		gravity_acceleration_gld = 0.75
		var max_fall_gld = 2.5
		max_speed_gld = 4
	} else {
		var gravity_acceleration_gld = 0.15
		var max_fall_gld = 2.5
		var max_speed_gld = 6
	}
	directioncheck();
	
	if (right) {
		xspeed = Approach(xspeed, max_speed_gld, accel_gld);
		xspeed = clamp(xspeed, -max_speed_gld, max_speed_gld);
	} else if (left) {
		xspeed = Approach(xspeed, -max_speed_gld, accel_gld);
		xspeed = clamp(xspeed, -max_speed_gld, max_speed_gld);
	} else {
		apply_friction(airfric)
	}
	
	if (!onGround) {
		var final_yspeed = gravity_acceleration_gld
		if (on_wall != 0) && (yspeed > 0) {
			final_yspeed = wall_gravity
			yspeed += final_yspeed
		} else {
		yspeed += gravity_acceleration_gld;
		}
	};
	on_wall = place_meeting(x + 1, y, o_solid) - place_meeting(x-1, y, o_solid);
	
	if (on_wall != 0 or onGround or gear_move or place_meeting(x, y, o_droplets)) {
		state = marcel.moving
	};
	if (yspeed > max_fall_gld) {
		yspeed = max_fall_gld
	};
	if (xspeed != 0) {
		image_dir = sign(xspeed);
	}
	if (dashmove and dashes > 0 and !jump) {
		state = marcel.dash
		alarm[1] = 10;
		state_return = marcel.gliding
		dashes = 0;
	};
	
	
	move(o_solid)
	if (place_meeting(x, y, o_windy)) {
		yspeed -= 1
		if (yspeed < -15) {
			yspeed = -15
		};
		windreset = 15
		able_to_boost = true
	};

	
			if (able_to_boost = true and jump) {
			yspeed = boost
			able_to_boost = false
			windreset = 6
		}
	
	break;
	#endregion
	
	#region Rope Swing
	case marcel.rope: {
		
		//Rope Swing Values
		var _ropeAngleAcceleration = -0.2 * dcos(ropeAngle)
		ropeAngleVelocity += _ropeAngleAcceleration;
		_ropeAngleAcceleration += (left - right) * 0.08;
		ropeLength += (down - up) * 2
		ropeLength = max(ropeLength, 5)
		ropeAngle += ropeAngleVelocity;
		ropeAngleVelocity *= 0.99;
		
		//Max Rope Length
		if (ropeLength >= 300) {
			ropeLength = 300;
		};
		
		//Min Rope Length
		if (ropeLength <= 0) {
			ropeLength = 0;
		};
		
		//Control the Pos of the Rope
		ropeX = grapple_x + lengthdir_x(ropeLength, ropeAngle)
		ropeY = grapple_y + lengthdir_y(ropeLength, ropeAngle)
		
		//Player Movement
		xspeed = ropeX - x;
		yspeed = ropeY - y;
		
		//Exit the Swing with Momentum
		if (jump) {
			state = marcel.moving
			yspeed = jump_height
			reset_speed = max_speed;
			xspeed = ropeAngleVelocity*2
			max_speed = ropeAngleVelocity*2
			status_of_hook = 0;
			alarm[0] = 30;
			instance_destroy(o_hook);
		};
		
		//Check Direction
		directioncheck();
		
		//Dash out of the Rope Swing
		if (dashmove and dashes = true and !jump) {
			shake(0.01, 0.01, 0);
			state = marcel.dash
			alarm[1] = 10;
			dashes = false;
			state_return = marcel.moving
			status_of_hook = 0;
			instance_destroy(o_hook);
		} else if (place_meeting(x, y+1, o_solid)) {
			dashes = true;
		};
		
		//Collision
		move(o_solid);

	} break;
	#endregion
	
	#region Talking
	case marcel.textbox: {
		
		//Gravity Apply
		if (!onGround) {
		var final_yspeed = gravity_acceleration
		if (on_wall != 0) && (yspeed > 0) {
			final_yspeed = wall_gravity
			yspeed += final_yspeed
		} else {
		yspeed += gravity_acceleration;
		}
	};
	
	//Grounded
	if (onGround) {
			max_fall = 10;
			glide = 1;
			jumps = 12
			max_speed = reset_speed;
		} else {
			jumps -= 1
		};
		if (!instance_exists(o_textbox)) {
			state = marcel.moving
		};
		
	} break;
	#endregion
	
	#region Ledge Grab / Wall Climb
	case marcel.ledge: {
		image_blend = c_fuchsia;
		if (down) { 
			state = marcel.moving 
		};
		if (jump) {
			state = marcel.moving
			yspeed = jump_height * 1.2;
			draw_yscale = 1.2
			draw_xscale = 0.75
		};
		
		if (right and image_dir = -1) {
			state = marcel.moving
			yspeed = jump_height;
			xspeed = -dash_speed
			max_speed = -dash_speed;
			alarm[0] = 10;
			draw_yscale = 1.2
			draw_xscale = 0.75
		};
		if (left and image_dir = 1) {
			state = marcel.moving
			yspeed = jump_height;
			xspeed = -dash_speed
			max_speed = dash_speed;
			alarm[0] = 10;
			draw_yscale = 1.2
			draw_xscale = 0.75
		};
			
		
	} break;
	#endregion
	
	#region Swim
	case marcel.swim: {
		image_blend = c_white;
		
		//Control Water Values
		var wat_accel = 0.2
		var gravity_acceleration_sw = 0.2
		var max_fall_sw = 1
		
		//Gravity Apply
		if (!onGround and direct = "N/A") {
			var final_yspeed = gravity_acceleration_sw
			if (on_wall != 0) && (yspeed > 0) {
				final_yspeed = wall_gravity
				yspeed += final_yspeed
			} else {
			yspeed += gravity_acceleration_sw;
			}
		};
		if (yspeed > max_fall_sw) {
			yspeed = max_fall_sw
		};
		
	//Check Direction
	directioncheck();
	
	//Movement (Underwater)
	if (direct != "N/A") {
		if (dash_direction = "N") {
				 yspeed = -wat_max_y
				 xspeed = 0;
			 } else if (dash_direction = "NE") {
				 yspeed =  -wat_max_y_slant;
				 xspeed = wat_max_x_slant
			 } else if (dash_direction = "E") {
				 xspeed = wat_max_x
				 yspeed = 0;
			 } else if (dash_direction = "SE") {
				 yspeed =  wat_max_y_slant;
				 xspeed = wat_max_y
			 } else if (dash_direction = "S") {
				 yspeed =  wat_max_y
				 xspeed = 0;
			 } else if (dash_direction = "SW") {
				 yspeed =  wat_max_y_slant;
				 xspeed = -wat_max_x_slant
			 } else if (dash_direction = "W" or dash_direction = "N/A") {
				 xspeed = -wat_max_x
				 yspeed = 0;
			 } else if (dash_direction = "NW") {
				 yspeed =  -wat_max_y_slant;
				 xspeed = -wat_max_x_slant
		 };
	} else {
		apply_friction(wat_accel)
	};
		if (xspeed != 0) {
		image_dir = sign(xspeed);
	}
	
	//Exit the Water
	if (!place_meeting(x, y - 18, o_water) and up) {
		yspeed = 0;
		if (jump) {
			yspeed = jump_height;
			state = marcel.moving;
			draw_yscale = 1.6
			draw_xscale = 0.5
			dashes = true; 
		};
	}
	
	//Recharge Dash
	if (!place_meeting(x,y,o_water)) {
		state = marcel.moving;
		dashes = true;
	};
	
	//Collision
	move(o_solid);
	} break;
	#endregion
 };
#endregion