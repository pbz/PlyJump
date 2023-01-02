include <lasercut\lasercut.scad>;

milling_bit=0.25*25.4;
thickness = (3/8)*25.4;
takeoff_length = 1000;
angle = 10;

x = takeoff_length;
y = tan(angle)*x;
z = 300; 

module side(){
    color("Gold",0.75) 
        lasercutout(
            thickness=thickness,
            points=[
                [0,0],
                [x,0],
                [0,y]
            ],
            finger_joints=[
                    [LEFT, 1, 4],
                    [DOWN, 0, 4]
                ],
            milling_bit=milling_bit
        )
    ;
}

side();
translate([0,0,z+thickness])
    side();
translate([0,0,0+thickness])
    rotate([90,0,0])
        color("green",0.75) 
            lasercutoutSquare(
                thickness=thickness,
                x=x,
                y=z,
                finger_joints=[
                        [LEFT, 1, 4],
                        [DOWN, 1, 4],
                        [UP, 0, 4]
                    ],
                milling_bit=milling_bit
            )
;
translate([0,0,0+thickness])
    rotate([0,-90,0])
        color("red",0.75) 
            lasercutoutSquare(
                thickness=thickness,
                x=z,
                y=y,
                finger_joints=[
                        [LEFT, 0, 4],
                        [DOWN, 1, 4],
                        [RIGHT, 1, 4]
                    ],
                milling_bit=milling_bit
            )
;