teeth1=41;
teeth2=41;
teeth3=11;

module herringbone(gear_thickness=10, gear_twist=0, mount_hole_diameter=0, gear_mm_per_tooth = 5, teeth_count = 12) {
    translate([0,0,gear_thickness/2]) {
        mirror([0,0,1]) translate([0,0,gear_thickness/4]) gear(gear_mm_per_tooth,teeth_count,gear_thickness/2,mount_hole_diameter,gear_twist);
         translate([0,0,gear_thickness/4]) gear(gear_mm_per_tooth,teeth_count,gear_thickness/2,mount_hole_diameter,gear_twist);
    }
}
