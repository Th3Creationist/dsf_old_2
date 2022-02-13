 if (place_meeting(x, y, o_rope) and place_meeting(x, y, o_homingtarget)) {
	image_index = 2
} else if place_meeting(x, y, o_rope) {
	image_index = 1
} else if place_meeting(x, y, o_homingtarget) {
	image_index = 0
}
image_xscale = 2;
image_yscale = 2;
image_alpha = 0;