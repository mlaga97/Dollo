include <globals.scad>;
include <include.scad>;
include <slider.scad>;
$fn = 30;

/*******************************************************************************
*****                                Configuration                              *****
*******************************************************************************/

length=52;
height=54;
width=40;
thickness=8;

/*******************************************************************************
*****                                    Build                                  *****
*******************************************************************************/

toolhead_mount();

/*******************************************************************************
*****                                  Modules                                 *****
*******************************************************************************/

module toolhead_mount() {    
    difference() {
        union() {
            difference() {
                union() {
                    slider(length=length,height=height,width=width,thickness=thickness);
                }
                
                // Chamfer
                translate([-width,-height+27,0]) {
                    translate([0,0,2.5])
                        rotate([45,0,0])
                            cube([width*2,length+height,length+height]);
                    translate([0,0,-2.5])
                        rotate([45+180,0,0])
                            cube([width*2,length+height,length+height]);
                }
            }
            
            // Mount Plate
            translate([5+width/2,-height/2+27+(30/2),0])
                cube([5,height+30+2+2,length],center=true);
        }
        
        // Motor Mounting Holes
        rotate([0,90,0]) {
            translate([0,-22,0]) {
                cylinder(d=3.5,h=width+15+1,center=true);
                translate([0,0,15])
                    cylinder(d=6,h=width+30,center=true);
            }
            translate([-22,0,0]) {
                cylinder(d=3.5,h=width+15+1,center=true);
                translate([0,0,7.5])
                    cylinder(d=6,h=width+15,center=true);
            }
            translate([22,0,0]) {
                cylinder(d=3.5,h=width+15+1,center=true);
                translate([0,0,7.5])
                    cylinder(d=6,h=width+15,center=true);
            }
            translate([0,22,0]) {
                cylinder(d=3.5,h=width+15+1,center=true);
                translate([0,0,7.5])
                    cylinder(d=6,h=width+15,center=true);
            }
        }
        
        // Motor Mounting Holes
        rotate([0,90,0]) {
            translate([15,32+20,0]) {
                cylinder(d=3.5,h=width+15+1,center=true);
                *translate([0,0,15])
                    cylinder(d=6,h=width+30,center=true);
            }
            translate([-15,32+20,0]) {
                cylinder(d=3.5,h=width+15+1,center=true);
                *translate([0,0,15])
                    cylinder(d=6,h=width+30,center=true);
            }
            translate([-15,32,0]) {
                cylinder(d=3.5,h=width+15+1,center=true);
                *translate([0,0,15])
                    cylinder(d=6,h=width+30,center=true);
            }
            translate([15,32,0]) {
                cylinder(d=3.5,h=width+15+1,center=true);
                *translate([0,0,15])
                    cylinder(d=6,h=width+30,center=true);
            }
            translate([-15,32-height,0]) {
                cylinder(d=3.5,h=width+15+1,center=true);
                *translate([0,0,15])
                    cylinder(d=6,h=width+30,center=true);
            }
            translate([15,32-height,0]) {
                cylinder(d=3.5,h=width+15+1,center=true);
                *translate([0,0,15])
                    cylinder(d=6,h=width+30,center=true);
            }
        }
        
        // Center Bore
        rotate([0,90,0])
            cylinder(d=23,h=width+15+1,center=true);
    }
}