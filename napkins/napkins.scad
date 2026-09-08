connectoroffsetx=22;
bottomwidth=90;

module logo() {
    logoscale = 0.45;
    scale([logoscale,logoscale,logoscale])
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
            cube([bottomwidth/0.45,135,200], center=true);
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

module base_support_shape(scalex=1) {
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

module support_shape(scalex=1) {
    scale([scalex, 1, scalex])
    intersection(){
        intersection(){
            translate([0, -313.2,-100])
            cylinder(h=200, r=300);
            rotate([0,0,-3])
           cube([158,40,109],center=true);
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



module napkin_connector(m=false) {
union(){
    difference(){
        union(){
            if (m)
                napkin1_base();
            else
                napkin2_base();
            translate([-51,-14,0])
            cube(center=true, [10,5,bottomwidth]);
        }
        base_support_shape();
        translate([0,1,0])
            base_support_shape();

        translate([-connectoroffsetx,0,0])
        support_shape(1.4);
    }
    glue_cutout();
}
}

module glue_cutout() {
    translate([-51,-12,0])
    difference(){

    translate([0,-2.5,0])
    cube(center=true, [10,4,bottomwidth]);
    translate([-11,2,0])
    cylinder(h=bottomwidth, r=10, center=true);
    translate([11,2,0])
    cylinder(h=bottomwidth, r=10, center=true);
    }
    

}


module napkin(m=false){
union(){
    difference(){
        logo_support(m);
        translate([connectoroffsetx,0,0]) 
        glue_cutout();
    }
    //translate([connectoroffsetx,0,0])   

    //napkin_connector(m);
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
//napkin_connector(false);
//difference() {
//napkin(true);
//support_shape();
//translate([connectoroffsetx,2,0])   
//glue_cutout();
//}
//napkin_connector(false);
//import("napkin1.stl", center=true);