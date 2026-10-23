entrance_hole_width=7.4;
locked_hole_width=3.3;
lock_travel=4.1;
lock_space_thickness=2.2;
locking_plate_thickness=3.2;
entrance_hole_to_hole=104.5;
entrance_hole_to_top=81.0;
entrance_hole_to_bottom=104.0;
body_thickness=37 + 2 + 2.2 + 3.2;
body_width=82.4;
entrance_hole_to_side=body_width*0.5;

top_holder_depth=5;
holder_thickness=0.8;//1;
holder_plate_thickness=holder_thickness;//0.8;
holder_wall_height=6;
holder_travel_space_z=lock_space_thickness+locking_plate_thickness+2;
holder_travel_space_y=lock_travel+1;
mount_hole_thickness=lock_space_thickness;
$fn=100;

holder_triangle_support=50;
holder_x = body_width + 2 * holder_thickness;
holder_y = holder_triangle_support + top_holder_depth + 2* holder_thickness + holder_travel_space_y; 
holder_z = body_thickness+ 2*holder_thickness + holder_travel_space_z;
holder_plate_rside_support=4;
holder_cable_hole=16;

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


module holder_insert(){
insert_buffer=3;
insert_buffer_z=1.5;
insert_handle_thickness=15;
insert_x=holder_x -  holder_thickness + insert_handle_thickness;
insert_y=holder_y - holder_thickness - holder_triangle_support +1.5;
insert_z=holder_z - 2* holder_thickness - insert_buffer_z;
insert_bottom_cutout=21;
translate([0, insert_y*-0.5, insert_z*0.5])
difference(){
union(){
    cube([insert_x, insert_y , insert_z], center=true);
}
    translate([(insert_handle_thickness) * -0.5,holder_travel_space_y*-0.5,(insert_z-body_thickness)*-0.5])
    cube([insert_x - insert_handle_thickness,insert_y - holder_travel_space_y + insert_buffer,body_thickness], center=true);
    translate([insert_x*0.425,0,0])
    cube([insert_handle_thickness*0.6,insert_y , insert_z*0.770], center=true);
    
    // bottom cutout
    translate([-0.5* insert_x +holder_x* 0.5-holder_thickness,0,-insert_z*0.5 + insert_bottom_cutout*0.5])
    cube([holder_x,insert_y, insert_bottom_cutout], center=true);
}

}


module top_holder() {

difference(){
    mirror([0,1,0])
    difference(){
        translate([0,-holder_y*-0.5,0.5*holder_z])
            difference(){
                cube([holder_x,  holder_y, holder_z], center=true);
                translate([0, holder_thickness, 0])
                    cube([holder_x - 2* holder_thickness, holder_y - holder_thickness , holder_z - 2* holder_thickness], center=true);
                translate([0,20,-holder_z*0.5])
                cube([holder_x,45, holder_thickness*2], center=true);
            }
        // rounded corner
        translate([0,holder_y,holder_z])
        rotate([90,0,90])
        cylinder(h=holder_x,r=holder_triangle_support+holder_thickness, center=true);
        
        //cable hole
        translate([-holder_cable_hole*0.5,0,holder_wall_height])
        cube([holder_cable_hole, holder_y, holder_z]);
        
        translate([holder_x*0.5,holder_thickness+16,holder_z*0.5-holder_thickness+11.7])
        cube([10,30,30],center=true);
    }
//translate([10,-5,2])
//   holder_insert();
}

}



//
holder_plate();


module holder_lock(){
// not a continuous dovetail to reduce friction
// make a handle for easy grabbing
// make it a bolt-on lock with a round dovetail?
}

module holder_plate() {  
    xsize=16;
    ysize=200;
    yhole1 = ysize*-0.03;
    yhole2 = ysize*-0.5;
    yhole3 = ysize*-0.97;
    hole_support_xsize=body_width;
    hole_support_ysize=13;
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
            translate([0,-(entrance_hole_to_hole+entrance_hole_to_top + holder_travel_space_y)/2 - top_holder_depth, holder_plate_thickness*0.5])
            cube([xsize, ysize, holder_plate_thickness], center=true);
            translate([-holder_plate_thickness -entrance_hole_to_side+ 0.5*xsize,-(entrance_hole_to_hole+entrance_hole_to_top + holder_travel_space_y)/2 - top_holder_depth, holder_wall_height*0.5])
            difference(){
                cube([xsize, ysize, holder_wall_height],center=true);
                translate([holder_plate_thickness, 0, holder_plate_thickness])
                cube([xsize, ysize, holder_wall_height], center=true);
                
            }
            translate([+holder_plate_thickness +entrance_hole_to_side- 0.5*xsize,-(entrance_hole_to_hole+entrance_hole_to_top + holder_travel_space_y)/2 - top_holder_depth, holder_wall_height*0.5])
            difference(){
                cube([xsize, ysize, holder_wall_height],center=true);
                translate([-holder_plate_thickness, 0, holder_plate_thickness])
                cube([xsize, ysize, holder_wall_height], center=true);
                
            }     
                     translate([0, yhole2, holder_plate_thickness*0.5])
                cube([hole_support_xsize, hole_support_ysize, holder_plate_thickness], center=true);
            translate([0, yhole3, holder_plate_thickness*0.5])
                cube([hole_support_xsize, hole_support_ysize, holder_plate_thickness], center=true);   
            }
    }
    translate([-(0.5*body_width)+ 10,-18,0])
        scale([1.5,1.4,1])
            lock_knob();
    translate([(0.5*body_width)- 10,-18,0])
        scale([1.5,1.4,1])
            lock_knob();
            
mount_hole_line_x=0;
mount_hole_line_rx=0.5*body_width - 0.5*xsize;
mount_hole_line_lx=-0.5*body_width + 0.5*xsize;
    translate([mount_hole_line_x,yhole1,holder_thickness])
        cylinder(h=holder_thickness*2, r=locked_hole_width*0.5, center=true);
    translate([mount_hole_line_x,yhole2,holder_thickness])
        cylinder(h=holder_thickness*2, r=locked_hole_width*0.5, center=true);
    translate([mount_hole_line_x,yhole3,holder_thickness])
        cylinder(h=holder_thickness*2, r=locked_hole_width*0.5, center=true);
    translate([mount_hole_line_rx,yhole2,holder_thickness])
        cylinder(h=holder_thickness*2, r=locked_hole_width*0.5, center=true);
    translate([mount_hole_line_rx,yhole3,holder_thickness])
        cylinder(h=holder_thickness*2, r=locked_hole_width*0.5, center=true);
    translate([mount_hole_line_rx,yhole1,holder_thickness])
        cylinder(h=holder_thickness*2, r=locked_hole_width*0.5, center=true);
        
    translate([mount_hole_line_lx,yhole2,holder_thickness])
        cylinder(h=holder_thickness*2, r=locked_hole_width*0.5, center=true);
    translate([mount_hole_line_lx,yhole3,holder_thickness])
        cylinder(h=holder_thickness*2, r=locked_hole_width*0.5, center=true);
    translate([mount_hole_line_lx,yhole1,holder_thickness])
        cylinder(h=holder_thickness*2, r=locked_hole_width*0.5, center=true);
}
}