accept_key = keyboard_check_pressed(ord("E")) or gamepad_button_check_pressed(0, gp_face2)
textbox_x = o_camera._x + 17;
textbox_y = o_camera._y + 224;


if (setup = false) {
	setup = true;
	draw_set_font(font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	for(var p = 0; p < page_number; p++) {
		text_length[p] = string_length(text[p]);
		
		text_x_offset[p] = 16
		
	};
};
if (draw_char < text_length[page]) {
	draw_char += text_spd;
	draw_char = clamp(draw_char, 0, text_length[page]);
};
if (accept_key) {
	if (draw_char = text_length[page]) {
		if (page < page_number-1) {
			page++;
			draw_char = 0;
		} else {
			if option_number > 0 {
				create_textbox(option_link_id[option_pos])
			};
			instance_destroy();
		};
	}  else {
		draw_char = text_length[page];
	};
}; 
	


txb_spr_w = sprite_get_width(txb_spr)
txb_spr_h = sprite_get_height(txb_spr)
draw_sprite_ext(txb_spr, 0, textbox_x, textbox_y, textbox_width/txb_spr_w, textbox_height/txb_spr_h, 0, c_white, 1)
var _draw_text = string_copy(text[page], 1, draw_char)
option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)
option_pos = clamp(option_pos, 0, option_number-1);
//Options
if (draw_char = text_length[page] and page = page_number - 1) {
	var _opt_space = 63;
	var _opt_border = 20;
	for (var op = 0; op < option_number; op++) {
		draw_sprite_ext(txb_spr, 1, textbox_x + 50, textbox_y - _opt_space * option_number + _opt_space*op, 6.5, 0.83, 0, c_white, 1)
		
		if (option_pos = op) {
			var spd = s_select.image_speed
			txb_image += 0.2;
			draw_sprite(s_select, txb_image, textbox_x,  textbox_y - _opt_space * option_number + _opt_space*op + 12)
		};
		
		draw_text(textbox_x + 50 + _opt_border, textbox_y - _opt_space * option_number + _opt_space*op + 45, option[op])
	};
}

draw_set_valign(fa_top);
draw_text_ext(textbox_x + text_x_offset[page] + border, textbox_y + verborder, _draw_text, line_sep, line_width);
