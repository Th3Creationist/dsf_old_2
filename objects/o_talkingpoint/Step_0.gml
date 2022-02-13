
interact = keyboard_check_pressed(ord("E")) or gamepad_button_check_pressed(0, gp_face2)
if instance_exists(o_marcel) {
	 if (interact and !instance_exists(o_textbox) and place_meeting(x, y, o_marcel)) {
		 create_textbox(text_id);
	 };
};