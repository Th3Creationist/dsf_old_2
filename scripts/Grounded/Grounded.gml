function Grounded() {
	return place_meeting(x, y + 1, o_solid);
}

function InWater() {
	return place_meeting(x, y, o_water);
}

