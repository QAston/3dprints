entrance_hole_width=7.4;
locked_hole_width=3.3;
lock_travel=4.1;
lock_space_thickness=2.2;
locking_plate_thickness=3.2;
entrance_hole_to_hole=79.5;
entrance_hole_to_top=76.0;
entrance_hole_to_side=7.8;
entrance_hole_to_bottom=104.0;
body_thickness=37;
body_width=48;

top_holder_depth=5;
holder_thickness=0.8;//1;
holder_plate_thickness=holder_thickness;//0.8;
holder_wall_height=6;
holder_travel_space_z=lock_space_thickness+locking_plate_thickness+2;
holder_travel_space_y=lock_travel+1;
mount_hole_thickness=lock_space_thickness;
mount_hole_line_x=-8;
mount_hole_line_rx=10;
$fn=100;

holder_triangle_support=40;
holder_x = body_width + 2 * holder_thickness;
holder_y = holder_triangle_support + top_holder_depth + 2* holder_thickness + holder_travel_space_y; 
holder_z = body_thickness+ 2*holder_thickness + holder_travel_space_z;
holder_plate_rside_support=4;

module lock_knob(){
translate([0, 0 ,locking_plate_thickness*0.5])
union() {
translate([0,0,lock_space_thickness])
cylinder(h=lock_space_thickness, r=entrance_hole_width*0.5, center=true);
translate([0,-entrance_hole_width*0.25,0])
cylinder(h=locking_plate_thickness, r=locked_hole_width*0.5, center=true);
translate([0,entrance_hole_width*0.25,0])
cylinder(h=locking_plate_thickness, r=locked_hole_width*0.5, center=true);
cube([locked_hole_width,locked_hole_width,locking_plate_thickness], center=true);
}
}



module top_holder() {


mirror([0,1,0])
difference(){
translate([0,-holder_y*-0.5,0.5*holder_z])
difference(){
    cube([holder_x,  holder_y, holder_z], center=true);
    translate([holder_thickness, holder_thickness, 0])
        cube([holder_x , holder_y - holder_thickness , holder_z - 2* holder_thickness], center=true);
    //translate([0,0,holder_thickness])
    //    cube([body_width*0.35, top_holder_depth + 2* holder_thickness, body_thickness+ 2*holder_thickness], center=true);
    //translate([0, holder_triangle_support, holder_z*0.25])
    //cube([holder_x, holder_triangle_support, holder_z*0.5], center=true);
}
    translate([0,holder_y,holder_z])
    rotate([90,0,90])
    cylinder(h=holder_x,r=holder_triangle_support+holder_thickness, center=true);
    translate([0.5*holder_x,holder_y-holder_thickness*2,holder_thickness])
    cylinder(h=holder_thickness*2,r=holder_triangle_support + holder_thickness, center=true);
}

}

module holder_insert(){
insert_buffer=3;
insert_buffer_z=1.5;
insert_handle_thickness=15;
insert_x=holder_x -  holder_thickness + insert_handle_thickness;
insert_y=holder_y - holder_thickness - holder_triangle_support - 1.5;
insert_z=holder_z - 2* holder_thickness - insert_buffer_z;
//translate([0, insert_y*-0.5, insert_z*0.5])
difference(){
union(){
    cube([insert_x, insert_y , insert_z], center=true);
}
    translate([(insert_handle_thickness) * -0.5,holder_travel_space_y*-0.5,(insert_z-body_thickness)*-0.5])
    cube([insert_x - insert_handle_thickness,insert_y - holder_travel_space_y + insert_buffer,body_thickness], center=true);
    translate([insert_x*0.31,0,0])
    cube([insert_handle_thickness*0.7,insert_y , insert_z*0.6], center=true);
    
    // bottom cutout
    translate([-0.5* insert_x +holder_x* 0.5-holder_thickness,0,-insert_z*0.5 + holder_plate_rside_support*0.5])
    cube([holder_x,insert_y, holder_plate_rside_support], center=true);
}

}

//holder_triangle_support=20;
//holder_x = body_width + 2 * holder_thickness;
//translate([0,0,holder_thickness])
//holder_insert();
//holder_plate();


module holder_lock(){
// not a continuous dovetail to reduce friction
// make a handle for easy grabbing
// make it a bolt-on lock with a round dovetail?
}

module holder_plate() {  
    xsize=23.2;
    ysize=170;
    yhole2 = ysize*-0.5;
    yhole3 = ysize*-0.95;
    hole_support_xsize=body_thickness;
    hole_support_ysize=18;
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
            translate([3,-(entrance_hole_to_hole+entrance_hole_to_top + holder_travel_space_y)/2 - top_holder_depth, holder_wall_height*0.5])
            difference(){
                cube([xsize, ysize, holder_wall_height],center=true);
                translate([holder_plate_thickness, 0, holder_plate_thickness])
                cube([xsize, ysize, holder_wall_height], center=true);
                
            }
             translate([39,-(entrance_hole_to_hole+entrance_hole_to_top + holder_travel_space_y)/2 - top_holder_depth, holder_plate_rside_support*0.5])
            difference(){
                cube([holder_plate_rside_support, ysize, holder_plate_rside_support],center=true);
                translate([-holder_plate_thickness, 0, holder_plate_thickness])
                cube([holder_plate_rside_support, ysize, holder_plate_rside_support], center=true);
                
            }
            translate([20, yhole2+20, holder_plate_thickness*0.5])
                cube([hole_support_xsize, hole_support_ysize, holder_plate_thickness], center=true);
            translate([20, yhole3+20, holder_plate_thickness*0.5])
                cube([hole_support_xsize, hole_support_ysize, holder_plate_thickness], center=true);
        }
    }
    translate([mount_hole_line_x,-25,holder_thickness])
        cylinder(h=holder_thickness*2, r=locked_hole_width*0.5, center=true);
    translate([mount_hole_line_x,yhole2,holder_thickness])
        cylinder(h=holder_thickness*2, r=locked_hole_width*0.5, center=true);
    translate([mount_hole_line_x,yhole3,holder_thickness])
        cylinder(h=holder_thickness*2, r=locked_hole_width*0.5, center=true);
    translate([mount_hole_line_rx,yhole2+20,holder_thickness])
        cylinder(h=holder_thickness*2, r=locked_hole_width*0.5, center=true);
    translate([mount_hole_line_rx,yhole3+20,holder_thickness])
        cylinder(h=holder_thickness*2, r=locked_hole_width*0.5, center=true);
    translate([mount_hole_line_rx,-5,holder_thickness])
        cylinder(h=holder_thickness*2, r=locked_hole_width*0.5, center=true);
    translate([-(0.5*body_width-entrance_hole_to_side),-15,0])
    scale([1.4,1.3,1])
        lock_knob();
    }

}