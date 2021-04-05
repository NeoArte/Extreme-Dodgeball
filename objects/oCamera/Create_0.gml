/// @description Insert description here
// You can write your code in this editor

camera_show_width = room_width;
camera_show_height = room_height;

window_set_size(800, 450);
surface_resize(application_surface, 800, 450);

alarm[0] = 1;

camera_set_view_size(view_camera[0], camera_show_width, camera_show_height);
camera_set_view_pos(view_camera[0], room_width/2 - camera_show_width/2, room_height/2 - camera_show_height/2);