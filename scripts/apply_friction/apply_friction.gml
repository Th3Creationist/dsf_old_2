/// @description apply_friction(amount)
/// @param amount
function apply_friction(argument0) {
	var amount = argument0;
	
	if (xspeed != 0) {
		if (abs(xspeed) - amount > 0) {
			xspeed -= amount * image_dir;
		}
		else if (yspeed != 0) {
			xspeed -= 0.05 * image_dir
		} else {
			xspeed = 0
		};
	}


}

