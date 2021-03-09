/// @description Insert description here
// You can write your code in this editor

c_redplayer = make_color_rgb(249, 65, 68);


image_blend = c_redplayer;

angle = 0;

dirx = 0;
diry = 0;
spd = 24;

maskx = 0;
masky = 0;

tilemap = layer_tilemap_get_id("Collision");

enum mouse {
	none
}

ballHolding = noone;
