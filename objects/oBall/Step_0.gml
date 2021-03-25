/// @description Insert description here
// You can write your code in this editor

if(tilemap_get_at_pixel(tilemap, x, y) == 1
|| ((x > room_width || x < 0)||(y > room_height || y < 0))){
	
	dx *= -1;
	dy *= -1;
	
	var teleportTo, oldX;
	oldX = x;
	x += 100000;
	
	teleportTo = instance_nearest(oldX, y, oBall);
	
	if(teleportTo != id){
		x = teleportTo.x;
		y = teleportTo.y;
	} else {
		x = oArenaCenter.x;
		y = oArenaCenter.y;
	}
	
}

if(hold){
	
	alarm[2] = 5*60;
	
	image_angle = 0;
	
	chargeTime++;
	
	chargeTime = (charge == 0)? chargeTimeLimit : chargeTime;
	
	//Se for pressionado contra a parede
	
	if(tilemap_get_at_pixel(tilemap, owner.x + lengthdir_x(xToPlayer + xToPlayer/3, owner.angle), y) == 1){
		x = owner.x;
	} else {
		x = owner.x + lengthdir_x(xToPlayer, owner.angle);
	}
	
	if(tilemap_get_at_pixel(tilemap, x, owner.y + lengthdir_y(yToPlayer + yToPlayer/3, owner.angle)) == 1){
		y = owner.y;
	} else {
		y = owner.y + lengthdir_y(yToPlayer, owner.angle);
	}
	
	if(tilemap_get_at_pixel(tilemap, x, y) == 1){
		x = owner.x;
		y = owner.y;
	}
	
	//Sem distorções
	
	image_xscale = 1;
	image_yscale = 1;
	
	//Aumentar nivel da bola

	if(chargeTime == chargeTimeLimit){
		chargeTime = 0;
		if(charge < 3){
			charge++;
			chargeTimeLimit += 25;
			
			switch(charge){
				case 0: image_blend = c_zero; break;
				case 1: image_blend = c_one; break;
				case 2: image_blend = c_two; chargeTimeLimit += 10; break;
				case 3: image_blend = c_three; break;
			}
		}
	}
	
	
}

if(launched){
	
	
	chargeTime = 0;
	chargeTimeLimit = 25;
	
	dx = cos(degtorad(launchAngle));
	dy = -sin(degtorad(launchAngle));
	
	switch(charge){
		case 0:
		spd = spd_zero;
		bigD = 1;
		smallD = 1;
		isCold = true;
		image_blend = c_zero;
		rotSpd = 12;
		
		break;
		
		case 1:
		spd = spd_one;
		bigD = 1.2;
		smallD = 0.8;
		isCold = false;
		image_blend = c_one;
		rotSpd = 15;
		
		break;
		
		case 2:
		spd = spd_two;
		bigD = 1.3;
		smallD = 0.7;
		isCold = false;
		image_blend = c_two;
		rotSpd = 20;
		
		break;
		
		case 3:
		spd = spd_three;
		bigD = 1.4;
		smallD = 0.6;
		isCold = false;
		image_blend = c_three;
		rotSpd = 25;
		
		break;
	}
	
	
	alarm[1] = 60;
}

if(reduceTo != 0 && spd > reduceTo){
	spd--;
} else if (spd == reduceTo){
	reduceTo = 0;
}
 
if (abs(dy) > abs(dx)){
	image_xscale = smallD;
	image_yscale = bigD;
} else {
	image_xscale = bigD;
	image_yscale = smallD;
}

//Definindo Mascara X e Y para Colisões com Tiles

	if(dx > 0) {
		maskx = 48;
	} else {
		maskx = -48;
	}
	
	if(dy > 0) {
		masky = 48;
	} else {
		masky = -48;
	}

