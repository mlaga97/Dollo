include <../config.scad>;

epsilon=0.1;
support_thickness=-0.1;//0.4;

idler();

module idler() {
    difference() {
        union() {
            translate([-15,-15])
                cube([30,30,30]);
        }
    
        rotate([90,0,45])
            tie_end();
        
        translate([0,0,30])
            rotate([-90,0,45])
                tie_end();
        
        #translate([15-19,15-2,10.5])
            cube([20-support_thickness,20-support_thickness,2]);
        #translate([15-2,15-19,10.5])
            cube([20-support_thickness,20-support_thickness,2]);
    }
}
