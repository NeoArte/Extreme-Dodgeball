/// @description Insert description here
// You can write your code in this editor

with oBall{
	if(charge && !hold){
		switch(charge){
			case 1: 
				part_type_color1(global.ptBasic, make_color_rgb(236, 125, 16)); 
				part_type_size(global.ptBasic, 1, 1, 0, 0);
				break;
			
			case 2: 
				part_type_color1(global.ptBasic, make_color_rgb(252, 47, 0));
				part_type_size(global.ptBasic, 1.5, 1.5, 0, 0);
				break;
			
			case 3: 
				part_type_color1(global.ptBasic, make_color_rgb(236, 8, 104));
				part_type_size(global.ptBasic, 2, 2, 0, 0);
				break;
		}
		part_particles_create(global.partSystem, x, y, global.ptBasic, 5);
		
		part_type_color1(global.pShadow, image_blend);
		part_particles_create(global.partSystem, x, y, global.pShadow, 5);
	}
}