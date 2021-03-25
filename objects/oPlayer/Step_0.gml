/// @description Steps Player

//Define as direções e angulo do movimento
angle = point_direction(x, y, mouse_x, mouse_y);
dirx = cos(degtorad(angle));
diry = -sin(degtorad(angle));


//Teste de colisão e movimento
if(distance_to_point(mouse_x,mouse_y) < spd * 2){
	x = x;
	y = y;
	
} else {
	
	if(tilemap_get_at_pixel(tilemap, x + (dirx*spd) + maskx, y + masky) == 0 
	&& tilemap_get_at_pixel(tilemap, x + maskx, y + (diry*spd) + masky) == 0)
	{
		x += dirx * spd;
		y += diry * spd;
	} else {
		
		if(tilemap_get_at_pixel(tilemap, x + (dirx*spd) + maskx, y + masky) != 0 
		&& tilemap_get_at_pixel(tilemap, x + maskx, y + (diry*spd) + masky) != 0){
			x = x;
			y = y;
		}
		else if(tilemap_get_at_pixel(tilemap, x + (dirx*spd) + maskx, y + masky) != 0){
			x = x;
			y += diry * spd;
		} else {
			x += dirx * spd;
			y = y;
		}
	}
}

//Segurar a bola
if(mouse_check_button(mb_left) || mouse_check_button(mb_right)){
	
	//Se está vazio
	if(ballHolding == noone){
		ballHolding = collision_rectangle(x - 32, y - 32, x + 32, y + 32, oBall, false, true)	
		
		if(ballHolding != noone){
			ballHolding = (ballHolding.isCold && (ballHolding.owner == noone || ballHolding.owner == id)) ? ballHolding : noone;
		}
	}
	
	//Quando tiver algo na mão
	if(ballHolding != noone){
		ballHolding.hold = true;
		ballHolding.owner = id;
	}
	
} else {
	//(Else) Se tinha e soltou
	if(ballHolding != noone){
		
		ballHolding.hold = false;
		
		ballHolding.launched = true;
		ballHolding.launchAngle = point_direction(x, y, mouse_x, mouse_y);
		
		
		ballHolding.owner = noone;
		ballHolding = noone;
	}
}

//Rodar a imagem
image_angle = angle;





//show_debug_message(string(tilemap_get_at_pixel(tilemap, mouse_x, mouse_y)));

//show_debug_message("x " + string(tilemap_get_at_pixel(tilemap, x + (dirx * spd), y)))
//show_debug_message("y " + string(tilemap_get_at_pixel(tilemap, x, y + (diry * spd))));
//if(ballHolding != noone){
	//show_debug_message(string(ballHolding.hold));
//}

