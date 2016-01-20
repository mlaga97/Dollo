include <include.scad>;
include <globals.scad>;
include <gears.scad>;

tooth_depth = (sqrt(18)/2)+2;
units = 2;

module twist_corner() {
    difference() {
        translate([0,135,0])
            intersection() {
                rotate([0,0,45])
                    difference() {
                        // Main Cube
                        translate([-90-tooth_depth,-90-tooth_depth,units*15]) rotate([0,0,45]) cube([45,45,units*30], center=true);

                        // Frame Cut
                        translate([-45-90,-45-90,-5])
                            cube([45,45,30*units+10]);

                        // Twist
                        rotate([0,0,45+90])
                            translate([0,35+50,-5])
                                twist($fn=60, twist_height_units=units*3+1);

                        // Holes
                        translate([21.5-95,21.5-95,0]) rotate([90,0,90]) {
                            for(height = [1:units]) {
                                translate([-16.5+0.5,(height-1)*30+15,-30]) rotate([0,0,-90]) mirror([0,0,1]) male_dovetail();
                                translate([-30,(height-1)*30+15,-16.5+0.5]) rotate([-90,180,-90]) mirror([0,0,1]) male_dovetail();
                            }
                            
                            rotate([90,0,0]) translate([-35,-1,-30*units-5]) cylinder(h=30*units+10, r=9);
                            mirror([1,0,-1]) rotate([90,0,0]) translate([-35,-1,-30*units-5]) cylinder(h=30*units+10, r=9);
                        }
                    }
                
                // Bounding Box
                translate([0,-119,0])    
                    hull() {
                        translate([45/2-1.5,0,-15]) cylinder(h=(units+1)*30, r=3);
                        translate([-45/2+1.5,0,-15]) cylinder(h=(units+1)*30, r=3);

                        translate([45/2-1.5,-50,-15]) cylinder(h=(units+1)*30, r=3);
                        translate([-45/2+1.5,-50,-15]) cylinder(h=(units+1)*30, r=3);
                    }
                    
            }

        // Bottom Dovetails
        translate([10,11,0]) rotate([90,0,0]) male_dovetail(height=25);	
        translate([-10,11,0]) rotate([90,0,0]) male_dovetail(height=25);

        // Top Dovetails
        translate([10,11,30*units+0.01]) rotate([90,180,0]) male_dovetail(height=25);	
        translate([-10,11,30*units+0.01]) rotate([90,180,0]) male_dovetail(height=25);
    }
}
twist_corner();