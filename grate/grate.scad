module fill() {
    inside_circle = 50;
    inside_circle_scale=0.7;
    inside_circle_d = 78;
    difference() {
        union() {
            difference() {
                cube([93,93,2.5], center=true);
                translate([0,0,1.0])
                    cube([85,85,2], center=true);
             }
             
            linear_extrude(inside_circle, scale=inside_circle_scale)
                circle(d=inside_circle_d+6, center=true);
        }
        translate([0,0,0])
        linear_extrude(inside_circle, scale=inside_circle_scale+0.03)
            circle(d=inside_circle_d, center=true);
     }
}


module holes() {

    sq_size = 100;
    center_spacing = 6;
    height = 4;
    diameter = 4;

    difference() {

        for (x = [-sq_size/2:center_spacing:sq_size/2]){
             for (y = [-sq_size/2:center_spacing:sq_size/2]) {
             translate([x,y,0])
             cylinder(h = height, d = diameter, center=true);
             //rotate([0,0,45])
             //union() {
             //rotate([0,0,45])
             //cube([diameter, diameter, height], center=true);
             //cube([diameter, diameter, height], center=true);
             //}
            }
        }
        
        difference()
        {
            cube([1000,1000,1000], center=true);
            linear_extrude(10, center=true)
                circle(d=78, center=true);
        }

    }

}

$fn=100;

module grate() {  
    difference() {
    fill();
    holes();
    }
}

grate();