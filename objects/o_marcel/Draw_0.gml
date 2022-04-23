
draw_sprite_ext(s_marcel_idle, 0, x, y + 16, image_dir * draw_xscale, draw_yscale, 0, image_blend, image_alpha)

if (instance_exists(o_hook)) {
draw_line_width(x, y, o_hook.x, o_hook.y, 2)
};
if (instance_exists(o_hookhoming)) {
draw_line_width(x, y, o_hookhoming.x, o_hookhoming.y, 2)
};

draw_set_font(font_main);

draw_circle(x+xbonus, y+ybonus, 200, 3);

 

            