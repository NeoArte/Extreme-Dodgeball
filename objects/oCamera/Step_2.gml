/// @description Insert description here
// You can write your code in this editor

#macro view view_camera[0]

camera_set_view_size(view, view_width, view_height);

camera_set_view_pos(view, x - view_width/2, y - view_height/2);