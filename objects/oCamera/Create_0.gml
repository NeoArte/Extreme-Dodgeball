/// @description Insert description here
// You can write your code in this editor

//Resolution

view_width = 1920/1.4;
view_height = 1080/1.4;
window_scale = 0.9;

window_set_size(view_width * window_scale, view_height * window_scale);

alarm[0] = 1;

surface_resize(application_surface, view_width * window_scale, view_height * window_scale);