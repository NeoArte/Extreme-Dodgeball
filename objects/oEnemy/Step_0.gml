/// @description Insert description here
// You can write your code in this editor
target = instance_nearest(x, y, oBall);
target = (distance_to_object(target) < 128*3)? target : noone;

if(target != noone) {
	goX = target.x;
	goY = target.y;
} else {
	goX = x;
	goY = y;
}





//Distancia X

if(distance_to_point(goX, goY) > spd * 2){
	if(x < goX){
		x += spd;
	} else if(x > goX){
		x -= spd;
	}

	//Distancia Y
	if(y < goY){
		y += spd;
	} else if (y > goY){
		y -= spd;
	}
}