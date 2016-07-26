include <include.scad>;
include <globals.scad>;

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

module arm() {
    difference() {
        translate([0,-15,0])
            cube([70,30,7.5]);
        
        translate([35+50/2,0,0])
            rotate([-90,0,0])
                tie_template();
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
        }
        
        translate([20,0,0]) {
            cylinder(d=3.5,h=10);
            translate([0,0,-5+3])
                cylinder(d=6,h=5,$fn=6);
        }
        
        translate([-20,0,0]) {
            cylinder(d=3.5,h=10);
            translate([0,0,-5+3])
                cylinder(d=6,h=5,$fn=6);
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