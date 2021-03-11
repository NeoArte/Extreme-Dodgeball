/// @description Insert description here
// You can write your code in this editor
target = instance_nearest(x, y, oBall);

if(distance_to_object(target) > 128*3){
	target = noone;
}

if(target != noone){
	target = (!target.hold)? target : noone; 
}

if(target != noone){
	target = (target.y >= oArenaCenter.y)? target : noone;
}

if(target != noone) {
	
	//goX = target.x;
	//goY = target.y;
	var way = irandom(8)+1;
	if(true == true){
		
		//Ponto a alguma direção do jogador ou da bola
		
		//1 2 3
		//4 X 5
		//6 7 8
		
		switch(way){
		
		case 1: 
			goX = x - 128; 
			goY = y - 128; 
			break;
		
		case 2: 
			goX = x; 
			goY = y - 128; 
			break;
			
		case 3: 
			goX = x + 128; 
			goY = y - 128;
			break;
		
		
		case 4:
			goX = x - 128;
			goY = y; 
			break;
			
		case 5:	
			goX = x + 128; 
			goY = y; 
			break;
		
		
		case 6: 
			goX = x - 128;
			goY = y + 128; 
			break;
		case 7: 
			goX = x; 
			goY = y + 128;
			break;
		case 8: 
			goX = x + 128;
			goY = y + 128; 
			break;
		
		}
		
	}
	show_debug_message(string(way) + ": "+ string(goX) + "/" + string(goY))
	angle = point_direction(x, y, goX, goY);
	
	dx = cos(degtorad(angle));
	dy = -sin(degtorad(angle));
	
	
} else {
	goX = x;
	goY = y;
}


//Distancia X

if(distance_to_point(goX, goY) > spd * 2){
	
	if(tilemap_get_at_pixel(tilemap, x + (dx * spd), y) == 0){
		x += dx * spd;
	}
	
	if(tilemap_get_at_pixel(tilemap, x, y + (dy * spd)) == 0){
		y += dy * spd;
	}
}

//show_debug_message("Dx: " + string(dx));
//show_debug_message("Dy: " + string(dy));