//Colisão com outras bolas
inst = instance_place(x + (dx*spd) + maskx/2, y, oBall);
if(inst != noone){
	//Criar novo angulo no impacto
	
	dx = (!hold)? -cos(degtorad(point_direction(x, y, inst.x, inst.y))) : dx;
	inst.dx = (!inst.hold)? -cos(degtorad(point_direction(inst.x, inst.y, x, y))) : inst.dx;
	
	dy = (!hold)? sin(degtorad(point_direction(x, y, inst.x, inst.y))) : dy;
	inst.dy = (!inst.hold)? sin(degtorad(point_direction(inst.x, inst.y, x, y))) : inst.dy;
	
	if(charge < inst.charge && (!hold && !inst.hold)){
		charge = inst.charge;
		chargeExchange = true;
	}else if(charge > inst.charge && (!hold && !inst.hold)){
		inst.charge = charge;
		inst.chargeExchange = true;
	}
}

inst = instance_place(x, y + (dy * spd) + masky/2, oBall);
if(inst != noone){
	
	dx = (!hold)? -cos(degtorad(point_direction(x, y, inst.x, inst.y))) : dx;
	inst.dx = (!inst.hold)? -cos(degtorad(point_direction(inst.x, inst.y, x, y))) : inst.dx;
	
	dy = (!hold)? sin(degtorad(point_direction(x, y, inst.x, inst.y))) : dy;
	inst.dy = (!inst.hold)? sin(degtorad(point_direction(inst.x, inst.y, x, y))) : inst.dy;
	
	if(charge < inst.charge && (!hold && !inst.hold)){
		charge = inst.charge;
		chargeExchange = true;
	} else if(charge > inst.charge && (!hold && !inst.hold)){
		inst.charge = charge;
		inst.chargeExchange = true;
	}
}

if(chargeExchange){
	
		switch(charge){
		case 0:
		spd = spd_zero;
		bigD = 1;
		smallD = 1;
		isCold = true;
		image_blend = c_zero;
		rotSpd = 12;
		
		break;
		
		case 1:
		spd = spd_one;
		bigD = 1.2;
		smallD = 0.8;
		isCold = false;
		image_blend = c_one;
		rotSpd = 15;
		
		break;
		
		case 2:
		spd = spd_two;
		bigD = 1.3;
		smallD = 0.7;
		isCold = false;
		image_blend = c_two;
		rotSpd = 20;
		
		break;
		
		case 3:
		spd = spd_three;
		bigD = 1.4;
		smallD = 0.6;
		isCold = false;
		image_blend = c_three;
		rotSpd = 25;
		
		break;
	}
	
	alarm[1] = 60;
	alarm[2] = 5*60;
	chargeExchange = false;
}

//Colisão com Tiles em X e em Y

	if(tilemap_get_at_pixel(tilemap, x + (dx*spd) + maskx, y) != 1){
		x += dx*spd;
	} else{
		
		if(changeMovement){
			dx = cos(degtorad(angle));
			dy = -sin(degtorad(angle));
			changeMovement = false;
		} 
		
		dx *= -1;
		
		//image_angle = 0;
		image_xscale = 0.7;
		image_yscale = 1.4;
	}

	if(tilemap_get_at_pixel(tilemap, x, y + (dy * spd) + masky) != 1){
		y += dy*spd;
	} else{
		
		if(changeMovement){
			dx = cos(degtorad(angle));
			dy = -sin(degtorad(angle));
			changeMovement = false;
		} 
		
		dy *= -1;
		
		//image_angle = 0;
		image_xscale = 1.4;
		image_yscale = 0.7;
	}

	if(dx > 0 && !hold && !launched){
		image_angle -= rotSpd;
	}
	else if (dx < 0 && !hold && !launched){
		image_angle += rotSpd;
	}
launched = false;

//show_debug_message("Ang: "+ string(angle) + " / " + "Dx: " + string(dx) + " / Dy: " + string(dy) + "/" + "Alarm 2: " + string(alarm_get(2)));
//show_debug_message("Vars: " + string(charge) + "/" + string(spd) + "/" + string(bigD) + "/" + string(smallD) + "/" + string(isCold));

//show_debug_message(string(alarm_get(2)));
//show_debug_message(string(tilemap_get_at_pixel(tilemap, x + (dx*spd) + maskx, y)))