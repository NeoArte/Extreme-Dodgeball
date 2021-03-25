// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_color(c_red);
if(instance_exists(target)){draw_arrow(x, y, target.x, target.y, 64);}
draw_set_color(c_blue);
draw_arrow(x, y, goX, goY, 64);