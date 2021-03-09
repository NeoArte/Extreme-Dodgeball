/// @description Nova Direção
// You can write your code in this editor

if(angle >= 0 && angle <= 90){ //Se entra 0 - 90
	angle = random_range(0, 90);  //Muda para 0-90
	
} else if (angle > 90 && angle <= 180){ //Se entre 90-180
	angle = random_range(90, 180); //Muda para 90-180
	
} else if (angle > 180 && angle <= 270){ //Se entre 180-270
	angle = random_range(180, 270); //Muda para entre 180-270
	
} else if (angle > 270 && angle <= 360){ //Se entre 270-359(360)
	angle = random_range(270, 359); //Muda para entre 270-359(360)
}

changeMovement = true;

alarm[2] = 5*60;

//	  90
//180    0
//   270
