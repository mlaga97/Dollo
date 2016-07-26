use <../libraries/publicDomainGearV1.1.scad>;
include <../libraries/polyScrewThread_r1.scad>;

include <./config.scad>;
include <../config.scad>;

epsilon = 0.1;

module platform() {
    difference() {
        union() {
            translate([-80,-5])
                cube([160,10,5]);
            translate([-5,-80])
                cube([10,160,5]);
            translate([-70,-25])
                cube([140,50,5]);
            translate([-25,-70])
                cube([50,140,5]);
        }
        
        translate([-70,-70,3])
            cube([140,140,2+epsilon]);
        
        translate([75,0,-epsilon])
            cylinder(d=3.5, h=5+2*epsilon);
        translate([-75,0,-epsilon])
            cylinder(d=3.5, h=5+2*epsilon);
        translate([0,75,-epsilon])
            cylinder(d=3.5, h=5+2*epsilon);
        translate([0,-75,-epsilon])
            cylinder(d=3.5, h=5+2*epsilon);
    }
}

module plate_base(thickness=7.5) {
        difference(){
        union() {
            hull() {
                cylinder(d=25,h=thickness);
                
                rotate([0,0,135])
                    translate([(2.5*teeth1/3.14)+(5*teeth2/3.14)+(2.5*teeth3/3.14),0])
                        cylinder(d=25,h=thickness);
            }
            
            hull() {
                cylinder(d=25,h=thickness);
                
                rotate([0,0,225])
                    translate([(2.5*teeth1/3.14)+(5*teeth2/3.14)+(2.5*teeth3/3.14),0])
                        cylinder(d=25,h=thickness);
            }
            
            hull() {
                rotate([0,0,45])
                    translate([(2.5*teeth1/3.14)+(5*teeth2/3.14)+(2.5*teeth3/3.14),0])
                        cylinder(d=25,h=thickness);
                
                rotate([0,0,135])
                    translate([(2.5*teeth1/3.14)+(5*teeth2/3.14)+(2.5*teeth3/3.14),0])
                        cylinder(d=25,h=thickness);
            }
            
            hull() {
                rotate([0,0,135])
                    translate([(2.5*teeth1/3.14)+(5*teeth2/3.14)+(2.5*teeth3/3.14),0])
                        cylinder(d=25,h=thickness);
                
                rotate([0,0,225])
                    translate([(2.5*teeth1/3.14)+(5*teeth2/3.14)+(2.5*teeth3/3.14),0])
                        cylinder(d=25,h=thickness);
            }
            
            hull() {
                rotate([0,0,225])
                    translate([(2.5*teeth1/3.14)+(5*teeth2/3.14)+(2.5*teeth3/3.14),0])
                        cylinder(d=25,h=thickness);
                
                rotate([0,0,315])
                    translate([(2.5*teeth1/3.14)+(5*teeth2/3.14)+(2.5*teeth3/3.14),0])
                        cylinder(d=25,h=thickness);
            }
            
            hull() {
                rotate([0,0,45])
                    translate([(2.5*teeth1/3.14)+(5*teeth2/3.14)+(2.5*teeth3/3.14),0])
                        cylinder(d=25,h=thickness);
                
                rotate([0,0,315])
                    translate([(2.5*teeth1/3.14)+(5*teeth2/3.14)+(2.5*teeth3/3.14),0])
                        cylinder(d=25,h=thickness);
            }
            
            hull() {
                cylinder(d=25,h=thickness);
                rotate([0,0,45])
                    translate([(2.5*teeth1/3.14)+(5*teeth2/3.14)+(2.5*teeth3/3.14),0])
                        cylinder(d=25,h=thickness);
            }
                
            hull() {
                cylinder(d=25,h=thickness);
                rotate([0,0,-45])
                    translate([(2.5*teeth1/3.14)+(5*teeth2/3.14)+(2.5*teeth3/3.14),0])
                        cylinder(d=25,h=thickness);
            }
            
            cylinder(d=25, h=thickness+1);
            rotate([0,0,45])
                translate([(2.5*teeth1/3.14)+(2.5*teeth2/3.14),0]) {
                    cylinder(d=25, h=thickness+1);
                }
            rotate([0,0,135])
                translate([(2.5*teeth1/3.14)+(2.5*teeth2/3.14),0]) {
                    cylinder(d=25, h=thickness+1);
                }
            rotate([0,0,225])
                translate([(2.5*teeth1/3.14)+(2.5*teeth2/3.14),0]) {
                    cylinder(d=25, h=thickness+1);
                }
            rotate([0,0,315])
                translate([(2.5*teeth1/3.14)+(2.5*teeth2/3.14),0]) {
                    cylinder(d=25, h=thickness+1);
                }
        }
        
        translate([0,0,-epsilon])
            cylinder(d=3, h=thickness+1+2*epsilon,$fn=6);
        
        rotate([0,0,45]) {
            // Half-way
            translate([(2.5*teeth1/3.14)+(2.5*teeth2/3.14),0]) {
                translate([0,0,-epsilon])
                    cylinder(d=3, h=thickness+1+2*epsilon,$fn=6);
            }
            
            // Outer
            translate([(2.5*teeth1/3.14)+(5*teeth2/3.14)+(2.5*teeth3/3.14),0]) {
                translate([0,0,thickness+1-4])
                    cylinder(d=22.5, h=4+epsilon);
                translate([0,0,-epsilon])
                    cylinder(d=15, h=thickness+2*epsilon);
            }
        }
        
        rotate([0,0,135]) {
            // Half-way
            translate([(2.5*teeth1/3.14)+(2.5*teeth2/3.14),0]) {
                translate([0,0,-epsilon])
                    cylinder(d=3, h=thickness+1+2*epsilon,$fn=6);
            }
            
            // Outer
            translate([(2.5*teeth1/3.14)+(5*teeth2/3.14)+(2.5*teeth3/3.14),0]) {
                translate([0,0,thickness-4])
                    cylinder(d=22.5, h=4+epsilon);
                translate([0,0,-epsilon])
                    cylinder(d=15, h=thickness+2*epsilon);
            }
        }
        
        rotate([0,0,225]) {
            // Half-way
            translate([(2.5*teeth1/3.14)+(2.5*teeth2/3.14),0]) {
                translate([0,0,-epsilon])
                    cylinder(d=3, h=thickness+1+2*epsilon,$fn=6);
            }
            
            // Outer
            translate([(2.5*teeth1/3.14)+(5*teeth2/3.14)+(2.5*teeth3/3.14),0]) {
                translate([0,0,thickness-4])
                    cylinder(d=23, h=4+epsilon);
                translate([0,0,-epsilon])
                    cylinder(d=15, h=thickness+2*epsilon);
            }
        }
        
        rotate([0,0,315]) {
            // Half-way
            translate([(2.5*teeth1/3.14)+(2.5*teeth2/3.14),0]) {
                translate([0,0,-epsilon])
                    cylinder(d=3, h=thickness+1+2*epsilon,$fn=6);
            }
            
            // Outer
            translate([(2.5*teeth1/3.14)+(5*teeth2/3.14)+(2.5*teeth3/3.14),0]) {
                translate([0,0,thickness-4])
                    cylinder(d=23, h=4+epsilon);
                translate([0,0,-epsilon])
                    cylinder(d=15, h=thickness+2*epsilon);
            }
        }
    }
}

