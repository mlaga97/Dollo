epsilon=0.1;


difference() {
    union() {
        cylinder(d=15,h=40);
        translate([0,-7.5])
            cube([27.5,15,20]);
    }
    
    // Adjuster
    translate([10-3,-7.5-epsilon,12.5])
        cube([6,15+2*epsilon,3]);
    translate([10,0,-epsilon])
        cylinder(d=3.5, h=20+2*epsilon,$fn=6);
    
    // Stationary Hole
    translate([12.5,7.5+epsilon,5])
        rotate([90,0,0])
            cylinder(d=3, h=15+2*epsilon,$fn=6);
    
    // Across
    translate([19,7.5+epsilon,10])
        rotate([90,0,0])
            cylinder(d=8+0.25, h=15+2*epsilon);
    
    // Bearing
    translate([0,0,-epsilon])
        cylinder(d=8.5,h=40+2*epsilon);
    translate([0,0,6.5])
        cylinder(d=10,h=40-3-10);
    translate([0,0,40-1.5-5])
        cylinder(d1=10,d2=8.5,h=1.5);
    translate([0,0,5])
        cylinder(d1=8.5,d2=10,h=1.5);
}