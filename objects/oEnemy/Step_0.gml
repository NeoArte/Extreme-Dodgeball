/// @description Insert description here
// You can write your code in this editor

/*
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
	
	var way = irandom(8)+1;
	if(target.charge > 0){
		//Ponto a alguma direção do jogador ou da bola
		
		//1 2 3
		//4 X 5
		//6 7 8
		if(runningAway == false){
			runningAway = true;
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
	} else{
		runningAway = false;
		goX = target.x;
		goY = target.y;
	}
	
	show_debug_message(string(way) + ": "+ string(goX) + "/" + string(goY))
	angle = point_direction(x, y, goX, goY);
	
	dx = cos(degtorad(angle));
	dy = -sin(degtorad(angle));
	
	
} else if(runningAway == false){
	
	goX = x;
	goY = y + 128;
	
	angle = 270;
	dx = cos(degtorad(angle));
	dy = 1;
}

if(tilemap_get_at_pixel(tilemap, goX, y) != 0
|| tilemap_get_at_pixel(tilemap, x, goY) != 0){
	runningAway = false;
}
*/

if(state == States.Idle){
	#region Idle

	
	changeTimer++;
	if(changeTimer >= 30*1){
		changeTimer = 0;
		state = States.Wander;
	}
	
	with(oBall){
		
		//Vai procurar uma bola em uma determinada distancia (y > ?)
		//Caso não estiver com algum objetivo, se torna o objetivo.
		//Se não vai ver se está mais próxima que o objetivo atual, se sim se torna o objetivo.
		//Não vai ser testado contra si mesmo, apenas atualiza a distancia até ele, objetivo.
		
		if(y > oArenaCenter.y - 32 && distance_to_object(other) < 64){
			
			//show_debug_message(string(other.distanceToTarget));
			
			if(other.target == noone){ 
				other.target = id;
				other.distanceToTarget = distance_to_object(other);
			}
			else if(id != other.target){
				if(other.distanceToTarget > distance_to_object(other)){
					other.target = id;
					other.distanceToTarget = distance_to_object(other);
				} 
			} else {
			
				other.distanceToTarget = distance_to_object(other);
			}
		} else {
			other.target = (other.target == id)? noone : other.target;
		}
	}
	
	if(instance_exists(target)){ //Se tiver detectado uma bola
		
		//Vai pegar se estiver fria ou fugir se estiver quente
		state = (target.charge == 0)? States.Catch : state;
		
	}
	
	
	
	#endregion
}
else if (state == States.Wander){
	#region Wander
	
	changeTimer++;
	if(changeTimer >= 60*7){
		changeTimer = 0;
		state = States.Idle;
	}
	
	with(oBall){
		
		//Vai procurar uma bola em uma determinada distancia (y > ?)
		//Caso não estiver com algum objetivo, se torna o objetivo.
		//Se não vai ver se está mais próxima que o objetivo atual, se sim se torna o objetivo.
		//Não vai ser testado contra si mesmo, apenas atualiza a distancia até ele, objetivo.
		
		if(y > oArenaCenter.y - 32 && distance_to_object(other) < 32){
			
			//show_debug_message(string(other.distanceToTarget));
			
			if(other.target == noone){ 
				other.target = id;
				other.distanceToTarget = distance_to_object(other);
			}
			else if(id != other.target){
				if(other.distanceToTarget > distance_to_object(other)){
					other.target = id;
					other.distanceToTarget = distance_to_object(other);
				} 
			} else {
			
				other.distanceToTarget = distance_to_object(other);
			}
		} else {
			other.target = (other.target == id)? noone : other.target;
		}
	}
	
	if(instance_exists(target)){ //Se tiver detectado uma bola
		
		//Vai ir pegar se estiver fria ou fugir se estiver quente
		state = (target.charge == 0)? States.Catch : state;
		
	}
	
	//Essa região aqui no estado de Wander determina como irá se mover quando não tem uma bola no campo.
	//Usando um random_range irá simplesmente se mover aleatoriamente dentro do seu campo
	//Também é possivel definir pontos pré-definidos (pode ajudar o jogador a perceber a padrões)
	if((goX == 0 || goY == 0)
	|| distance_to_point(goX, goY) < spd + spd/2){
		
		goX = irandom_range(128, room_width - 128);
		goY = irandom_range(oArenaCenter.y + 128, room_height - 128);
		angle = point_direction(x, y, goX, goY);
		dx = cos(degtorad(angle));
		dy = -sin(degtorad(angle));
	}
	
	
	#endregion
}
else if (state == States.Catch){
	#region Catch
	
	if(instance_exists(target)){
		
		goX = target.x;
		goY = target.y;
		
		angle = point_direction(x, y, goX, goY);
		dx = cos(degtorad(angle));
		dy = -sin(degtorad(angle));
		
		if(distance_to_object(target) < 24 && holdTarget == false){
			//Pega a bola, vai para o modo de lançar.
			target.owner = id;
			target.hold = true;
			holdTarget = true;
			state = States.Throw;
			
		} else if (target.y < oArenaCenter.y){
			
			//Para de seguir a bola e volta para modo de Wander
			target = noone;
			goX = x;
			goY = y;
			state = States.Idle;
		}
		
	}
	
	#endregion
}
else if (state == States.Throw){
	#region Thrown
	
	if(throwPath == -1){throwPath = irandom(3);}
	
	switch(throwPath){
		
	case(0):
	goX = oArenaCenter.x + 512;
	goY = oArenaCenter.y + 128;
	break;
	
	case(1):
	goX = oArenaCenter.x - 512;
	goY = oArenaCenter.y + 512;
	break;
		
	case(2):
	goX = oArenaCenter.x;
	goY = oArenaCenter.y + 256;
	break;
		
	case(3):
	goX = x;
	goY = y;
	break;
		
	}
	
	angle = point_direction(x, y, goX, goY);
	dx = cos(degtorad(angle));
	dy = -sin(degtorad(angle));
	
	if(distance_to_point(goX, goY) < spd * 2){
		
		angle = point_direction(x, y, oPlayer.x, oPlayer.y);
		
		if(throwCharge == 0){throwCharge = irandom(2) + 1;}
		
		if(target.charge >= throwCharge){
			target.hold = false;
			holdTarget = false;
		
			target.launchAngle = angle;
			target.launched = true;
		
			target.owner = noone;
			target = noone;
		
			state = States.Idle;
		
			throwPath = -1;
			throwCharge = 0;
		
			goX = x;
			goY = y;
		}
	}
	//show_debug_message(string(throwPath));
	//show_debug_message("X: " + string(x) + "/" + string(goX));
	//show_debug_message("Y: " + string(y) + "/" + string(goY));
	
	
	#endregion
}


//show_debug_message(string(state));



if(distance_to_point(goX, goY) > spd + 2){
	
	if(tilemap_get_at_pixel(tilemap, x + (dx * spd), y) == 0){
		x += dx * spd;
	}
	
	if(tilemap_get_at_pixel(tilemap, x, y + (dy * spd)) == 0){
		y += dy * spd;
	}
} 

image_angle = angle;

//show_debug_message("Dx: " + string(dx));
//show_debug_message("Dy: " + string(dy));
