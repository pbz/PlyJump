include <lasercut\lasercut.scad>;
//python lasercut\convert-2d.py PlyDrain.scad --library "lasercut\lasercut.scad"
//TODO: Endcap(s)
//TODO: Slots instead of holes?
//TODO: Different (more secure) joint type?

thickness = (3/8)*25.4;
x = 1000;
y = 100;
z = 100; 
milling_bit = 25.4/4;
drain_r=y/8;
drain_spacing_r=4; //multiples of drain_r
drain_spacing=drain_r*drain_spacing_r;
x_drains = x/drain_spacing;
sides_with_drains=1;

drain_holes=[
    for(j=[1:1:x_drains-1]) 
        [drain_r, j*drain_spacing, y/4],
    for(j=[1:1:x_drains])
        [drain_r, j*drain_spacing-2*drain_r, y/2]
];

all_drain_holes=[
    for(i=[1:1:sides_with_drains]) drain_holes
];

echo(drain_holes);
echo(all_drain_holes);

color("Gold",0.75) 
    lasercutoutBox(
        thickness=thickness, 
        x=x, y=y, z=z, 
        sides=4, 
        num_fingers=4,
        milling_bit=milling_bit,
        circles_remove_a=all_drain_holes
    )
;
