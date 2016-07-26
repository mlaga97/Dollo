include <../config.scad>;

epsilon=0.1;
support_thickness=0.4;

module base() {
    difference() {
        union() {
            translate([-15,-15])
                cube([30,30,60]);
            
            translate([5,-15,30-19/2])
                rotate([-90,0,0])
                    cylinder(d=27, h=10+epsilon);
                
            translate([-15,5,30+19/2])
                rotate([0,90,0])
                    cylinder(d=27, h=10);
            
            /*** Start Motor Bracket ***/
            translate([-15,-100,0])
            difference() {
                translate([0,10,0])
                    cube([7.5,80,60]);
                
                hull() {
                    translate([0,30,30])
                        rotate([0,90,0])
                            cylinder(d=23, h=25, center=true);
                    translate([0,45,30])
                        rotate([0,90,0])
                            cylinder(d=23, h=25, center=true);
                }
                
                hull() {
                    translate([0,30+31/2,30-31/2])
                        rotate([0,90,0])
                            cylinder(d=3, h=25, center=true);
                    translate([0,45+31/2,30-31/2])
                        rotate([0,90,0])
                            cylinder(d=3, h=25, center=true);
                }
                
                hull() {
                    translate([0,30+31/2,30+31/2])
                        rotate([0,90,0])
                            cylinder(d=3, h=25, center=true);
                    translate([0,45+31/2,30+31/2])
                        rotate([0,90,0])
                            cylinder(d=3, h=25, center=true);
                }
                
                hull() {
                    translate([0,30-31/2,30-31/2])
                        rotate([0,90,0])
                            cylinder(d=3, h=25, center=true);
                    translate([0,45-31/2,30-31/2])
                        rotate([0,90,0])
                            cylinder(d=3, h=25, center=true);
                }
                
                hull() {
                    translate([0,30-31/2,30+31/2])
                        rotate([0,90,0])
                            cylinder(d=3, h=25, center=true);
                    translate([0,45-31/2,30+31/2])
                        rotate([0,90,0]) {
                            cylinder(d=3, h=25, center=true);
                        }
                }
                
                hull() {
                    translate([-10+2.5,30-31/2,30+31/2])
                        rotate([0,90,0])
                                cylinder(d=5.5, h=10, center=false);
                    translate([-10+2.5,45-31/2,30+31/2])
                        rotate([0,90,0]) {
                                cylinder(d=5.5, h=10, center=false);
                        }
                }
                
                hull() {
                    translate([-10+2.5,30-31/2,30-31/2])
                        rotate([0,90,0])
                                cylinder(d=5.5, h=10, center=false);
                    translate([-10+2.5,45-31/2,30-31/2])
                        rotate([0,90,0]) {
                                cylinder(d=5.5, h=10, center=false);
                        }
                }
                
                hull() {
                    translate([-10+2.5,30+31/2,30+31/2])
                        rotate([0,90,0])
                                cylinder(d=5.5, h=10, center=false);
                    translate([-10+2.5,45+31/2,30+31/2])
                        rotate([0,90,0]) {
                                cylinder(d=5.5, h=10, center=false);
                        }
                }
                
                hull() {
                    translate([-10+2.5,30+31/2,30-31/2])
                        rotate([0,90,0])
                                cylinder(d=5.5, h=10, center=false);
                    translate([-10+2.5,45+31/2,30-31/2])
                        rotate([0,90,0]) {
                                cylinder(d=5.5, h=10, center=false);
                        }
                }
                
                /*** End Motor Bracket***/
            }
        }
    
        rotate([90,0,45])
            tie_end();
        
        translate([0,0,60])
            rotate([-90,0,45])
                tie_end();
        
        translate([-5,-5,10])
            cube([20-support_thickness,20-support_thickness,40]);
        
        translate([5,-15-epsilon,30-19/2])
            rotate([-90,0,0]) {
                cylinder(d=22, h=7.5+epsilon);
                cylinder(d=12, h=10+epsilon*2);
            }
            
        translate([-15-epsilon,5,30+19/2])
            rotate([0,90,0]) {
                cylinder(d=22, h=7.5+epsilon);
                cylinder(d=12, h=10+epsilon*2);
            }
    }
}

base();