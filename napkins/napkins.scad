module logo() {
    scale([0.45,0.45,0.45])
    rotate([90,90,0])
    union(){
        translate([0,20,0])
        linear_extrude(height=100, center=true)
        import("logo.svg", center=true);
        difference(){
        union(){
        difference(){
            cylinder(h=200, r=133, center=true);
            cylinder(h=200, r=123, center=true);
        }
        translate([0,-150,0])
        intersection(){
            translate([0,35,0])
            cube([266,80,200], center=true);
            difference(){
                cylinder(h=200, r=133, center=true);
                cylinder(h=200, r=123, center=true);
            }
        }
        }
        cylinder(h=200, r=123, center=true);
        }
        //difference(){
        //    translate([0,-80,0])
        //    cube([266,180,200], center=true);
        //    cylinder(h=200, r=123, center=true);
        //}
        
    }
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

module napkin_side(){
union(){
    translate([-40,-16,0])
    cylinder(h=120, r=3, center=true);
    logo_support(true);
}
}

module connector_side() {
    minkowski(){
    sphere(r=3);
    cube([0.001,80,110], center=true);
    }
}

//connector_side();


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
napkin_side();