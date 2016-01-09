include <include.scad>;

/*******************************************************************************
*****                                  Modules                                 *****
*******************************************************************************/

module rounded_cube(width,depth,height,diameter=3.5){
    hull(){
        translate([width/2-diameter/2,depth/2-diameter/2,height/2-diameter/2]) sphere(d=diameter);
        translate([width/2-(diameter/2),depth/2-(diameter/2),-height/2+(diameter/2)]) sphere(d=diameter);
        translate([-width/2+diameter/2,depth/2-diameter/2,height/2-diameter/2]) sphere(d=diameter);
        translate([-width/2+(diameter/2),depth/2-(diameter/2),-height/2+(diameter/2)]) sphere(d=diameter);
        
        translate([width/2-diameter/2,-depth/2+diameter/2,height/2-diameter/2]) sphere(d=diameter);
        translate([width/2-(diameter/2),-depth/2+(diameter/2),-height/2+(diameter/2)]) sphere(d=diameter);
        translate([-width/2+diameter/2,-depth/2+diameter/2,height/2-diameter/2]) sphere(d=diameter);
        translate([-width/2+(diameter/2),-depth/2+(diameter/2),-height/2+(diameter/2)]) sphere(d=diameter);
    }
}

module slider() {
    module side() {
        // Rails
        translate([(5+5)/2-5,(10/2),0])
            rounded_cube(height = length, width = 10, depth = 10, diameter = 3.5);
        translate([(3.5+5)/2-3.5,-(12/2)-thickness,0])
            rounded_cube(height = length, width = 3.5+5, depth = 12, diameter = 3.5);
        
        // Base
        translate([5/2+2.5,-height/2+10,0])
            cube([5,height,length],center=true);
    }
    
    // Rack
    %translate([0,34/2-thickness/2,0])
        cube([width,thickness,length], center=true);
    
    // Block
    translate([0,-(height-10-thickness-10+1)/2,0])
        cube([width+5,height-10-thickness-10+1,length], center=true);
    
    // Rails
    translate([width/2,34/2,0])
        side();
    mirror([1,0,0])
        translate([width/2,34/2,0])
            side();
}