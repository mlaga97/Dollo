include <include.scad>;
include <globals.scad>;

*translate([0,0,5+13])
    mirror([0,0,1])
        geartrain();

// Tie Point Template
module tie_template(center_width=10,unit_scale=30,obj_height = 40,tail_depth = 0) {
    union() {
        translate([0,tail_depth,center_width/2])
            rotate([0,0,180])
                male_dovetail(height=unit_scale);
        mirror([0,0,1])
            translate([0,tail_depth,center_width/2])
                rotate([0,0,180])
                    male_dovetail(height=unit_scale);
    }
}

// Motor Mounting Holes
module motor_mounting_star() {
    rotate([0,0,45]){
        translate([43.84/2,0]) cylinder(d=3.5, h=h, $fn=20);
        translate([-43.84/2,0]) cylinder(d=3.5, h=h, $fn=20);
        translate([0,43.84/2]) cylinder(d=3.5, h=h, $fn=20);
        translate([0,-43.84/2]) cylinder(d=3.5, h=h, $fn=20);
        cylinder(d=25, h=h, $fn=20);
    }
}
*motor_mounting_star(h=100);

module arm() {
    difference() {
        union() {
            translate([35,0,0])
                cylinder(d=30,h=7.5+2.5);
            translate([35+50,0,0])
                cylinder(d=30,h=7.5+2.5);
                cylinder(d=30,h=7.5);
            translate([0,-15,0])
                cube([35+50,30,7.5]);
        }
        
        translate([35+50/2,0,0])
            rotate([-90,0,0])
                tie_template();
    }
}

module cap() {
    difference() {
        translate([-30,-30,0])
            cube([60,60,22.5]);
        
        translate([-41/2,-30,0])
            cube([41,60,15+2]);
        translate([-30,-41/2,0])
            cube([60,41,15+2]);
        translate([-41/2,-41/2,0])
            cube([41,41,16+2]);
        translate([-23/2,-41/2,0])
            cube([23,41,18+2]);
        translate([-23/2,-23/2,0])
            cube([23,23,25+2]);
        translate([-31/2-3.5/2,-41/2,0])
            cube([3.5,41,17+2]);
        translate([31/2-3.5/2,-41/2,0])
            cube([3.5,41,17+2]);
        
        translate([0,0,11]) {
            translate([-31/2,-31/2,0])
                cylinder(d=3.5,h=60);
            translate([-31/2,31/2,0])
                cylinder(d=3.5,h=60);
            translate([31/2,-31/2,0])
                cylinder(d=3.5,h=60);
            translate([31/2,31/2,0])
                cylinder(d=3.5,h=60);
        }
    }
}

module base() {
    difference() {
        union() {
            arm();
            rotate([0,0,90])
                arm();
            rotate([0,0,180])
                arm();
            rotate([0,0,270])
                arm();
            
            translate([-30,-30,0])
                cube([60,60,7.5]);
            translate([0,0,7.5])
                cap();
        }
        
        translate([0,0,-1]) {
            translate([-31/2,-31/2]) cylinder(d=6, h=11, $fn=20);
            translate([-31/2,31/2]) cylinder(d=6, h=11, $fn=20);
            translate([31/2,-31/2]) cylinder(d=6, h=11, $fn=20);
            translate([31/2,31/2]) cylinder(d=6, h=11, $fn=20);
            cylinder(d=6, h=15, $fn=20);
        }
        
        translate([0,0,-1]) {
            cylinder(d=23,h=10+2);
        }
        translate([35,0,-1]) {
            cylinder(d=22.5,h=2+10+2.5);
            cylinder(d1=25.5,d2=22.5,h=3);
        }
        translate([-35,0,-1]) {
            cylinder(d=22.5,h=2+10+2.5);
            cylinder(d1=25.5,d2=22.5,h=3);
        }
        translate([0,35,-1]) {
            cylinder(d=22.5,h=2+10+2.5);
            cylinder(d1=25.5,d2=22.5,h=3);
        }
        translate([0,-35,-1]) {
            cylinder(d=22.5,h=2+10+2.5);
            cylinder(d1=25.5,d2=22.5,h=3);
        }
        
        translate([35+50,0,-1]) {
            cylinder(d=22.5,h=2+10+2.5);
            cylinder(d1=25.5,d2=22.5,h=3);
        }
        translate([-35-50,0,-1]) {
            cylinder(d=22.5,h=2+10+2.5);
            cylinder(d1=25.5,d2=22.5,h=3);
        }
        translate([0,35+50,-1]) {
            cylinder(d=22.5,h=2+10+2.5);
            cylinder(d1=25.5,d2=22.5,h=3);
        }
        translate([0,-35-50,-1]) {
            cylinder(d=22.5,h=2+10+2.5);
            cylinder(d1=25.5,d2=22.5,h=3);
        }
    }
}
base();

module geartrain() {
    rotate([0,0,45])
        import("../STLs/z_center_gear.stl");
    rotate([0,0,0]) {
        translate([35,0,0]) {
            import("../STLs/z_idler_gear.stl");
            translate([0,0,-5])
            cylinder(d=40.5,h=10);
        }
        translate([35+50,0,0])
            import("../STLs/z_large_gear.stl");
    }
    rotate([0,0,90]) {
        translate([35,0,0])
            import("../STLs/z_idler_gear.stl");
        translate([35+50,0,0])
            import("../STLs/z_large_gear.stl");
    }
    rotate([0,0,180]) {
        translate([35,0,0])
            import("../STLs/z_idler_gear.stl");
        translate([35+50,0,0])
            import("../STLs/z_large_gear.stl");
    }
    rotate([0,0,270]) {
        translate([35,0,0])
            import("../STLs/z_idler_gear.stl");
        translate([35+50,0,0])
            import("../STLs/z_large_gear.stl");
    }
}