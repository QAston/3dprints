entrance_hole_width=7.4;
locked_hole_width=3.3;
lock_travel=4.1;
lock_space_thickness=2.2;
locking_plate_thickness=2.7;
entrance_hole_to_hole=79.5;
entrance_hole_to_top=76.0;
entrance_hole_to_side=7.8;
entrance_hole_to_bottom=104.0;
body_thickness=38;
body_width=48;

bottom_holder_depth=5;
holder_thickness=0.8;//1;
holder_plate_thickness=holder_thickness;//0.8;
holder_travel_space_z=lock_space_thickness+locking_plate_thickness+1;
holder_travel_space_y=lock_travel+1;
mount_hole_thickness=lock_space_thickness;
mount_hole_line_x=-6;
$fn=100;

module lock_knob(){
translate([0, 0 ,locking_plate_thickness*0.5])
union() {
translate([0,0,lock_space_thickness])
cylinder(lock_space_thickness, r=entrance_hole_width*0.5, center=true);
translate([0,-entrance_hole_width*0.25,0])
cylinder(locking_plate_thickness, r=locked_hole_width*0.5, center=true);
translate([0,entrance_hole_width*0.25,0])
cylinder(locking_plate_thickness, r=locked_hole_width*0.5, center=true);
cube([locked_hole_width,locked_hole_width,locking_plate_thickness], center=true);
}
}



module top_holder() {
holder_x = body_width + 2 * holder_thickness;
holder_y = bottom_holder_depth + 2* holder_thickness + holder_travel_space_y; 
holder_z = body_thickness+ 2*holder_thickness + holder_travel_space_z;
mirror([0,1,0])
translate([0,-holder_y*-0.5,0.5*holder_z])
difference(){
    cube([holder_x,  holder_y, holder_z], center=true);
    translate([holder_thickness, holder_thickness, 0])
        cube([holder_x -  holder_thickness, holder_y - holder_thickness , holder_z - 2* holder_thickness], center=true);
    //translate([0,0,holder_thickness])
    //    cube([body_width*0.35, bottom_holder_depth + 2* holder_thickness, body_thickness+ 2*holder_thickness], center=true);
}
}

holder_plate();
//top_holder();


module holder_lock(){
// not a continuous dovetail to reduce friction
// make a handle for easy grabbing
// make it a bolt-on lock with a round dovetail?
}

module holder_plate() {  
    xsize=20;
    ysize=170;
difference(){
    union(){
        translate([0, holder_thickness, 0])
        top_holder();
        translate([-(0.5*body_width-entrance_hole_to_side),0,0])
        union(){
            translate([0,-entrance_hole_to_top,0])
            union() {
                translate([0,-entrance_hole_to_hole,holder_plate_thickness])
                    lock_knob();

                translate([0,0,holder_plate_thickness])
                    lock_knob();
            }

            translate([5,-(entrance_hole_to_hole+entrance_hole_to_top + holder_travel_space_y)/2 - bottom_holder_depth, holder_plate_thickness*0.5])
                cube([xsize, ysize, holder_plate_thickness], center=true);
        }
    }
    translate([mount_hole_line_x,-5,holder_thickness])
        cylinder(h=holder_thickness*2, r=locked_hole_width*0.5, center=true);
    translate([mount_hole_line_x,ysize*-0.5,holder_thickness])
        cylinder(h=holder_thickness*2, r=locked_hole_width*0.5, center=true);
    translate([mount_hole_line_x,ysize*-0.95,holder_thickness])
        cylinder(h=holder_thickness*2, r=locked_hole_width*0.5, center=true);
}
}