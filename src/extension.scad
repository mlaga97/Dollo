include <include.scad>;
include <globals.scad>;

/*******************************************************************************
*****                                Configuration                              *****
*******************************************************************************/

metal_rod_size = 9;
support = true;

/*******************************************************************************
*****                                    Build                                  *****
*******************************************************************************/

/* Uncomment to test */
//units = 4;

extension();

/*******************************************************************************
*****                                  Modules                                 *****
*******************************************************************************/

module extension() {
    module cutout() {
        translate([0,15,-16])
            cylinder(h=35, d=18);
        *rotate([0,90,0])
            translate([0,15,-16])
                cylinder(h=35, d=18);
    }
    
    if (support==true) {
        translate([0,0,5/2]) cylinder(h=5, d=6, center=true);
        translate([30,0,5/2]) cylinder(h=5, d=6, center=true);
        translate([0,units*30,5/2]) cylinder(h=5, d=6, center=true);
        translate([30,units*30,5/2]) cylinder(h=5, d=6, center=true);
    }
    
    difference(){
        // Body
        cube([30,30*units,30]);
        
        // Tie Ends
        translate([15,0,15]) rotate([0,45,0]) tie_end();
        translate([15,units*30,15]) rotate([0,45,0]) rotate([0,0,180]) tie_end();
        
        // Longitudinal Hole
        translate([15,15,15]) rotate([90,0,0]) cylinder(h=5000, d= metal_rod_size, center=true);
        
        // Allow Shorter Lengths
        if (units > 1) {
            
            // Ties Along Length
            for (y = [-1:units-2]) {
                difference() {
                    // Holes for Ties
                    translate([15, (y*30)+15, 15]){
                        wrap();
                        translate([15,30,0]) cube([5,5,50],center=true);
                        translate([-15,30,0]) cube([5,5,50],center=true);
                        translate([0,30,15]) cube([50,5,5],center=true);
                        translate([0,30,-15]) cube([50,5,5],center=true);
                    }
                    
                    // Tie Stopper
                    union(){
                        translate([15.5,y*30+30,0]) cube([.5,30,30]);
                        rotate([0,90,0])
                            translate([-15.5,y*30+30,0]) cube([.5,30,30]);
                    }
                }
            }
            
            // Cutout Holes
            for (y = [0:units-2]) {
                translate([15, (y*30)+15, 15])
                    cutout();
            }
        } else {
            // Cutout Hole
            translate([15, 0, 15])
                cutout();
        }
        
        // Holes
        if(holes==true) {
            rotate([0,90,0]) translate([-15,7,0]) cylinder(h=40, d=6, $fn=20);
            rotate([0,90,0]) translate([-15,0+(units*30)-7,0]) cylinder(h=40, d=6, $fn=20);
            translate([15,7,0]) cylinder(h=40, d=6, $fn=20);
            translate([15,0+(units*30)-7,0]) cylinder(h=40, d=6, $fn=20);
        }
    }
}