/// @param text
function texts(_text){
	text_set_default();
	text[page_number] = _text
	page_number++;
};

function text_set_default(){
	line_break_pos[0, page_number] = 999;
	line_break_num[0] = 0;
	line_break_offset[0] = 0;
};
	
/// @param text_id
function create_textbox(_text_id) {
		with(instance_create_depth(x, y, -9999, o_textbox)) {
			game_text(_text_id);
		}
}

/// @param text, link_id
function options(_option, _link_id) {
	option[option_number] = _option
	option_link_id[option_number] = _link_id
	
	option_number++;
}