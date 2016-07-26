include <../config.scad>;

epsilon=0.1;
support_thickness=0.4;

idler();

module idler() {
    difference() {
        union() {
            translate([-15,-15])
                cube([30,30,60]);
            
            translate([5,-15,30+19/2])
                rotate([-90,0,0])
                    cylinder(d=27, h=10+epsilon);
                
            translate([-15,5,30-19/2])
                rotate([0,90,0])
                    cylinder(d=27, h=10);
        }
    
        rotate([90,0,45])
            tie_end();
        
        translate([0,0,60])
            rotate([-90,0,45])
                tie_end();
        
        translate([-5,-5,10])
            cube([20-support_thickness,20-support_thickness,40]);
        
        translate([5,-15-epsilon,30+19/2])
            rotate([-90,0,0]) {
                cylinder(d=22, h=7.5+epsilon);
                cylinder(d=12, h=10+epsilon*2);
            }
            
        translate([-15-epsilon,5,30-19/2])
            rotate([0,90,0]) {
                cylinder(d=22, h=7.5+epsilon);
                cylinder(d=12, h=10+epsilon*2);
            }
    }
}