module bottom_plate() {
    difference(){
        union() {
            plate_base();
            
            hull() {
                translate([25,0,0])
                    cylinder(d=25,h=7.5);
                
                translate([0,-25,0])
                rotate([0,0,45])
                    translate([(2.5*teeth1/3.14)+(5*teeth2/3.14)+(2.5*teeth3/3.14),0])
                        cylinder(d=25,h=7.5);
                
                translate([0,25,0])
                rotate([0,0,-45])
                    translate([(2.5*teeth1/3.14)+(5*teeth2/3.14)+(2.5*teeth3/3.14),0])
                        cylinder(d=25,h=7.5);
            }
        }
        
        translate([(2.5*teeth1/3.14)+(2.5*teeth3/3.14),0]) {
            translate([0,0,-epsilon])
                cylinder(d=23, h=7.5+2*epsilon);
            
            translate([31/2,31/2]) {
                translate([0,0,-epsilon])
                    cylinder(d=3.5, h=7.5+2*epsilon);
                translate([0,0,7.5-2.5])
                    cylinder(d=6, h=7.5+2*epsilon);
            }
            
            translate([31/2,-31/2]) {
                translate([0,0,-epsilon])
                    cylinder(d=3.5, h=7.5+2*epsilon);
                translate([0,0,7.5-2.5])
                    cylinder(d=6, h=7.5+2*epsilon);
            }
            
            translate([-31/2,31/2]) {
                translate([0,0,-epsilon])
                    cylinder(d=3.5, h=7.5+2*epsilon);
                translate([0,0,7.5-2.5])
                    cylinder(d=6, h=7.5+2*epsilon);
            }
            
            translate([-31/2,-31/2]) {
                translate([0,0,-epsilon])
                    cylinder(d=3.5, h=7.5+2*epsilon);
                translate([0,0,7.5-2.5])
                    cylinder(d=6, h=7.5+2*epsilon);
            }
        }
    }
}

module top_plate() {
    difference(){
        union() {
            plate_base(thickness=5);
        }
        
        translate([75,0,-epsilon]) {
            cylinder(d=3.5, h=7.5+epsilon*2);
        }
        translate([-75,0,-epsilon]) {
            cylinder(d=3.5, h=7.5+epsilon*2);
        }
        translate([0,75,-epsilon]) {
            cylinder(d=3.5, h=7.5+epsilon*2);
        }
        translate([0,-75,-epsilon]) {
            cylinder(d=3.5, h=7.5+epsilon*2);
        }
    }
}