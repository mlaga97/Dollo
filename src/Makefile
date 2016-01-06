OPENSCAD=/usr/bin/openscad

all: STLs/rack2.stl STLs/rack3.stl STLs/rack4.stl STLs/rack5.stl STLs/rack6.stl STLs/hotend_mount.stl STLs/motor_mount_small.stl STLs/twist_corner.stl STLs/x_endstop.stl STLs/x_spacer.stl STLs/z_center_gear.stl STLs/z_idler_gear.stl STLs/z_large_gear.stl STLs/xy_gear.stl STLs/bowtie.stl STLs/corner.stl STLs/endstop.stl STLs/extension2.stl STLs/extension3.stl STLs/extension4.stl STLs/extension5.stl STLs/extension6.stl

STLs/bowtie.stl: include.scad globals.scad bow_tie.scad
	${OPENSCAD} -o STLs/bowtie.stl bow_tie.scad

STLs/corner.stl: include.scad globals.scad corner.scad
	${OPENSCAD} -o STLs/corner.stl corner.scad

STLs/endstop.stl: include.scad globals.scad endstop.scad
	${OPENSCAD} -o STLs/endstop.stl endstop.scad

STLs/extension2.stl: include.scad globals.scad extention.scad
	${OPENSCAD} -o STLs/extension2.stl -D units=2 extention.scad

STLs/extension3.stl: include.scad globals.scad extention.scad
	${OPENSCAD} -o STLs/extension3.stl -D units=3 extention.scad

STLs/extension4.stl: include.scad globals.scad extention.scad
	${OPENSCAD} -o STLs/extension4.stl -D units=4 extention.scad

STLs/extension5.stl: include.scad globals.scad extention.scad
	${OPENSCAD} -o STLs/extension5.stl -D units=5 extention.scad

STLs/extension6.stl: include.scad globals.scad extention.scad
	${OPENSCAD} -o STLs/extension6.stl -D units=6 extention.scad

STLs/xy_gear.stl: include.scad globals.scad gear.scad
	${OPENSCAD} -o STLs/xy_gear.stl gear.scad

STLs/z_center_gear.stl: include.scad globals.scad gears.scad z_center_gear.scad
	${OPENSCAD} -o STLs/z_center_gear.stl z_center_gear.scad

STLs/z_idler_gear.stl: include.scad globals.scad gears.scad z_idler_gear.scad
	${OPENSCAD} -o STLs/z_idler_gear.stl z_idler_gear.scad

STLs/z_large_gear.stl: include.scad globals.scad gears.scad z_large_gear.scad
	${OPENSCAD} -o STLs/z_large_gear.stl z_large_gear.scad

STLs/rack2.stl: rack.scad include.scad globals.scad rack.scad
	${OPENSCAD} -o STLs/rack2.stl -D units=2 rack.scad
	
STLs/rack3.stl: rack.scad include.scad globals.scad rack.scad
	${OPENSCAD} -o STLs/rack3.stl -D units=4 rack.scad
	
STLs/rack4.stl: rack.scad include.scad globals.scad rack.scad
	${OPENSCAD} -o STLs/rack3.stl -D units=6 rack.scad
	
STLs/rack5.stl: rack.scad include.scad globals.scad rack.scad
	${OPENSCAD} -o STLs/rack3.stl -D units=8 rack.scad
	
STLs/rack6.stl: rack.scad include.scad globals.scad rack.scad
	${OPENSCAD} -o STLs/rack3.stl -D units=10 rack.scad

STLs/hotend_mount.stl: include.scad globals.scad hot_end_mount.scad
	${OPENSCAD} -o STLs/hotend_mount.stl hot_end_mount.scad

STLs/motor_mount_small.stl: include.scad globals.scad motor_mount_small.scad
	${OPENSCAD} -o STLs/motor_mount_small.stl motor_mount_small.scad

STLs/twist_corner.stl: include.scad globals.scad twist_corner.scad
	${OPENSCAD} -o STLs/twist_corner.stl twist_corner.scad

STLs/x_endstop.stl: include.scad globals.scad x_endstop.scad
	${OPENSCAD} -o STLs/x_endstop.stl x_endstop.scad

STLs/x_spacer.stl: include.scad globals.scad x_spacer.scad
	${OPENSCAD} -o STLs/x_spacer.stl x_spacer.scad

clean:
	rm STLs/*.stl

