/// @description 
// Get current camera position
var camX = camera_get_view_x(camera);
var camY = camera_get_view_y(camera);
var camW = camera_get_view_width(camera);
var camH = camera_get_view_height(camera);




	// Set target camera position
	if (instance_exists(o_marcel)) {
	var targetX = o_marcel.x - camW/2;
	var targetY = o_marcel.y - camH/2;
	} else {
	var targetX = o_zoomer.x -camW/2;
	var targetY = o_zoomer.y -camH/2;	
	};

	// Clamp the target to room bounds
	targetX = clamp(targetX, camborderx - xadd, (camxend - xadd) - camW);
	targetY = clamp(targetY, cambordery - yadd, (camyend - yadd) - camH);

	// Smoothly move the camera to the target position
	camX = lerp(camX, targetX, CAM_SMOOTH);
	camY = lerp(camY, targetY, CAM_SMOOTH);
	

// Apply camera position
/*
var _shake = shake_str
if (shake_ln > 0) {
camX += random_range(-_shake, _shake);
camY += random_range(-_shake, _shake);
} else {
	shake_str = 0;
};
*/



camera_set_view_pos(camera, camX, camY);
camera_set_view_size(camera, camW, camH);

if (shake_ln > 0) {
	shake_ln -= 0.1
};