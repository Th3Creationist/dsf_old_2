
if (image_xscale != 1) {
	image_xscale -= 0.2
};
if (image_yscale != 1) {
	image_yscale -= 0.2
};
if (image_alpha != 1) {
	image_alpha += 0.2;
};
if ((!instance_exists(o_hook) and !instance_exists(o_hookhoming)) or place_meeting(x, y, o_hook)) {
	instance_destroy()
};

