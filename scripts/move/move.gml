function move(argument0) {
	repeat(abs(yspeed)) {
	    if (!place_meeting(x, y + sign(yspeed), argument0))
	        y += sign(yspeed); 
	    else {
	        yspeed = 0;
	        break;
	    }
	}
	repeat(abs(xspeed)) {
	    if (place_meeting(x + sign(xspeed), y, argument0) && place_meeting(x + sign(xspeed), y - 1, argument0) && !place_meeting(x + sign(xspeed), y - 2, argument0))
	        y -= 0.5;
	    else if (place_meeting(x + sign(xspeed), y, argument0) and !place_meeting(x + sign(xspeed), y - 1, argument0)) {
		--y;
		};
	    if (!place_meeting(x + sign(xspeed), y, argument0) && !place_meeting(x + sign(xspeed), y + 1, argument0) && !place_meeting(x + sign(xspeed), y + 2, argument0) && place_meeting(x + sign(xspeed), y + 3, argument0)) {
	        y += 0.5;
		
		} else if (!place_meeting(x + sign(xspeed), y, argument0) && !place_meeting(x + sign(xspeed), y + 1, argument0) && place_meeting(x + sign(xspeed), y + 2, argument0)) {
	        ++y; 
		};
	    if (!place_meeting(x + sign(xspeed), y, argument0)) {
	        x += sign(xspeed); 
	    }
	}
}
