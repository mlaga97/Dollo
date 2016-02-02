include <include.scad>;
include <globals.scad>;
use <GDMUtils.scad>
use <publicDomainGearV1.1.scad>
use <sliders.scad>

/*******************************************************************************
*****                                Configuration                              *****
*******************************************************************************/

obj_height = 40;
tail_depth = 8;
diameter = 4;   // Configure Roundness
width = 30;

/*******************************************************************************
*****                                    Build                                  *****
*******************************************************************************/

/* Uncomment to test */
//units = 6;

/* Leave ONE of these uncommented */
modular_rack();

/*******************************************************************************
*****                                  Modules                                 *****
*******************************************************************************/

// Rounded Cube For Rails
module rounded_cube(width,depth,height) {
    hull() {
        translate([width/2-diameter/2,depth/2-diameter/2,height/2-diameter/2]) sphere(d=diameter);
        translate([width/2-(diameter/2),depth/2-(diameter/2),-height/2+(diameter/2)]) sphere(d=diameter);
        translate([-width/2+diameter/2,depth/2-diameter/2,height/2-diameter/2]) sphere(d=diameter);
        translate([-width/2+(diameter/2),depth/2-(diameter/2),-height/2+(diameter/2)]) sphere(d=diameter);
        
        translate([width/2-diameter/2,-depth/2+diameter/2,height/2-diameter/2]) sphere(d=diameter);
        translate([width/2-(diameter/2),-depth/2+(diameter/2),-height/2+(diameter/2)]) sphere(d=diameter);
        translate([-width/2+diameter/2,-depth/2+diameter/2,height/2-diameter/2]) sphere(d=diameter);
        translate([-width/2+(diameter/2),-depth/2+(diameter/2),-height/2+(diameter/2)]) sphere(d=diameter);
    }
}

// Tie Point Template
module tie_template(center_width=1,unit_scale=30) {
    union() {
        translate([0,tail_depth,center_width/2])
            rotate([0,0,180])
                male_dovetail(height=unit_scale);
        mirror([0,0,1])
            translate([0,tail_depth,center_width/2])
                rotate([0,0,180])
                    male_dovetail(height=unit_scale);
    }
}

// Herringbone Rack Helper
module proto_rack() {
    module half_rack() {
        intersection() {
            union() {
                rotate(a=[0,-25,0]) {
                    linear_extrude(height = obj_height*5, center = true, convexity = 10)
                    import (file = "rack.dxf", layer = "Layer_1");
                }
            }
                translate([0, 0, obj_height/4*-1]) cube(center = true, [31, 50, obj_height/2]);
        }
    }
    
    module full_rack() {
        intersection() {
            union() {
                mirror([0,0,1])
                    half_rack();
                half_rack();
            }
            union() {
                cube(center = true, [20, 30, obj_height-8]);
            }
        }
    }
    
    // Build Rack Base
    for(rack_length=[1:units]) {
        difference(){
            translate([30*rack_length-15,6,0]) cube([30,8,width], center=true);
        }
    }
}

// Modular Herringbone Rack
module modular_rack() {
    translate([0,0,2])
        rotate([-90,0,0])
            intersection() {
                // Add Rails
                translate([units*30/2,0,0])
                    rounded_cube(30*units,20,width,$fn=50);
                
                difference() {
                    // Rack Body
                    translate([0,0,0])
                        proto_rack(units=units); // Extra room to play with

                    // Add Ties
                    for(rack_length=[1:units]) {
                        translate([30*rack_length-15,2,0])
                            tie_template();
                    }
                }
            }
    
    // Rack
    translate([units*15,10+3,5])
        herringbone_rack(l=units*30, h=10, tooth_size=5);
    
    // Rail
    translate([units*15,-width/2+5+4,6])
        rotate([0,0,90])
            rail(l=units*30, w=10, h=12);
}


module herringbone_rack(l=100, h=10, w=10, tooth_size=5, CA=30)
{
    gear_backlash=0.075;
    
    $fa = 2;
    $fs = 2;
    
	left(tooth_size/2) {
		zflip_copy() {
			skew_xy(xang=CA) {
				intersection() {
					up(h/4-0.01) {
						left(l/2-tooth_size/2) {
							rack(
								mm_per_tooth=tooth_size,
								number_of_teeth=floor(l/tooth_size),
								thickness=h/2+0.005,
								height=w,
								pressure_angle=20,
								backlash=gear_backlash
							);
						}
					}
					cube(size=[l, h*3, h*3], center=true);
				}
			}
		}
	}
}
