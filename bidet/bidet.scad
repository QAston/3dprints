module hanger_foot() {
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

module catcher(hook=true) {
    thickness = 14;
    difference() {
        scale([1.25, 1.25, 0.5])
        difference() {
            rotate([0,0,180])
            translate([-8,0,0])
                import("Door_Stop_2.stl",center=true);
            translate([-10,-40,-10])
            cube([10,100,100]);
        }
        translate([3,0,thickness*0.5])
        rotate([90, 0,0])
            corner();
        translate([3,0,-thickness*0.5])
        rotate([270, 0,0])
                if (hook == true) {
                    corner(3);
                    translate([18,0,0])
                    mirror([1,0,0])
                    corner(3);
                }
                else {
                    corner();
                }
    }
}

module corner(l=15) {
    length=30;
    thickness=10;
    width=l;
    radius=thickness/2;
    
    union() {
        cylinder(h=length,r=radius, center=true);
        translate([radius, 0,0])
        cube([thickness,thickness,length ], center=true);
        translate([0,-thickness/2,-length/2])
        cube([thickness+width,thickness,length]);
    }
}
//catcher(14);
scale([1,1,1.5])
catcher(true);
hanger_foot();
$fn=100;
//difference(){
//hanger_foot();
//mirror([0,0,180])
//hanger_foot();
//}