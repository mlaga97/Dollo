OPENSCAD=/usr/bin/openscad

all: STLs/rack2.stl STLs/rack3.stl STLs/rack4.stl STLs/rack5.stl STLs/rack6.stl STLs/hotend_mount.stl STLs/motor_mount_small.stl STLs/x_endstop.stl STLs/x_spacer.stl STLs/z_center_gear.stl STLs/z_idler_gear.stl STLs/xy_gear.stl STLs/bowtie.stl STLs/corner.stl STLs/endstop.stl STLs/extension2.stl STLs/extension3.stl STLs/extension4.stl STLs/extension5.stl STLs/extension6.stl STLs/z_large_gear.stl STLs/twist_corner.stl

clean:
	rm STLs/*.stl

########################################################################
#####                          STL Files                           #####
########################################################################

STLs/bowtie.stl: src/bow_tie.scad src/include.scad src/globals.scad
	${OPENSCAD} -o STLs/bowtie.stl src/bow_tie.scad

STLs/corner.stl: src/corner.scad src/include.scad src/globals.scad
	${OPENSCAD} -o STLs/corner.stl src/corner.scad

STLs/endstop.stl: src/endstop.scad src/include.scad src/globals.scad
	${OPENSCAD} -o STLs/endstop.stl src/endstop.scad

STLs/xy_gear.stl: src/gear.scad src/small_gear.dxf
	${OPENSCAD} -o STLs/xy_gear.stl src/gear.scad

STLs/z_center_gear.stl: src/z_center_gear.scad src/gears.scad
	${OPENSCAD} -o STLs/z_center_gear.stl src/z_center_gear.scad

STLs/z_idler_gear.stl: src/z_idler_gear.scad src/gears.scad
	${OPENSCAD} -o STLs/z_idler_gear.stl src/z_idler_gear.scad

STLs/z_large_gear.stl: src/z_large_gear.scad src/gears.scad
	${OPENSCAD} -o STLs/z_large_gear.stl src/z_large_gear.scad

STLs/hotend_mount.stl: src/hot_end_mount.scad src/include.scad src/globals.scad
	${OPENSCAD} -o STLs/hotend_mount.stl src/hot_end_mount.scad

STLs/motor_mount_small.stl: src/motor_mount_small.scad src/include.scad src/globals.scad
	${OPENSCAD} -o STLs/motor_mount_small.stl src/motor_mount_small.scad

STLs/twist_corner.stl: src/twist_corner.scad src/gears.scad src/include.scad src/globals.scad
	${OPENSCAD} -o STLs/twist_corner.stl src/twist_corner.scad

STLs/x_endstop.stl: src/x_endstop.scad src/include.scad src/globals.scad
	${OPENSCAD} -o STLs/x_endstop.stl src/x_endstop.scad

STLs/x_spacer.stl: src/x_spacer.scad src/include.scad src/globals.scad
	${OPENSCAD} -o STLs/x_spacer.stl src/x_spacer.scad

STLs/extension2.stl: src/extension.scad src/include.scad src/globals.scad
	${OPENSCAD} -o STLs/extension2.stl -D units=2 src/extension.scad

STLs/extension3.stl: src/extension.scad src/include.scad src/globals.scad
	${OPENSCAD} -o STLs/extension3.stl -D units=3 src/extension.scad

STLs/extension4.stl: src/extension.scad src/include.scad src/globals.scad
	${OPENSCAD} -o STLs/extension4.stl -D units=4 src/extension.scad

STLs/extension5.stl: src/extension.scad src/include.scad src/globals.scad
	${OPENSCAD} -o STLs/extension5.stl -D units=5 src/extension.scad

STLs/extension6.stl: src/extension.scad src/include.scad src/globals.scad
	${OPENSCAD} -o STLs/extension6.stl -D units=6 src/extension.scad

STLs/rack2.stl: src/rack.scad src/rack.dxf src/include.scad src/globals.scad
	${OPENSCAD} -o STLs/rack2.stl -D units=2 src/rack.scad

STLs/rack3.stl: src/rack.scad src/rack.dxf src/include.scad src/globals.scad
	${OPENSCAD} -o STLs/rack3.stl -D units=3 src/rack.scad

STLs/rack4.stl: src/rack.scad src/rack.dxf src/include.scad src/globals.scad
	${OPENSCAD} -o STLs/rack4.stl -D units=4 src/rack.scad

STLs/rack5.stl: src/rack.scad src/rack.dxf src/include.scad src/globals.scad
	${OPENSCAD} -o STLs/rack5.stl -D units=5 src/rack.scad

STLs/rack6.stl: src/rack.scad src/rack.dxf src/include.scad src/globals.scad
	${OPENSCAD} -o STLs/rack6.stl -D units=6 src/rack.scad

########################################################################
#####                          SCAD Files                          #####
########################################################################

src/gears.scad: src/publicDomainGearV1.1.scad
