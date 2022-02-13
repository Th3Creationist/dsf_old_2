

#region X Movement Vars
xspeed = 0;
xwall = 4
max_speed = 3;
reset_speed = max_speed;
onGround = false;
on_wall = false;
wall_jump_delay = 0;
xspeed_carry = 0;
x_final = 0;
xbonus = 0;
grab_width = 20;
wat_max_x = 2.25;
wat_max_x_slant = 2;
begin_reset = false;
#endregion
#region Y Movement Vars
yspeed = 0;
gravity_acceleration = 0.4;
wall_gravity = 0.1;
max_fall = 12;
ywall = -7;
jump_height = -6
max_wall_delay = 15;
glide = 1;
ybonus = 0;
wat_max_y = 2;
wat_max_y_slant = 1.75;
#endregion
#region Jump Vars
jumpbuffer = 5
jumps = 0;
homing_cooldown = 0;
#endregion
#region Friction and Acceleration
acceleration = 0.5;
fric = 0.5
airaccel = 0.4
airfric = 0.4
#endregion
#region Dash
dash_direction = 0;
dashes = true;
dash_speed = -6;
dash_speed_slant = -5;
state_return = marcel.moving
windreset = 0;
able_to_boost = false;
dash_moment = false;
dash_bounce = false;
gamepad_set_axis_deadzone(0, 0.5)
#endregion
#region Player Graphics
draw_xscale = 1;
draw_yscale = 1;
x_scale = image_xscale;
y_scale = image_yscale;
image_dir = 1;
mask = mask_index;
onGround_prev = 0;
alarm[3] = 2;
#endregion
globalvar status_of_hook;
status_of_hook = 0;
enum marcel {
	moving,
	dash,
	gliding,
	rope,
	textbox,
	ledge,
	swim,
	
};


state = marcel.moving
direct = "N/A";

if (checkpointr = room) {
	x = checkpointx - 8
	y = checkpointy + 22
};