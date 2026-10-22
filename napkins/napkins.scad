connectoroffsetx=20;
bottomwidth=90;
$fn=300;
scalereduction = 0.9;

module logo() {
    logoscale = 0.45 * scalereduction;
    scale([logoscale,logoscale,logoscale])
    rotate([90,90,0])
    union(){
        translate([0,20,0])
        linear_extrude(height=200, center=true)
        import("logo.svg", center=true);
        difference(){
            cylinder(h=200, r=133, center=true);
            cylinder(h=200, r=123, center=true);
        }
        
        difference(){
            translate([0,-108,0])
            cube([bottomwidth/0.45,155,200], center=true);
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

module napkin_connector_beams_base(m=false) {
    difference(){
        translate([0,-6,0])
        union(){
            difference(){
                if (m)
                    napkin1_base();
                else
                    napkin2_base();
                base_support_shape();
                translate([0,4,0])
                    base_support_shape();
                translate([0,6,0])
                    base_support_shape();
            }
            translate([-51,-8.5,0])
            cube(center=true, [10,5,bottomwidth]);
        }
        translate([-connectoroffsetx,0,0])
        support_shape(1.4);
    }
}

module napkin_connector_beam_middle(m=false) {
    intersection() {
        napkin_connector_beams_base(m);
        translate([0,0,0])
        cube([200,50,40], center=true);
    }
}

module napkin_connector_beam_top(m=false) {
    intersection() {
        napkin_connector_beams_base(m);
        translate([0,0,40])
        cube([200,50,50], center=true);
    }
}

module napkin_connector_beam_botom(m=false) {
    intersection() {
        napkin_connector_beams_base(m);
        translate([0,0,-40])
        cube([200,50,50], center=true);
    }
}

module napkin_connector_beams(m=false) {
    union(){
    translate([0,0,-0.5])
    napkin_connector_beam_middle(m);
    translate([0,0,-4.5])
    napkin_connector_beam_top(m);
    translate([0,0,4.5])
    napkin_connector_beam_botom(m);
    }
}

module napkin_connector(m=false) {
union(){
    //scale([scalereduction,scalereduction,scalereduction])
    intersection()
        napkin_connector_beams(m);


    //translate([-10,-1.5,0])
    //scale([scalereduction,scalereduction,scalereduction])
    translate([-7,0,0])
    // scale z only in the final version
    scale([0.97,1,scalereduction])
    glue_cutout();
}
}

module glue_cutout() {
    translate([-45,-12,0])
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
napkin_connector(true);
//napkin(false);
//napkin_connector_beams(false);

//support_shape();
//logo();
//napkin();
//translate([connectoroffsetx,2,0])   
//glue_cutout();
//}
//napkin_connector(false);
//import("napkin1.stl", center=true);
//import("napkin2.stl", center=true);