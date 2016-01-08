include <publicDomainGearV1.1.scad>;
$fn = 40;

/*******************************************************************************
*****                                Configuration                              *****
*******************************************************************************/

mount_hole_diameter = 21.5;

// Gear Configuration
gear_twist = 0; // Set for Herringbone
gear_thickness = 10;
gear_mm_per_tooth = 9;
gear_pressure_angle  = 28;

// Thread Configuration
twist_radius = 37;
twist_gear_extra = 0; // Set for Herringbone
twist_tooth_depth = 2;
twist_height_units = 2;

// Adjustment Theory
// twist_degrees_per_unit = 360 / ( target_steps_per_mm / ((1/twist_height_unit_height*gear_ratio*steps_per_revolution) )
// twist_degrees_per_unit = 360 / ( 40 / ( (1/10) * (22/12) * 200 ) )
// twist_degrees_per_unit = 330

// Before (twist_degrees_per_unit = 360):  10mm -> 360 Degrees of Worm -> 605 Degrees of Drive Gear -> ~336 Steps
// After (twist_degrees_per_unit = 330):   10mm -> 330 Degrees of Worm -> 720 Degrees of Drive Gear-> 400 Steps
twist_degrees_per_unit = 330;

/*******************************************************************************
*****                                    Build                                  *****
*******************************************************************************/

/* Uncomment for Testing */
//gear_one();
//middle_gear();
//gear_large();

/*******************************************************************************
*****                                  Modules                                 *****
*******************************************************************************/

module gear_one(mount_hole_diameter=5.5) {
    // Mirror For Herringbone
    translate([0,0,gear_thickness/4])
        gear(gear_mm_per_tooth,12,gear_thickness/2,mount_hole_diameter,gear_twist);
    mirror([0,0,1])
        translate([0,0,gear_thickness/4])
            gear(gear_mm_per_tooth,12,gear_thickness/2,mount_hole_diameter,gear_twist);
    
    // TODO: Configuration Item
    translate([0,4.5,0])
        cube([5,5,gear_thickness], center=true);
}

module middle_gear(){
    // Mirror For Herringbone
    translate([0,0,gear_thickness/4])
        gear(gear_mm_per_tooth,12,gear_thickness/2,mount_hole_diameter,gear_twist);
    mirror([0,0,1])
        translate([0,0,gear_thickness/4])
            gear(gear_mm_per_tooth,12,gear_thickness/2,mount_hole_diameter,gear_twist);
}

module gear_large() {
    difference(){
        union(){
            // Mirror For Herringbone
            translate([0,0,gear_thickness/4])
                gear(gear_mm_per_tooth,22,gear_thickness/2,mount_hole_diameter,gear_twist);
            mirror([0,0,1])
                translate([0,0,gear_thickness/4])
                    gear(gear_mm_per_tooth,22,gear_thickness/2,mount_hole_diameter,gear_twist);
            
            // Raise Up for Herringbone w/o Friction
            translate([0,0,-gear_thickness/2-twist_gear_extra/2])
                rotate([0,0,-gear_twist])
                    gear(gear_mm_per_tooth,22,twist_gear_extra,mount_hole_diameter,0);
            
            // Screw Thread
            translate([0,0,-twist_height_units*10-gear_thickness/2-twist_gear_extra])
                twist();
        }
        
        // Mount Hole
        cylinder(h=100, d=mount_hole_diameter, center=true);
        
        // Alignment Arrow
        rotate([0,0,180])
            translate([15,-4,4])
                linear_extrude(h=20)
                    text(">", font="fontawesome");
    }
}

module twist() {
    difference() {
        intersection() {
            union() {
                difference(){
                    // Thread Body
                    linear_extrude(height = 10*twist_height_units, center = false, convexity = 10, twist = twist_height_units*twist_degrees_per_unit)
                        translate([twist_tooth_depth, 0, 0]) {
                            circle(r = twist_radius);
                        }
                    
                    // Round Thread Top
                    difference(){
                        rotate([0,3.5,0]) translate([0,-37,10*twist_height_units+2]) cube([100,37*2,10], center=true);
                        translate([35,-2,10*twist_height_units-1]) sphere(r=5);
                    }
                    
                    // Round Thread Bottom
                    difference(){
                        rotate([0,-3.5,0]) translate([0,37,-2.5]) cube([100,37*2,10], center=true);
                        translate([35,2,2]) sphere(r=5);
                    }
                }
                
                // Flatten Ends
                cylinder(h=10*twist_height_units, r=twist_radius-2);
            }
            
            // Smooth Thread Edges
            hull() {
                translate([0,0,twist_height_units*10-5]) scale([1,1,.25]) sphere(r=40, $fn=100);
                translate([0,0,5]) scale([1,1,.25]) sphere(r=40, $fn=100);
            }
        }
        
        // Alignment Arrow
        rotate([180,180,0])
            translate([20,-4,-3])
                linear_extrude(h=5)
                    text(">", font="fontawesome");
    }
}