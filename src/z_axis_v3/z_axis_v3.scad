use <../libraries/publicDomainGearV1.1.scad>;
include <../libraries/polyScrewThread_r1.scad>;

include <./config.scad>;
include <../config.scad>;

epsilon = 0.1;

layout();

module layout() {
    difference() {
        cube([240,240,30],center=true);
        cube([180,180,35],center=true);
    }

    *translate([0,0,20])
        cube([137.5,137.5,10],center=true);

    teeth1=41;
    teeth2=41;
    teeth3=12;

    herringbone(gear_thickness=10, gear_twist=-5.5, gear_mm_per_tooth = 5, teeth_count = teeth1);

    translate([(2.5*teeth1/3.14)+(2.5*teeth3/3.14),0])
        rotate([0,0,(360/20)*0.5])
            herringbone(gear_thickness=10, gear_twist=20, gear_mm_per_tooth = 5, teeth_count = teeth3);

    rotate([0,0,45]) {
        translate([(2.5*teeth1/3.14)+(2.5*teeth2/3.14),0])
            rotate([0,0,(360/20)])
                herringbone(gear_thickness=10, gear_twist=0, gear_mm_per_tooth = 5, teeth_count = teeth2);

        translate([(2.5*teeth1/3.14)+(5*teeth2/3.14)+(2.5*teeth3/3.14),0])
            rotate([0,0,(360/20)]) {
                herringbone(gear_thickness=10, gear_twist=0, gear_mm_per_tooth = 5, teeth_count = teeth3);
                translate([0,0,10])
                    cylinder(d=22.5, h=5);
                translate([0,0,15])
                    cylinder(d=15, h=20);
            }
    }

    rotate([0,0,135]) {
        translate([(2.5*teeth1/3.14)+(2.5*teeth2/3.14),0])
            rotate([0,0,(360/20)])
                herringbone(gear_thickness=10, gear_twist=0, gear_mm_per_tooth = 5, teeth_count = teeth2);

        translate([(2.5*teeth1/3.14)+(5*teeth2/3.14)+(2.5*teeth3/3.14),0])
            rotate([0,0,(360/20)]) {
                herringbone(gear_thickness=10, gear_twist=0, gear_mm_per_tooth = 5, teeth_count = teeth3);
                translate([0,0,10])
                    cylinder(d=22.5, h=5);
                translate([0,0,15])
                    cylinder(d=15, h=20);
            }
    }

    rotate([0,0,225]) {
        translate([(2.5*teeth1/3.14)+(2.5*teeth2/3.14),0])
            rotate([0,0,(360/20)])
                herringbone(gear_thickness=10, gear_twist=0, gear_mm_per_tooth = 5, teeth_count = teeth2);

        translate([(2.5*teeth1/3.14)+(5*teeth2/3.14)+(2.5*teeth3/3.14),0])
            rotate([0,0,(360/20)]) {
                herringbone(gear_thickness=10, gear_twist=0, gear_mm_per_tooth = 5, teeth_count = teeth3);
                translate([0,0,10])
                    cylinder(d=22.5, h=5);
                translate([0,0,15])
                    cylinder(d=15, h=20);
            }
    }

    rotate([0,0,315]) {
        translate([(2.5*teeth1/3.14)+(2.5*teeth2/3.14),0])
            rotate([0,0,(360/20)])
                herringbone(gear_thickness=10, gear_twist=0, gear_mm_per_tooth = 5, teeth_count = teeth2);

        translate([(2.5*teeth1/3.14)+(5*teeth2/3.14)+(2.5*teeth3/3.14),0])
            rotate([0,0,(360/20)]) {
                herringbone(gear_thickness=10, gear_twist=0, gear_mm_per_tooth = 5, teeth_count = teeth3);
                translate([0,0,10])
                    cylinder(d=22.5, h=5);
                translate([0,0,15])
                    cylinder(d=15, h=20);
            }
    }
}

module baseplate() {
    difference() {
        cube([165,165,5],center=true);
        cube([142.5,142.5,5+2*epsilon],center=true);
    }

    rotate([0,0,45]) {
        translate([(2.5*teeth1/3.14)+(5*teeth2/3.14)+(2.5*teeth3/3.14),0]) {
            t_od=12.5;    // Thread outer diameter
            t_st=2.5;   // Step/traveling per turn
            t_lf=55;    // Step angle degrees
            t_ln=90;    // Length of the threaded section
            t_rs=PI/2;  // Resolution
            t_se=1;     // Thread ends style
            t_gp=0;     // Gap between nut and bolt threads
            translate([0,0,0])
                screw_thread(t_od+t_gp, t_st, t_lf, t_ln, t_rs, t_se);
        }
    }

    rotate([0,0,135]) {
        translate([(2.5*teeth1/3.14)+(5*teeth2/3.14)+(2.5*teeth3/3.14),0]) {
            t_od=12.5;    // Thread outer diameter
            t_st=2.5;   // Step/traveling per turn
            t_lf=55;    // Step angle degrees
            t_ln=90;    // Length of the threaded section
            t_rs=PI/2;  // Resolution
            t_se=1;     // Thread ends style
            t_gp=0;     // Gap between nut and bolt threads
            translate([0,0,0])
                screw_thread(t_od+t_gp, t_st, t_lf, t_ln, t_rs, t_se);
        }
    }

    rotate([0,0,225]) {
        translate([(2.5*teeth1/3.14)+(5*teeth2/3.14)+(2.5*teeth3/3.14),0]) {
            t_od=12.5;    // Thread outer diameter
            t_st=2.5;   // Step/traveling per turn
            t_lf=55;    // Step angle degrees
            t_ln=90;    // Length of the threaded section
            t_rs=PI/2;  // Resolution
            t_se=1;     // Thread ends style
            t_gp=0;     // Gap between nut and bolt threads
            translate([0,0,0])
                screw_thread(t_od+t_gp, t_st, t_lf, t_ln, t_rs, t_se);
        }
    }

    rotate([0,0,315]) {
        translate([(2.5*teeth1/3.14)+(5*teeth2/3.14)+(2.5*teeth3/3.14),0]) {
            t_od=12.5;    // Thread outer diameter
            t_st=2.5;   // Step/traveling per turn
            t_lf=55;    // Step angle degrees
            t_ln=90;    // Length of the threaded section
            t_rs=PI/2;  // Resolution
            t_se=1;     // Thread ends style
            t_gp=0;     // Gap between nut and bolt threads
            translate([0,0,0])
                screw_thread(t_od+t_gp, t_st, t_lf, t_ln, t_rs, t_se);
        }
    }
}