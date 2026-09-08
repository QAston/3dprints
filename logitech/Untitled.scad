module button_base($fn=200) {
    difference() {
        hull() {
            cylinder(11,3,3, $fn=12);
            cylinder(11, 2.7, 2.7);
        }
        translate([0,0,-0.5])
            cylinder(130, 1, 1);
    }
}



button_base();
