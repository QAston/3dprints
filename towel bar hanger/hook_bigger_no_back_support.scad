module hanger_head() {
    translate([0, -22.05, 0])
    scale([1, 0.90, 1])
    difference() {
        translate([44, 11, 15])
        import("towel_bar_hanger_v3.3mf");
        translate([-10, 0, 0])
        cube([10, 100, 100]);
    }
}

module hanger_foot() {
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
    }
}

module hanger() {
union() {
hanger_head();
hanger_foot();
}
}

module hanger_center_check() {
    difference () {
    hanger();
    mirror([0,1,0]) {
    hanger();
    }
    }
}

hanger();