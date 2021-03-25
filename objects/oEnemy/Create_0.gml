/// @description Insert description here
// You can write your code in this editor

enum States {
	Idle,
	Wander,
	Catch,
	Throw,
	Run
}

state = States.Idle;
changeTimer = 0;

tilemap = layer_tilemap_get_id("Collision");

//Movement
goX = x;
goY = y;
dx = 0;
dy = 0;
angle = 0;

spd = 12;
angle = 0;


throwPath = -1;
throwCharge = 0;


tilemap = layer_tilemap_get_id("Collision");

runningAway = false;
target = noone;
holdTarget = false;
distanceToTarget = 0;
