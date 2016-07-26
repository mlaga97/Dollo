use <../libraries/publicDomainGearV1.1.scad>;
include <../libraries/polyScrewThread_r1.scad>;

include <./config.scad>;
include <../config.scad>;

epsilon = 0.1;

screw_gear();

module screw_gear() {
    difference() {
        union() {
            cylinder(d=22.5-1, h=5);

            translate([0,0,5])
                union() {
                    herringbone(gear_thickness=10, gear_twist=20, mount_hole_diameter=15, gear_mm_per_tooth = 5, teeth_count = teeth3);
                    cylinder(d=15.5,h=10);
                }

            translate([0,0,15])
                cylinder(d=22.5-1, h=5);
        }
        
        t_od=12.5;    // Thread outer diameter
        t_st=2.5;   // Step/traveling per turn
        t_lf=55;    // Step angle degrees
        t_ln=20;    // Length of the threade section
        t_rs=PI/2;  // Resolution
        t_se=1;     // Thread ends style
        t_gp=0.4;//0.5;     // Gap between nut and bolt threads
        translate([0,0,0])
            screw_thread(t_od+t_gp, t_st, t_lf, t_ln, t_rs, t_se);
        
        translate([0,0,-5+2])
            cylinder(h=5, d1=20, d2=10);
        translate([0,0,20-2])
            cylinder(h=5, d1=10, d2=20);
    }
}
module crank_gear() {
    difference() {
        union() {
            cylinder(d=22.5, h=6);

            translate([0,0,6])
                union() {
                    herringbone(gear_thickness=10, gear_twist=20, mount_hole_diameter=15, gear_mm_per_tooth = 5, teeth_count = teeth3);
                    cylinder(d=15.5,h=10);
                }

            translate([0,0,16])
                cylinder(d=22.5, h=25);
        }
        
        translate([0,0,-epsilon])
            cylinder(d=6, h=16+25+2*epsilon);
        translate([0,0,4.5+25])
            rotate([90,0,0])
                cylinder(d=9,h=30,center=true);
        translate([-6,0,-epsilon])
            cylinder(d=3, h=16+25+2*epsilon,$fn=6);
        translate([6,0,-epsilon])
            cylinder(d=3, h=16+25+2*epsilon,$fn=6);
    }
}

module drive_gear() {
    difference() {
        union() {
            cylinder(d=22.5, h=6);

            translate([0,0,6])
                union() {
                    herringbone(gear_thickness=10, gear_twist=20, mount_hole_diameter=15, gear_mm_per_tooth = 5, teeth_count = teeth3);
                    cylinder(d=15.5,h=10);
                }

            translate([0,0,16])
                cylinder(d=22.5, h=6);
        }
        
        translate([0,0,-epsilon])
            cylinder(d=5.5, h=22+2*epsilon);
        
        translate([-3/2+5.5,-6/2,-epsilon])
            cube([3,6,22+2*epsilon]);
        
        translate([0,0,3])
            rotate([0,90,0])
                cylinder(d=3.5, h=15);
        
        translate([0,0,22-3])
            rotate([0,90,0])
                cylinder(d=3.5, h=15);
    }
}

module idler_gear() {
    difference() {
        union() {
            herringbone(gear_thickness=10, gear_twist=5.5, mount_hole_diameter = 50, gear_mm_per_tooth = 5, teeth_count = teeth1);
            cylinder(d=62.2, h=10);
        }
        
        translate([0,0,-epsilon])
            cylinder(d=3.5,h=10+2*epsilon,$fn=6);
    }
}
