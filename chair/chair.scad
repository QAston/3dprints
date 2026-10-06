$fn=200;


//translate([0,0,thickness+7])
//cylinder(h=height-thickness, r=radius, center=true);

module foot(height=15, radius=21/2, thickness=1) {
difference() {
cylinder(h=height, r=radius+thickness, center=true);
translate([0,0,thickness])
cylinder(h=height-thickness, r=radius, center=true);
}
}
// front
foot(radius=22.8/2);
// back
//foot(radius=25.5/2);