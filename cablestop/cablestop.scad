module hanger_foot() {
    scale([1,1,0.5])
    translate([0,0,-33.59])
    difference() {
        translate([0,-36.75,0])
        scale([1, 1.5, 0.7])
        difference() {
            translate([44, 11, 15])
            import("towel_bar_hanger_v3.3mf");
            translate([0, 0, 0])
            cube([100, 100, 100]);
        }
        translate([-4,-35.5,1])
        cube([1, 71., 65.5], center=false);
        translate([-4.33,-50,-50])
        cube([1, 100, 200], center=false);
    }
}

module knob() {
    union() {
        //translate([38.5,0,0])
        //cylinder(h=14,r= 8);
        difference() {
            difference() {
                rotate([0,0,0])
                translate([20,0,0])
                    import("Door_Stop.stl",center=true);
                translate([-10,-40,-10])
                cube([10,100,100]);
            }
            //translate([3,0,7])
            //rotate([90, 0,0])
            //    corner();
            //translate([3,0,-7])
            //rotate([270, 0,0])
            //    corner();

        }
    }
}

module half_catcher() {
    translate([-2.2,0,1])
    rotate([-90,5,0])
    scale([1.5,1.5,1.5])
        difference() {
            rotate([0,0,180])
            translate([-8,0,0])
                import("Door_Stop_2.stl",center=true);
            translate([-10,-40,-10])
            cube([10,100,100]);
            translate([0,-3,-10])
            cube([30,20,20]);
            translate([3,0,10])
            rotate([90, 0,0])
                corner();
            translate([3,0,-10])
            rotate([270, 0,0])
                corner();
        }
}

$fn=50;


module corner() {
    length=100;
    thickness=10;
    $fn=100;
    union() {
        cylinder(h=length,r=5, center=true);
        translate([5, 0,0])
        cube([thickness,thickness,length ], center=true);
        translate([0,-thickness/2,-length/2])
        cube([thickness+100,thickness,length]);
    }
}

module doorstop_catcher(){
    translate([0,0,-5])
    union(){
    translate([0,0,3])
    half_catcher();
    translate([28,0,7])
    rotate([90,90,0])
    cylinder(h=7, r=2.8, center=true);
    knob();
    }
    hanger_foot();
}

module cable_catcher() {
    union() {
        scale([1,0.6,0.7])
        hanger_foot();
        translate([0,0,-7])
        half_catcher();
        translate([0,0,7])
        rotate([180,0,0])
        half_catcher();
    }
}
//cable_catcher();

doorstop_catcher();