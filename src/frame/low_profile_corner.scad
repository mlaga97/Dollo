include <../config.scad>;

/*******************************************************************************
*****                                Configuration                              *****
*******************************************************************************/

metal_rod_size = 9;
support = true;

/*******************************************************************************
*****                                    Build                                  *****
*******************************************************************************/

/* Uncomment to test */
units = 1;

//extension();
corner();

/*******************************************************************************
*****                                  Modules                                 *****
*******************************************************************************/

module corner() {
    difference() {
        union() {
            cube([30,60,30]);
            cube([60,30,30]);
        }
        
        // Tie Ends
        translate([2*30,15,15]) rotate([0,45,90]) tie_end();
        translate([15,2*30,15]) rotate([0,45,0]) rotate([0,0,180]) tie_end();
        translate([15,15,0]) rotate([90,0,45]) tie_end();
        translate([15,15,30]) rotate([90,0,45]) rotate([0,0,180]) tie_end();
        
        // Wraps
        translate([0,30,0])
            difference() {
                // Holes for Ties
                translate([15, -15, 15]){
                    wrap(depth=30+0.1);
                    translate([15,30,0]) cube([5,5,50],center=true);
                    translate([-15,30,0]) cube([5,5,50],center=true);
                    translate([0,30,15]) cube([50,5,5],center=true);
                    translate([0,30,-15]) cube([50,5,5],center=true);
                }
                
                // Tie Stopper
                union(){
                    translate([12.5,0,0]) cube([5,30,30]);
                    rotate([0,90,0])
                        translate([-17.5,0,0]) cube([5,30,30]);
                }
            }
        
        rotate([0,0,-90])
            translate([-30,30,0])
                difference() {
                    // Holes for Ties
                    translate([15, -15, 15]){
                        wrap();
                        translate([15,30,0]) cube([5,5,50],center=true);
                        translate([-15,30,0]) cube([5,5,50],center=true);
                        translate([0,30,15]) cube([50,5,5],center=true);
                        translate([0,30,-15]) cube([50,5,5],center=true);
                    }
                    
                    // Tie Stopper
                    union(){
                        translate([12.5,0,0]) cube([5,30,30]);
                        rotate([0,90,0])
                            translate([-17.5,0,0]) cube([5,30,30]);
                    }
                }
        
        // Holes
        translate([15,15,-10])
            rotate([0,0,0])
                cylinder(d=metal_rod_size, h=50);
        translate([15,-10,15])
            rotate([-90,0,0])
                cylinder(d=metal_rod_size, h=80);
        translate([-10,15,15])
            rotate([0,90,0])
                cylinder(d=metal_rod_size, h=80);
    }
    
    // Support
    translate([0,0,5/2]) cylinder(h=5, d=6, center=true);
    translate([30,30,5/2]) cylinder(h=5, d=6, center=true);
    translate([60,0,5/2]) cylinder(h=5, d=6, center=true);
    translate([60,30,5/2]) cylinder(h=5, d=6, center=true);
    translate([0,60,5/2]) cylinder(h=5, d=6, center=true);
    translate([30,60,5/2]) cylinder(h=5, d=6, center=true);
}

module extension() {
    module cutout() {
        translate([0,15,-16])
            cylinder(h=35, d=18);
        *rotate([0,90,0])
            translate([0,15,-16])
                cylinder(h=35, d=18);
    }
    
    if (support==true) {
        for( y = [0:units]) {
            translate([0,y*30,5/2]) cylinder(h=5, d=6, center=true);
            translate([30,y*30,5/2]) cylinder(h=5, d=6, center=true);
        }
    }
    
    difference(){
        // Body
        cube([30,30*units,30]);
        
        // Tie Ends
        translate([15,0,15]) rotate([0,45,0]) tie_end();
        translate([15,units*30,15]) rotate([0,45,0]) rotate([0,0,180]) tie_end();
        
        // Longitudinal Hole
        translate([15,15,15]) rotate([90,0,0]) cylinder(h=5000, d= metal_rod_size, center=true);
        
        
        for( y = [0:units-1]) {
            translate([30,15+y*30,15]) rotate([0,45,90]) tie_end();
            translate([0,15+y*30,15]) rotate([0,45,90]) rotate([0,0,180]) tie_end();
            
            translate([15,15+y*30,0]) rotate([90,0,45]) tie_end();
            translate([15,15+y*30,30]) rotate([90,0,45]) rotate([0,0,180]) tie_end();
        }
        
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
                        translate([12.5,y*30+30,0]) cube([5,30,30]);
                        rotate([0,90,0])
                            translate([-17.5,y*30+30,0]) cube([5,30,30]);
                    }
                }
            }
            
            for( y = [1:units-1]) {
                translate([15,y*30,-5]) cylinder(h=40, d=10);
                translate([-5,y*30,15]) rotate([0,90,0]) cylinder(h=40, d=10);
            }
            
        } else {
            *difference() {
                // Holes for Ties
                translate([15, -15, 15]){
                    wrap();
                    translate([15,30,0]) cube([5,5,50],center=true);
                    translate([-15,30,0]) cube([5,5,50],center=true);
                    translate([0,30,15]) cube([50,5,5],center=true);
                    translate([0,30,-15]) cube([50,5,5],center=true);
                }
                
                // Tie Stopper
                union(){
                    translate([12.5,y*30+30,0]) cube([5,30,30]);
                    rotate([0,90,0])
                        translate([-17.5,y*30+30,0]) cube([5,30,30]);
                }
            }
            
            
            translate([15,15,-5]) cylinder(h=40, d=10);
            translate([-5,15,15]) rotate([0,90,0]) cylinder(h=40, d=10);
        }
    }
}