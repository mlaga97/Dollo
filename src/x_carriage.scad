use <sliders.scad>
use <extension.scad>

length = 52;
rail_offset = -19;
motor_shaft_length = 24;

// Rack Offset
gear_teeth = 8;
rack_tooth_size = 5;
rack_module = rack_tooth_size / 3.1415926535;
rack_pcd = gear_teeth * rack_module;
    
module x_carriage() {
    // Slider
    translate([0,-(rack_pcd/2)+rail_offset,10])
        rotate([0,180,90])
            slider(l=length, base=10, wall=4, slop=0.2);
    
    difference() {
        union() {
            // Motor Mount Plate
            translate([0,0,5+0.15]) {
                intersection() {
                    rotate([0,0,45])
                        cube([42,42,10-0.3],center=true);
                    cube([52,52,10-0.3],center=true);
                }
                translate([0,-rail_offset/2-(rack_pcd/2)+rail_offset+9,0])
                    cube([52,-rail_offset,10-0.3],center=true);
            }
            
            // Retainer Blocks
            translate([-(length-15)/2,2-(rack_pcd/2),-20-20-10])
                cube([length-15,8,25+20+10]);
            translate([-length/2,2-(rack_pcd/2)-30-6,-20-20-10])
                cube([length,6,25+25+10]);
            
            intersection() {
                translate([-(length-15)/2,2-(rack_pcd/2)+8,-20-20-10])
                    cube([length-15,15,25+20+10]);
                translate([-(length-15)/2,2-(rack_pcd/2)+8,-20-20-10])
                    rotate([45,0,0])
                    cube([length-15,50,50]);
                rotate([0,0,45])
                    cube([42,42,100],center=true);
            }
        }
        
        // Motor Mount Holes
        rotate([0,0,45]) {
            cylinder(d=23,h=150,center=true);
            translate([-31/2,31/2]) {
                cylinder(d=3.5,h=15);
                cylinder(d=6.5,h=10,center=true);
            }
            translate([31/2,-31/2]) {
                cylinder(d=3.5,h=15);
                cylinder(d=6.5,h=10,center=true);
            }
            translate([31/2,31/2]) {
                cylinder(d=3.5,h=15);
                cylinder(d=6.5,h=10,center=true);
            }
        }
        
        // Toolhead Mount Holes
        translate([0,0,-50+5]) {
            translate([15,0]) {
                translate([0,-(rack_pcd/2)-34+6])
                    rotate([90,0,0])
                        cylinder(d=3.5,h=10);
                translate([0,-(rack_pcd/2)-34+6+10-3])
                    rotate([90,0,0])
                        cylinder(d=6,h=10,$fn=6);
            }
            translate([-15,0]) {
                translate([0,-(rack_pcd/2)-34+6])
                    rotate([90,0,0])
                        cylinder(d=3.5,h=10);
                translate([0,-(rack_pcd/2)-34+6+10-3])
                    rotate([90,0,0])
                        cylinder(d=6,h=10,$fn=6);
            }
        }
        translate([0,0,-50+5+10]) {
            translate([15,0]) {
                translate([0,-(rack_pcd/2)-34+6])
                    rotate([90,0,0])
                        cylinder(d=3.5,h=10);
                translate([0,-(rack_pcd/2)-34+6+10-3])
                    rotate([90,0,0])
                        cylinder(d=6,h=10,$fn=6);
            }
            translate([-15,0]) {
                translate([0,-(rack_pcd/2)-34+6])
                    rotate([90,0,0])
                        cylinder(d=3.5,h=10);
                translate([0,-(rack_pcd/2)-34+6+10-3])
                    rotate([90,0,0])
                        cylinder(d=6,h=10,$fn=6);
            }
        }
        translate([0,0,-50+5+20]) {
            translate([15,0]) {
                translate([0,-(rack_pcd/2)-34+6])
                    rotate([90,0,0])
                        cylinder(d=3.5,h=10);
                translate([0,-(rack_pcd/2)-34+6+10-3])
                    rotate([90,0,0])
                        cylinder(d=6,h=10,$fn=6);
            }
            translate([-15,0]) {
                translate([0,-(rack_pcd/2)-34+6])
                    rotate([90,0,0])
                        cylinder(d=3.5,h=10);
                translate([0,-(rack_pcd/2)-34+6+10-3])
                    rotate([90,0,0])
                        cylinder(d=6,h=10,$fn=6);
            }
        }
    }
}

rotate([0,180,0]) {
    // Rail as Guide
    %translate([-90,-13-(rack_pcd/2),-12])
        import("y_rack_v2.stl");
    x_carriage();
}
