 if (instance_exists(o_marcel)) {
	if round(o_marcel.y + (o_marcel.sprite_height/2) > y) {
		mask_index = -1
	} else {              
		mask_index = s_cloud_plat             
	};  
}   
draw_x = lerp(draw_x, 1, 0.05);
draw_y = lerp(draw_y, 1, 0.05);

if (onme = false) {
	finaly = y + sin(height_bonus * 0.4) * 0.6;
	height_bonus += 0.1;
	if (height_bonus > 15) {
	height_bonus = 0
	};
} else {
	finaly = y;
	
};
