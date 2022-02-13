draw_set_font(tests);
draw_set_halign(fa_left)
draw_set_valign(fa_right)
draw_set_color(c_white);
draw_text(x, y + 30, string_insert(grapple_x, "Tar_x = ", 9));
draw_text(x, y + 60, string_insert(grapple_y, "Tar_y = ", 11));
draw_text(x, y + 90, string_insert(check, "i = ", 13));
