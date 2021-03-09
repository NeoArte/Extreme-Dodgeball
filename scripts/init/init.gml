// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
	#region //Particle Types

	//Basic Particle
	var _p = part_type_create();
	part_type_shape(_p, pt_shape_explosion);
	part_type_life(_p, 10, 10);
	part_type_alpha2(_p, 0.1,0)
	part_type_color3(_p, c_red, c_orange, c_gray);
	part_type_size(_p, 1, 2, 0, 0);
	part_type_gravity(_p, 1, 90);
	
	global.ptBasic = _p;
	
	//Trail - Shadow
	var _p = part_type_create();
	part_type_life(_p, 10, 10);
	part_type_sprite(_p, sBall, 0, 0, 1);
	part_type_size(_p, 1, 1, 0, 0);
	part_type_alpha1(_p, 0.01);
	part_type_color1(_p, make_color_rgb(255, 72, 0));
	
	global.pShadow = _p;
	
	#endregion