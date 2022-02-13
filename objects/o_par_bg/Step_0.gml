#region Magic
var _dcol1 = make_color_rgb(105, 255, 255);
var _dcol2 = make_color_rgb(56, 138, 245);
var _dcol3 = make_color_rgb(64, 97, 214);
trail_dash = part_type_create();
part_type_sprite(trail_dash, s_par_dash, 0, 1, 1);
part_type_size(trail_dash , 0.6, 0.6, -0.025, 0.01)
part_type_alpha3(trail_dash, 1, 0.75, 0.25)
part_type_scale(trail_dash, 1, 1)
part_type_life(trail_dash, 10, 50)
part_type_color3(trail_dash, _dcol1, _dcol2, _dcol3)
part_type_gravity(trail_dash, random_range(0.005, 0.02), random_range(-360, 360))

dashline = part_type_create()
part_type_sprite(dashline, s_par_dash, 0, 0, 1);
part_type_size(dashline, 0.75, 0.75, 0, 0);
part_type_life(dashline, 25, 25)
part_type_alpha3(dashline, 1, 0.9, 0.2)
part_type_color2(dashline, c_white, c_grey)
part_type_gravity(dashline, random_range(0.005, 0.01), random_range(-360, 360))
#endregion

#region Rain
driplets = part_type_create();
part_type_sprite(driplets, s_raindrop, 0, 0, 1);
part_type_speed(driplets, 0.5, 4, 0.1, 0.2)
part_type_direction(driplets, 270, 270, 0, 0)
part_type_size(driplets,1, 1, 0, 0)
part_type_life(driplets, 50, 75)
part_type_alpha3(driplets, 0.75, 0.4, 0.1)
#endregion