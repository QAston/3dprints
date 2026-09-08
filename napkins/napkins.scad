module logo() {
    scale([0.45,0.45,0.45])
    rotate([90,90,0])
    union(){
        translate([0,20,0])
        linear_extrude(height=100, center=true)
        import("logo.svg", center=true);
        difference(){
            cylinder(h=200, r=133, center=true);
            cylinder(h=200, r=123, center=true);
        }
        
        difference(){
            translate([0,-108,0])
            cube([266,230,200], center=true);
            cylinder(h=200, r=123, center=true);
        }
        
    }
}



module napkin1_base() {
    import("napkin1.stl", center=true);
}

module napkin2_base() {
    translate([0,-0.8,0])
    rotate([0,180,0])
    import("napkin2.stl", center=true);
}

module support_shape(scalex=1) {
    scale([scalex, 1, scalex])
    intersection(){
        difference(){
            translate([0, -313.2,-100])
            cylinder(h=200, r=300);
             translate([0, -313.2,-100])
            cylinder(h=200, r=296);
        }
        cube([158,100,109],center=true);
    }
}

module logo_support(m=false) {
scalex=1;
union(){
    intersection(){
    translate([30,0,0])
    if (m)
        logo();
    else {
        mirror([0,0,1])
        logo();
    }
    support_shape(1.4   );
    }

}
}


module napkin1(){
union(){
    logo_support();
    translate([10,3,0])
    difference(){
    
    napkin1_base();
    support_shape();
    }
    
}
}

module napkin2(){
union(){
    logo_support(true);
    translate([10,3,0])
    difference(){
    
    napkin2_base();
    support_shape();
    }
    
}
}


$fn=300;
//support_shape(1.5);
//logo_support()
//logo();
//intersection(){

//napkin2_base();
//napkin1_base();
//}
//difference(){
//napkin2_base();
//napkin1_base();
//}

//rotate([180, 0,0])
//translate([0,-100,0])
napkin2();
//napkin1();
//import("napkin1.stl", center=true);