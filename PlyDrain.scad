include <lasercut\lasercut.scad>;
//python lasercut\convert-2d.py PlyDrain.scad --library "lasercut\lasercut.scad"

//TODO: Endcap(s)
//TODO: Slots instead of holes?
//TODO: Different (more secure) joint type?
//TODO: Fingers on ends to connect multiple

milling_bit = 25.4/4;
thickness = (3/8)*25.4;
x = 1000;
y = 100;
z = 150;
end_fingers=2;
side_fingers=8;
drain_r=y/8;
drain_spacing_r=4; //multiples of drain_r
drain_spacing=drain_r*drain_spacing_r;
x_drains = x/drain_spacing;
sides_with_drains=1;

module side(color="Gold",y=z){
    color(color, 0.75)
        lasercutoutSquare(
            thickness=thickness,
            x=x,
            y=y,
            finger_joints=[
                    [UP, 1, side_fingers],
                    [RIGHT, 1, end_fingers],
                    [DOWN, 1, side_fingers],
                    [LEFT, 1, end_fingers]
                ],
                milling_bit=milling_bit
        );
    }

module top(){
    side(color="red",y=y);
}

module bottom(){
    side("blue", y=y);
}

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

bottom();
translate([0,y+thickness,thickness])
    rotate([90,0,0])
        side();
translate([0,y,z+2*thickness])
    rotate([180,0,0])
        top();
translate([0,0-thickness,z+thickness])
    rotate([270,0,0])
        side();

//color("Gold",0.75) 
//    lasercutoutBox(
//        thickness=thickness, 
//        x=x, y=y, z=z, 
//        sides=6, 
//        num_fingers=4,
//        milling_bit=milling_bit,
//        circles_remove_a=all_drain_holes
//    )
//;
