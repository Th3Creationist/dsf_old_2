if (onme = true) {
repeat random_range(1, 5) {
		part_particles_create(o_par_bg.particle_system, x + random_range(-sprite/2 + 5, sprite/2 - 3), y+8, o_par_bg.driplets, 1)
		};
	alarm[1] = random_range(20, 60);
};