include <include.scad>;
include <globals.scad>;

/*******************************************************************************
*****                                Configuration                              *****
*******************************************************************************/

obj_height = 40;
tail_depth = 8;
diameter = 4;   // Configure Roundness

/*******************************************************************************
*****                                    Build                                  *****
*******************************************************************************/

/* Uncomment to test */
//units = 3;

/* Leave ONE of these uncommented */
//modular_rack();
aligned_modular_rack();

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
    
    // Build Rack
    // TODO: Fix DXF file to eliminate this hack
    for(rack_length=[1:units*30/20+1]) {
        translate([rack_length*20-15,0,0])
            full_rack();
    }
    
    // Build Rack Base
    for(rack_length=[1:units]) {
        difference(){
            translate([30*rack_length-15,6,0]) cube([30,8,40], center=true);
        }
    }
}

// Modular Herringbone Rack
module modular_rack() {
    intersection() {
        // Add Rails
        translate([units*30/2,0,0])
            rounded_cube(30*units,20,40,$fn=50);
        
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
}

// Self-Aligning Herrringbone Rack
module aligned_modular_rack() {
    intersection() {
        // Rails
        translate([units*30/2,0,0])
            rounded_cube(30*units+30,20,40,$fn=50);
        
        intersection() {
            translate([-7.5,0,0])
                difference() {
                    // Rack Body
                    translate([-30,0,0])
                        proto_rack(units=units+2); // Extra room to play with

                    // Add Ties
                    for(rack_length=[1:units]) {
                        translate([30*rack_length,2,0])
                            tie_template();
                    }
                }
            
            // Allow Chaining
            difference() {
                union(){
                    // Base Shape
                    translate([30*units/2+15,0,0])
                        rounded_cube(30*units,20,40,$fn=50);

                    // Pointy Head
                    translate([0,-5,0])
                        rotate([0,25,0])
                            cube([30,30,30]);
                    mirror([0,0,1])
                        translate([0,-5,0])
                            rotate([0,25,0])
                                cube([30,30,30]);
                }

                // Tail Piece
                union(){
                    translate([30*units,-5,0])
                        rotate([0,25,0])
                            cube([units*30,30,units*30]);
                    mirror([0,0,1])
                        translate([30*units,-5,0])
                            rotate([0,25,0])
                                cube([units*30,30,units*30]);
                }
            }
        }
    }
}