include <./config.scad>;
include <../config.scad>;

include <../libraries/polyScrewThread_r1.scad>;

epsilon = 0.1;

//translate([-16.5+0.5,15,-30]) rotate([0,0,-90]) mirror([0,0,1]) male_dovetail();
//translate([-30,15,-16.5+0.5]) rotate([-90,180,-90]) mirror([0,0,1]) male_dovetail();

module attachy_bit() {
    difference() {
        union() {
            t_od=12.5;    // Thread outer diameter
            t_st=2.5;   // Step/traveling per turn
            t_lf=55;    // Step angle degrees
            t_ln=20+75;    // Length of the threade section
            t_rs=PI/2;  // Resolution
            t_se=1;     // Thread ends style
            t_gp=0;     // Gap between nut and bolt threads
            translate([14+2,14+2,10])
                screw_thread(t_od+t_gp, t_st, t_lf, t_ln, t_rs, t_se);
            
            intersection() {
                rotate([0,0,45])
                    cube([200,45,1000],center=true);
                
                difference() { 
                    union() {
                        cube([60,60,30]);
                    }
                    
                    translate([30+epsilon,30+epsilon,-epsilon])
                        cube([30+epsilon,30+epsilon,30+2*epsilon]);
                    
                    translate([-epsilon,-epsilon,10])
                        cube([30+epsilon,30+epsilon,20+epsilon]);
                    
                    translate([45,30.1-0.4,15])
                        rotate([180,-90,0])
                            male_dovetail();
                    
                    translate([30.1-0.4,45,15])
                        rotate([0,90,90])
                            male_dovetail();
                }
            }
        }
        
        translate([14+2,14+2,-epsilon])
            cylinder(d=5, h=1000);
    }
}
attachy_bit();