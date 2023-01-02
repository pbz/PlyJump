include <lasercut\lasercut.scad>;

milling_bit=0.25*25.4;
thickness = (3/8)*25.4;

width1 = 400;
width2 = width1+2*thickness;
length1 = 500;
length2 = length1;
pivot_dia = 12.5;
surfaceGap = thickness;
surfaceLength1 = length1-surfaceGap;
surfaceLength2 = length2-surfaceGap;
sideHeight = 75;

//Surface 1
translate([-width1/2,0,0])
    rotate([0,0,0])
        color("red",0.75) 
            lasercutoutSquare(
                thickness=thickness,
                x=width1,
                y=surfaceLength1,
                finger_joints=[
                    [LEFT, 1, 4],
                    [RIGHT, 0, 4]
                ]
            )
;
translate([width1/2,0,0])
    rotate([0,90,0])
        color("yellow",0.75)
            lasercutoutSquare(
                thickness=thickness,
                x=sideHeight,
                y=surfaceLength1,
                finger_joints=[
                    [LEFT, 0, 4]
                ],
                circles_add=[
                    [sideHeight/2, sideHeight/2, surfaceLength1+sideHeight/2]
                ],
                circles_remove=[
                    [pivot_dia/2, sideHeight/2, surfaceLength1+sideHeight/2]
                ]
            )
;
translate([-width1/2-thickness,0,0])
    rotate([0,90,0])
        color("yellow",0.75)
            lasercutoutSquare(
                thickness=thickness,
                x=sideHeight,
                y=surfaceLength1,
                finger_joints=[
                    [LEFT, 0, 4]
                ]
            )
;
//color("red",0.75)
//    translate([-width1/2,0,0]) 
//        lasercutoutBox(
//            thickness=thickness,
//            x=width1,
//            y=surfaceLength1,
//            z=sideHeight, 
//            sides=5,
//            num_fingers=4
//        )
//;

//Surface 2
translate([-width2/2,length1,0])
    rotate([0,0,0])
        color("blue",0.75) 
            lasercutoutSquare(
                thickness=thickness,
                x=width2,
                y=surfaceLength2,
                finger_joints=[
                    [LEFT, 1, 4],
                    [RIGHT, 0, 4]
                ]                
            )
;
translate([width2/2,length2,0])
    rotate([0,90,0])
        color("yellow",0.75)
            lasercutoutSquare(
                thickness=thickness,
                x=sideHeight,
                y=surfaceLength1,
                finger_joints=[
                    [LEFT, 0, 4]
                ]
            )
;
translate([-width2/2-thickness,length2,0])
    rotate([0,90,0])
        color("yellow",0.75)
            lasercutoutSquare(
                thickness=thickness,
                x=sideHeight,
                y=surfaceLength1,
                finger_joints=[
                    [LEFT, 0, 4]
                ]
            )
;