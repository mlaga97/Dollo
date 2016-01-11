difference() {
    union() {
        cylinder(d=22,h=7.5+2.5+10);
        cylinder(d1=25,d2=22,h=3);
    }
    
    translate([0,0,-1])
        cylinder(d=9,h=2+7.5+2.5+10);
}