particle_system = part_system_create_layer("Effects", 0);

#region dash
dash  = part_type_create();
part_type_sprite(dash, s_marcel_idle,0, 0, 1);
part_type_size(dash,1, 1, -0.025, 0)
part_type_life(dash, 5, 5)
part_type_alpha3(dash, 0.75, 0.5, 0.2)
part_type_color2(dash, c_white, c_ltgrey)

dash2  = part_type_create();
part_type_sprite(dash2, s_marcel_flippedfordash,0, 0, 1);
part_type_size(dash2,1, 1, -0.025, 0)
part_type_life(dash2, 5, 5)
part_type_alpha3(dash2, 0.75, 0.5, 0.2)
part_type_color2(dash2, c_white, c_ltgrey)

#endregion 

