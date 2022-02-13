// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Particles(){

};

function pardash() {
	part_particles_create(o_par_bg.particle_system, x, y, o_par_bg.dashline, 5);
	repeat (3) {
	part_particles_create(o_par_bg.particle_system, x + random_range(-15, 15), y + random_range(-15, 15), o_par_bg.trail_dash, 5);
	};
	if (image_dir = 1) {
	part_particles_create(o_par_bg.particle_system, x, y, o_par_bg.dash, 1)
	} else {
	part_particles_create(o_par_bg.particle_system, x, y, o_par_bg.dash2, 1)
	};
};

function dir_par() {
	if (image_dir = 1) {
			part_particles_create(o_par_bg.particle_system, x, y, o_par_bg.dash, 1)
			} else {
			part_particles_create(o_par_bg.particle_system, x, y, o_par_bg.dash2, 1)
		};
};