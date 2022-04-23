 key_id = image_index;
globalvar key_collected;
key_collected = -1;

enum key {
	idle,
	collected
};

state = key.idle