//$fa=1;
//$fs=1;


l=37.1;
b=21.0;
depth_top=4.5;
thickness_bottom=2.2;
depth_bottom=1.5;
// h gemeten =8.2, thickness_bottom = 8.2 - 6.0 = 2.2 ?
h=depth_top+thickness_bottom+depth_bottom;
thickness_border=1.9;
radius=4.1;
hole_diameter=6.6;
split_thickness=2.6;
split_width=6.6;
split_dist_from_top=1.9;

overlap=1.0;

use <roundedCube.scad>;

module split() {
    rotate([0,90,0]) roundedCube([split_thickness, split_width, thickness_border+overlap*2], split_width/8);
}

difference() {
roundedCube([l, b, h], radius);

translate([thickness_border, thickness_border, h-depth_top])
    roundedCube([l-thickness_border*2, b-thickness_border*2, depth_top+overlap],radius-thickness_border);

translate([thickness_border, thickness_border,0-overlap])
    roundedCube([l-thickness_border*2, b-thickness_border*2, depth_bottom+overlap], radius-thickness_border);

translate([l/2, b/2, depth_bottom-overlap])
    cylinder(h=thickness_bottom+overlap*2, r=hole_diameter/2, $fn=128);
    
translate([l-thickness_border-overlap, b/2-split_width/2, h-split_dist_from_top])
    split();
    
translate([-overlap, b/2-split_width/2, h-split_dist_from_top])
    split();

translate([thickness_border-2, b/2-split_width*1.2/2, h+0.7])
rotate([0,35,0])
cube([3, split_width*1.2, 2 ]);
    
translate([l-thickness_border-0.4, b/2-split_width*1.2/2, h-1])
rotate([0,-35,0])
cube([3, split_width*1.2, 2 ]);
}


version = version();
echo(version);
echo(" h = 8.2 ? = " , h);