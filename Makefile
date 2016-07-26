OPENSCAD=/usr/bin/openscad

all: STLs/rack2.stl STLs/rack3.stl STLs/rack4.stl STLs/rack5.stl STLs/rack6.stl STLs/hotend_mount.stl STLs/motor_mount_left.stl STLs/motor_mount_right.stl STLs/x_endstop.stl STLs/toolhead_mount.stl STLs/z_center_gear.stl STLs/z_idler_gear.stl STLs/xy_gear.stl STLs/bowtie.stl STLs/corner.stl STLs/endstop.stl STLs/extension2.stl STLs/extension3.stl STLs/extension4.stl STLs/extension5.stl STLs/extension6.stl STLs/z_large_gear.stl STLs/twist_corner.stl STLs/platform.stl

clean:
	rm STLs/*.stl

########################################################################
#####                          STL Files                           #####
########################################################################

STLs/bowtie.stl: src/bow_tie.scad src/include.scad src/globals.scad
	${OPENSCAD} -o STLs/bowtie.stl src/bow_tie.scad

STLs/corner.stl:

STLs/extension4.stl:
	
STLs/short_peg.stl:

STLs/long_peg.stl:

STLs/platform.stl:

STLs/prusa_platform_adapter.scad:

STLs/twist_corner.stl:

STLs/x_carriage.stl:

STLs/xy_rack.stl:

STLs/y_carriage.stl:

STLs/z_center_gear.stl:

STLs/z_idler_gear.stl:

STLs/z_large_gear.stl:

########################################################################
#####                          SCAD Files                          #####
########################################################################

src/gears.scad: src/publicDomainGearV1.1.scad
