grapple_x = 0;
grapple_y = 0;

var _list = ds_list_create();
collision_circle_list(o_marcel.x+o_marcel.xbonus, o_marcel.y+o_marcel.ybonus, 200, o_rope, false, false, _list, true);

if (ds_list_empty(_list)) {
	instance_destroy();
};
if (!ds_list_empty(_list)) {
grapple_x = ds_list_find_value(_list, 0).x
grapple_y = ds_list_find_value(_list, 0).y
};
instance_create_layer(grapple_x, grapple_y, "Items", o_target)

