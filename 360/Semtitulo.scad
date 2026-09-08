module hanger_head() {
    translate([0, -21.07, 0])
    scale([1, 0.86, 1])
    difference() {
        translate([44, 11, 15])
        import("towel_bar_hanger_v3.3mf");
        translate([-10, 0, 0])
        cube([10, 100, 100]);
    }
}

module hanger_foot() {
    translate([0,0,-10])
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

module hanger_head_ramp() {
    translate([0, -21.07, -16])
    scale([1, 0.86, 1])
    difference() {
        translate([44, 11, 15])
        import("towel_bar_hanger_v3.3mf");
        translate([-10, 0, 0])
        cube([10, 100, 100]);
        translate([0, 0, 0])
        cube([100, 100, 16]);
        translate([10, 0, 0])
        cube([100, 100, 100]);
    }
}

module hanger() {
union() {

hanger_head_ramp();
mirror([0,1,0])
rotate([180,0,0])
hanger_head_ramp();
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

// lessons:
// hotair makes 3m stick better?
// 0.5 is too big for a glue boundary for 3m, but hotair can fix that
// hotair is really good for deforming/forcing things together
// 