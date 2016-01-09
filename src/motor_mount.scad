include <globals.scad>;
include <include.scad>;
include <slider.scad>;
$fn = 30;

/*******************************************************************************
*****                                Configuration                              *****
*******************************************************************************/

length=52;
height=52;
width=40;
thickness=8;
support=true;

/*******************************************************************************
*****                                    Build                                  *****
*******************************************************************************/

if(flip == true) {
    // Right Side
    mirror([1,0,0])
        y_motor_mount();
} else {
    // Left Side
    y_motor_mount();
}

/*******************************************************************************
*****                                  Modules                                 *****
*******************************************************************************/

module y_motor_mount() {
    difference() {
        union() {
            slider(length=length,height=height,width=width,thickness=thickness);
            
            // Add Block
            translate([0,34/2-45-5,-length/2+15])
                cube([width+15,30,30],center=true);
            
            // Get Even
            translate([-30,34/2-45-5,-length/2+15])
                cube([30,30,30],center=true);
        }
        
        // Motor Mounting Holes
        rotate([0,90,0]) {
            translate([0,-22,0]) {
                cylinder(d=3.5,h=width+15+1,center=true);
                translate([0,0,-15])
                    cylinder(d=6,h=width+30,center=true);
            }
            translate([-22,0,0]) {
                cylinder(d=3.5,h=width+15+1,center=true);
                translate([0,0,-7.5])
                    cylinder(d=6,h=width+15,center=true);
            }
            translate([22,0,0]) {
                cylinder(d=3.5,h=width+15+1,center=true);
                translate([0,0,-7.5])
                    cylinder(d=6,h=width+15,center=true);
            }
            translate([0,22,0]) {
                cylinder(d=3.5,h=width+15+1,center=true);
                translate([0,0,-7.5])
                    cylinder(d=6,h=width+15,center=true);
            }
        }
        
        // Center Bore
        rotate([0,90,0])
            cylinder(d=23,h=width+15+1,center=true);
        
        // Center Bore
        translate([-width,-height/2,-(length/2)+30]) {
            rotate([45,0,0])
                cube([width*2,length+height,length+height]);
        }
        
        // Tie End
        translate([-45,34/2-45-5,-length/2+15])
            rotate([0,45,-90])
                tie_end();
    }
    
    if (support==true)
    {
        translate([-45,34/2-30-5,5/2-length/2])
            cylinder(h=5, d=6, center=true);
        translate([-45,34/2-60-5,5/2-length/2])
            cylinder(h=5, d=6, center=true);
    }
}