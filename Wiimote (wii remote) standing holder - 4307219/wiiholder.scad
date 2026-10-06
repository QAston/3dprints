module labeledstand(){
    import("files/Wiimote_holder_2pc.stl", center=true);
}

module stand(){
labeledstand();
mirror([1,0,0])
labeledstand();
}

module label() {
translate([-35, -40,-24])
scale([0.05, 0.05, 0.05])
rotate([60, 0,0])
linear_extrude(height=70,center=true)
import("RP.svg", center=true);
}

//label();
//difference(){
//stand();
//label();
//}

module ulogo() {
scale([1.5,1.5,1])
linear_extrude(height=3,center=true)
import("Wii_U.svg", center=true);
}

module ulogobg(){
translate([0,0,1.3])
cube([8,10.5,0.5], center=true);
}

ulogo();
ulogobg();
