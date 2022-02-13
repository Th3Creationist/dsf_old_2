alarm[3] = 2;

	
if (place_meeting(x, y+1, o_solid) and onGround_prev = false) {
	draw_xscale = 1.5;
	draw_yscale = 0.75;
};

if (place_meeting(x, y+1, o_solid)) {
		onGround_prev = true
	} else {
		onGround_prev = false;
	};