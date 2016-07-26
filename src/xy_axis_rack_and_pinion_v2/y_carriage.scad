use <sliders.scad>
use <extension.scad>

length = 52;
rail_offset = -19;
motor_shaft_length = 24;

// Rack Offset
gear_teeth = 8;
rack_tooth_size = 5;
rack_module = rack_tooth_size / 3.1415926535;
rack_pcd = gear_teeth * rack_module;
    
module y_carriage() {
    // Slider
    translate([0,-(rack_pcd/2)+rail_offset,10])
        rotate([0,180,90])
            slider(l=length, base=10, wall=4, slop=0.2);
    
    difference() {
        // Motor Mount Plate
        translate([0,0,5+0.15]) {
            intersection() {
                rotate([0,0,45])
                    cube([42,42,10-0.3],center=true);
                cube([52,52,10-0.3],center=true);
            }
            translate([0,-rail_offset/2-(rack_pcd/2)+rail_offset+9,0])
                cube([52,-rail_offset,10-0.3],center=true);
        }
        
        // Motor Mount Holes
        rotate([0,0,45]) {
            cylinder(d=23,h=15);
            translate([-31/2,31/2]) {
                cylinder(d=3.5,h=15);
                cylinder(d=6.5,h=10,center=true);
            }
            translate([31/2,-31/2]) {
                cylinder(d=3.5,h=15);
                cylinder(d=6.5,h=10,center=true);
            }
            translate([31/2,31/2]) {
                cylinder(d=3.5,h=15);
                cylinder(d=6.5,h=10,center=true);
            }
        }
    }
    
    // X Axis Attachment
    translate([15-11-30,-13-(rack_pcd/2)-45,30-20]) {
        translate([0,30-5,-35])
            cube([30,5,35]);
        rotate([0,90,0])
            extension(units=1,support=false);
        // Support
        translate([0,0,-5/2]) cylinder(h=5, d=6, center=true);
        translate([30,0,-5/2]) cylinder(h=5, d=6, center=true);
    }
    
}

rotate([180,0,0]) {
    // Rail as Guide
    %translate([-90,-13-(rack_pcd/2),-12])
        import("y_rack_v2.stl");
    translate([35,0,0])
        y_carriage();
    mirror([1,0,0])
        translate([35,0,0])
            y_carriage();
}
