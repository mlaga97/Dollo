smoothing = 100;
length = 13;
scaling_x = .9;
scaling_y = 1;
scaling_z = 1;
include <include.scad>;
include <globals.scad>;

$fn = smoothing;
module bow_tie_master(){
	union(){
		mirror([0,1,0]) intersection(){
			rotate([0,-45,0]) cube([obj_leg,obj_leg,obj_leg]);
			male_dovetail(height=length);
		}

		intersection(){
			#rotate([0,-45,0]) cube([obj_leg,obj_leg,obj_leg]);
			male_dovetail(height=length);
		}
	}
}
module bow_holes() {
	translate([-10,-2.5,-2.5]) rotate([0,90,0]) #cylinder(h=50, d=1.5);
	translate([-10,2.5,-2.5]) rotate([0,90,0]) #cylinder(h=50, d=1.5);
}

module finished(){
	rotate([0,45*0,0]){
		difference(){
			rotate([0,180,0]) bow_tie_master();
			bow_holes();
		}
	}
}

scale([scaling_x,scaling_y,scaling_z]) finished();
