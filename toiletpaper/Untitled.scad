use <dotscad/path_extrude.scad>

module holder() {
difference() {
    import("./Toilet paper holder.3mf");
    translate([-100, -20, 30])
        cube([130,140,100], center=false);
    translate([-100, -20, -1])
        cube([40, 140, 100]);
}
}

module section() {
    mirror([1,1,0])
    translate([10,9,0])
difference() {
    import("./Toilet paper holder.3mf");
    translate([-100, -20, 30])
        cube([130,140,100], center=false);
    translate([-100, -20, -1])
        cube([40, 140, 100]);
    translate([-10, -20, -1])
        cube([40, 140, 100]);
}

}

module section_area() {
    bezel_size=1;
    thickness=7.5;
    height=21.25;
    polygon([[0,bezel_size], [bezel_size, 0], [thickness - bezel_size,0]
    ,[thickness, bezel_size], [thickness, height-bezel_size], [thickness-bezel_size, height], [bezel_size, height], [0, height-bezel_size]]);
}

module section_path() {
    bezel_size=1;
    thickness=7.5;
    height=21.25;
    shape=[[0,bezel_size], [bezel_size, 0], [thickness - bezel_size,0]
    ,[thickness, bezel_size], [thickness, height-bezel_size], [thickness-bezel_size, height], [bezel_size, height], [0, height-bezel_size]];
    path_pts = [[0,0,0], [10,0,0], [11,1,0], [30, 20, 0], [30, 21, 0], [30, 50, 0], [29, 51, 0],[11, 70, 0],[10, 70, 0]];
    path_extrude(shape, path_pts);
    
}

module new_section() {
    translate([-60,-9,0])
    mirror([1,0,0])
    
    section_path();
    //linear_extrude(height=10, v=[0,0,1], center=false)
    //section_area();
}
//minkowski() {
new_section();
//section_path();
holder();
//}
//import("./Toilet paper holder.3mf");