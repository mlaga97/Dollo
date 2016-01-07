include <globals.scad>;
include <include.scad>;

tail_depth = 55;
tail_depth_2 = -10;
thickness = 24;
support = true;

head_width = 6.5;
module y_mount_added(){
	translate([0,-15+6-3.5,51/2]) cube([30,thickness,51], center=true);
    
    translate([-8,-12.5+thickness/2,-55+tail_depth]) scale([.9,.9,.9]) male_dovetail(height=15);
	translate([8,-12.5+thickness/2,-55+tail_depth]) scale([.9,.9,.9]) male_dovetail(height=15);
    

}

module y_mount_taken(){
	translate([0,-thickness/2-12.5,15]) rotate([0,45,0]) tie_end();
    
	rotate([180,0,0]) translate([-8,12.5-thickness/2,-55+tail_depth_2]) scale([.9,.9,.9]) male_dovetail(height=30);
	rotate([180,0,0]) translate([8,12.5-thickness/2,-55+tail_depth_2]) scale([.9,.9,.9]) male_dovetail(height=30);

	cube([head_width,head_width,51*2], center=true);
}

//support
if (support==true)
{
	translate([15,-24,5/2]) cylinder(h=5, d=6, center=true);
	translate([-15,-24,5/2]) cylinder(h=5, d=6, center=true);
}

difference(){
	y_mount_added();
	y_mount_taken();
}
