
draw_set_font(tests);
draw_set_halign(fa_left)
draw_set_valign(fa_right)
draw_set_color(c_white);
if (state = marcel.rope) {
draw_text(x, y, string_insert(ropeLength, "ropeLength = ", 30));
draw_text(x, y + 30, string_insert(ropeAngleVelocity, "ropeAngleVelocity = ", 9));
draw_text(x, y + 60, string_insert(ropeX, "ropeX = ", 11));
draw_text(x, y + 90, string_insert(ropeY, "ropeY = ", 10));
};
