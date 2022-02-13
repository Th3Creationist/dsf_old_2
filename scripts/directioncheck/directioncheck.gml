// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function directioncheck(){
		if (hInput = 0 and vInput = -1) {
			dash_direction = "N"
			direct = "N"
		} else if (hInput = 1 and vInput = -1) {
			dash_direction = "NE"
			direct = "NE"
		} else if (hInput = 1 and vInput = 0) {
			dash_direction = "E"
			direct = "E"
		} else if (hInput = 1 and vInput = 1) {
			dash_direction = "SE"
			direct = "SE"
		} else if (hInput = 0 and vInput = 1) {
			dash_direction = "S"
			direct = "S"
		} else if (hInput = -1 and vInput = 1) {
			dash_direction = "SW"
			direct = "SW"
		} else if (hInput = -1 and vInput = 0) {
			dash_direction = "W"
			direct = "W"
		} else if (hInput = -1 and vInput = -1) {
			dash_direction = "NW"
			direct = "NW"
		} else if (hInput = 0 and vInput = 0 and image_dir = 1) {
			dash_direction = "E"
			direct = "N/A"
		} else if (hInput = 0 and vInput = 0 and image_dir = -1) {
			dash_direction = "W"
			direct = "N/A"
		};
}