 if (instance_exists(o_marcel)) {
	if round(o_marcel.y + (o_marcel.sprite_height/2) > y) or keyboard_check(vk_down) or keyboard_check(ord("S")) or (gamepad_axis_value(0, gp_axislv) > 0) {
		mask_index = -1
	} else {              
		mask_index = s_semisolid                 
	};   
}        
