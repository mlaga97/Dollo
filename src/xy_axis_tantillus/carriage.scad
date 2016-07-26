epsilon=0.1;

difference() {
    union() {
        cube([40,60,20]);
        cube([20,20,60]);
        hull() {
            translate([0,0,20])
                cube([14,20,20]);
            translate([0,20,0])
                cube([14,20,20]);
        }
    }
    
    translate([10,10,0])
        rotate([0,0,0]) {
            translate([0,0,-epsilon])
                cylinder(d=8.5,h=60+2*epsilon);
            translate([0,0,5])
                cylinder(d=10,h=60-2*5);
        }
    
    translate([10+19,0,10])
        rotate([-90,0,0]) {
            translate([0,0,-epsilon])
                cylinder(d=8.5,h=60+2*epsilon);
            translate([0,0,5])
                cylinder(d=10,h=60-2*5);
        }
        
        translate([0,30,30])
            rotate([0,90,0]) {
                translate([0,0,-epsilon])
                    cylinder(d=16+0.5, h=4+epsilon);
                translate([0,0,4-1])
                    cylinder(d=12+0.5, h=6+2);
                translate([0,0,10])
                    cylinder(d=16+0.5, h=4+epsilon);
            }
        
        rotate([-45,0,0])
            translate([7,10,42-10])
                screw_hole();
        rotate([-5,0,0])
            translate([7,17.5+2.5,42-21])
                screw_hole();
}

module screw_hole() {
    translate([0,0,-10])
        cylinder(d=3.5, h=50, $fn=8);
    translate([-15+3.5,-3,0])
        cube([15,6,3]);
}