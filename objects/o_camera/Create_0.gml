/// @description 
//Resolution
#macro RES_W 625
#macro RES_H 350
#macro RES_SCALE 7

#macro CAM_SMOOTH 0.1

// Enable views
view_enabled = true;
view_visible[0] = true;

// Create camera
camera = camera_create_view(0, 0, RES_W, RES_H);

view_set_camera(0, camera);

// Resize window & application surface
window_set_size(RES_W * RES_SCALE, RES_H * RES_SCALE);
surface_resize(application_surface, RES_W * RES_SCALE, RES_H * RES_SCALE);

display_set_gui_size(RES_W, RES_H);

// Center window
alarm[0] = 1;

buffer = 0;

shake_str = 5;
shake_ln = 0;
shake_tilt = 0;

zoom_val = 1;

finalx = 0;
finaly = 0;