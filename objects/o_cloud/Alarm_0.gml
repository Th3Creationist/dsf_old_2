if (place_meeting(x, y-1, o_marcel) and (onme = false)) {
	onme = true;
	draw_x = 1.1;
	draw_y = 0.9;
		repeat random_range(5, 20) {
		part_particles_create(o_par_bg.particle_system, x + random_range(-sprite/2 + 5, sprite/2 - 3), y+8, o_par_bg.driplets, 1)
		};
		alarm[1] = random_range(20, 60);
} else if (!place_meeting(x, y-1, o_marcel)) {
	onme = false
};
	alarm[0] = 1;
	
