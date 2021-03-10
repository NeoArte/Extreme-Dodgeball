/// @description Insert description here
// You can write your code in this editor
goX = oPlayer.x;
goY = oPlayer.y;

//Distancia X

if(distance_to_object(oPlayer) > spd + 2){
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