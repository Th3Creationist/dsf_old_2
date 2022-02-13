// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function instance_nearest_ext(argument0, argument1, argument2, argument3){
globalvar instance_arr,distance_arr;
globalvar vx,vy,j;
vx = argument0;
vy = argument1;
ins = argument2;
num = argument3;
distance_arr = ds_list_create();
instance_arr = ds_list_create();
ds_list_clear(distance_arr);
ds_list_clear(instance_arr);

for (i=0; i<instance_count; i+=1){
    iii = instance_id[i];
    if (instance_exists(iii)){
        if (iii.object_index == ins){
           ds_list_add(distance_arr,point_distance(iii.x,iii.y,vx,vy));
           ds_list_add(instance_arr,iii);
        }
    }
}

change = true;

while(change = true){
change = false;
for(k=0;k<ds_list_size(distance_arr)-1;k+=1){
    if(ds_list_find_value(distance_arr,k) > ds_list_find_value(distance_arr,k+1)){
        a = ds_list_find_value(distance_arr,k);
        b = ds_list_find_value(instance_arr,k);
        ds_list_replace(distance_arr,k,ds_list_find_value(distance_arr,k+1))
        ds_list_replace(instance_arr,k,ds_list_find_value(instance_arr,k+1))
        ds_list_replace(distance_arr,k+1,a);
        ds_list_replace(instance_arr,k+1,b);
        change = true
        }
    }
}

return ds_list_find_value(instance_arr,num-1);
}