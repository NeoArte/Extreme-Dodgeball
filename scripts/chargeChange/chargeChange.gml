/// @function				chargeChange(object);
/// @description			Changes the charge variable (and those dependent of it) of a oBall instance.
/// @param {oBall} obj	Instance of oBall.

function changeCharge(obj){

//show_debug_message("Noone: " + string(obj == noone));
if(obj == noone){exit;}
	
switch(obj.charge){
	case 0:
	obj.spd = obj.spd_zero;
	obj.bigD = 1;
	obj.smallD = 1;
	obj.isCold = true;
	obj.image_blend = obj.c_zero;
	obj.rotSpd = 12;
	obj.lifeTime = 1;
	
		
	break;
		
	case 1:
	obj.spd = obj.spd_one;
	obj.bigD = 1.2;
	obj.smallD = 0.8;
	obj.isCold = false;
	obj.image_blend = obj.c_one;
	obj.rotSpd = 15;
	obj.lifeTime = 60;
		
	break;
		
	case 2:
	obj.spd = obj.spd_two;
	obj.bigD = 1.3;
	obj.smallD = 0.7;
	obj.isCold = false;
	obj.image_blend = obj.c_two;
	obj.rotSpd = 20;
	obj.lifeTime = 45;
		
	break;
		
	case 3:
	obj.spd = obj.spd_three;
	obj.bigD = 1.4;
	obj.smallD = 0.6;
	obj.isCold = false;
	obj.image_blend = obj.c_three;
	obj.rotSpd = 25;
	obj.lifeTime = 30;
		
	break;
}

obj.alarm[1] = obj.lifeTime;
	
}