/// @description Timer para a bola esfriar em 1 nivel. 
// You can write your code in this editor

if(!isCold){
	charge--;
	switch(charge){
		case 0:
		reduceTo = spd_zero;
		bigD = 1;
		smallD = 1;
		isCold = true;
		image_blend = c_zero;
		rotSpd = 12;
		
		break;
		
		case 1:
		reduceTo = spd_one;
		bigD = 1.2;
		smallD = 0.8;
		isCold = false;
		image_blend = c_one;
		rotSpd = 15;
		
		break;
		
		case 2:
		reduceTo = spd_two;
		bigD = 1.3;
		smallD = 0.7;
		isCold = false;
		image_blend = c_two;
		rotSpd = 20;
		
		break;
		
	}
	alarm[1] = 60;
}