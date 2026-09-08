module num(t) {
    linear_extrude(height=10, center=true, convexity=3)
        text(t, size=55, font="arial black", halign="center");
}

module cakenum(t) {
union(){
    difference(){
        union() {
            num(t);
            translate([0,55,0])
                candlecatch();
        }
        
        translate([0,53,0])
            candlehole();
    }
    foot();

    
}
}

module foot() {
xd=1;
yd=25;
standsizex=24;
standsizez=10;
ydsupport=25;

union(){
    cube([standsizex,2,standsizez], center=true);
    //linear_extrude(h=10, center=true)
    //    polygon([[-xd,0], [xd, 0], [xd*0.5, -yd], [-xd*0.5,-yd]]);
    translate([standsizex/2-xd,0,0])
    linear_extrude(h=10, center=true)
        polygon([[-xd,0], [xd, 0], [xd*0.5, -ydsupport], [-xd*0.5,-ydsupport]]);
    translate([-standsizex/2+xd,0,0])
    linear_extrude(h=10, center=true)
        polygon([[-xd,0], [xd, 0], [xd*0.5, -ydsupport], [-xd*0.5,-ydsupport]]);
}    
}

module candlecatch() {
    height = 6;
    difference(){
        translate([0,0,0])
        rotate([0,90,90])
        cylinder(h=height, r=5 ,center=true);
        rotate([0,90,90])
        cylinder(h=height+1, r=4 ,center=true);
    }
}

module candlehole() {
    rotate([0,90,90])
    cylinder(h=10, r=3 ,center=true);
    
}
$fn=50;

module five() {
    cakenum("5");
}

module three() {
    cakenum("3");
}

five();
//three();
//import("3.stl");