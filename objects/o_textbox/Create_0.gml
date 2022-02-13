depth = -9999
#region parameters
textbox_width = 702
textbox_height = 172
border = 20;
verborder = 20;
line_sep = 20;
line_width = textbox_width - (border*2)
txb_spr = s_textbox;
txb_image = 0;
txb_spd = 0;
#endregion
#region text
page = 0;
page_number = 0;
text[0] = "";
text_length[0] = string_length(text[0]);
char[0, 0] = "";
char_x[0, 0] = 0;
char_y[0, 0] = 0;
draw_char = 0;
text_spd = 0.5;
setup = false;
#endregion
#region Options
option[0] = "";
option_link_id[0] = -1;
option_pos = 0;
option_number = 0;
#endregion
#region Visual Effects
text_set_default();
last_free_space = 0;
#endregion