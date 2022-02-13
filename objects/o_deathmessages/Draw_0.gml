draw_set_font(font_main);
draw_set_valign(fa_center);


draw_text_color(room_width/2, room_height/2 - 30, "You Died", c_red, c_red, c_orange, c_yellow, 1);
draw_text(room_width/2, room_height/2 + 5, string(messages))