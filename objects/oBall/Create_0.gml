/// @description Insert description here
// You can write your code in this editor

randomize();


//Color
image_blend = c_white;

//Colors
c_zero = make_color_rgb(255, 255, 255);
c_one = make_color_rgb(245, 150, 17);
c_two = make_color_rgb(219, 80, 15);
c_three = make_color_rgb(245, 15, 4);


//Start Parameters
owner = noone;
angle = random(360);
dx = cos(degtorad(angle));
dy = -sin(degtorad(angle));

maskx = 0;
masky = 0;

//Change Direction ('cuz of time)

alarm[2] = 5 * 60;
changeMovement = false;


//Movement

spd = 20;
bigD = 1;
smallD = 1;
rotSpd = 10;
charge = 0;
chargeTime = 0;
chargeTimeLimit = 25;
lifeTime = 60;

spd_zero = 20;
spd_one = 35;
spd_two = 65;
spd_three = 80;
reduceTo = 0;

hold = false;
isCold = true;

xToPlayer = 128;
yToPlayer = 128;
launched = false;
launchAngle = 0;

//Collision With Other Balls

inst = 0;

chargeExchange = false;

//UI
scr = 0;
time = 0;
alarm[0] = 60;

//Collision Tiles

tilemap = layer_tilemap_get_id("Collision");
