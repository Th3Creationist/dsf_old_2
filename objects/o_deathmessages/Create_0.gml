deathms = ds_list_create()
ds_list_add(deathms, "Don't hit the spikes!", "Youch, that one hurt", "Get Good", "And there goes our hero", "You fool", "Wimp");
messages = ds_list_find_value(deathms, random_range(0, ds_list_size(deathms) - 1))   