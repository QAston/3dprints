
module wciecie() {
    mh = 166;
    mw = 181;
    cutout = 50;
    polygon([[0,0], [0,mh-cutout], [cutout, mh],  [mw,mh], [mw,0]]);
}

module powierzchnia_podstawy() {
    mh = 170;
    mw = 200;
    sh = 0;
    sw = 0;
    polygon([[sw,sh], [sw,mh], [mw, mh], [mw,sh]]);
}

module powierzchnia_nakladki() {
    mh = 100;
    mw = 210;
    sh = 0;
    sw = 00;
    polygon([[sw,sh], [sw,mh], [mw, mh], [mw,sh]]);
}

module wnetrze_nakladki() {
    mh = 200;
    mw = 190;
    sh = 0;
    sw = 00;
    polygon([[sw,sh], [sw,mh], [mw, mh], [mw,sh]]);
}

module wciecie_przednie_podst() {
    mh = 170;
    mw = 2000;
    sh = 0;
    sw = 0;
    polygon([[sw,sh], [sw,mh], [mw, mh], [mw,sh]]);
}

    //linear_extrude(height = 2, scale = 1)
    //    scale([1.05, 1.05, 1])
    //        wciecie();

module podstawa() {
    difference() {
        leg_length=30;
        thickness=40;
        translate([0,0,-leg_length])
            linear_extrude(height = leg_length+thickness, scale = 1)
                powierzchnia_podstawy();
        
        translate([220,130,-200])
            rotate(90+45+15)
            linear_extrude(height = 200, scale = 1)
                wciecie();
        
        translate([-10,-130,-200])
        linear_extrude(height = 200, scale = 1)
                wciecie_przednie_podst();
    }
}

module nakladka() {
    difference() {
        clamp_length = 40;
        height = 70;
        top_thickness = 10;
        eps=0.01;
        linear_extrude(height = clamp_length+height+top_thickness, scale = 1)
            powierzchnia_nakladki();
        
        translate([5,-10,-eps])
            linear_extrude(height = clamp_length+eps, scale = 1)
                powierzchnia_podstawy();
        
        translate([10,-10,clamp_length-eps])
            linear_extrude(height = height+eps, scale = 1)
                    wnetrze_nakladki();
        
        
        
    }
}

module powierzchnia_rozszerzenia() {
    mh = 180;
    mw = 200;
    sh = -40;
    sw = 00;
    polygon([[sw,sh], [sw,mh], [mw, mh], [mw,sh]]);
}

module wciecie_tylne_podst() {
    mh = 180;
    mw = 2000;
    sh = 0;
    sw = 0;
    polygon([[sw,sh], [sw,mh], [mw, mh], [mw,sh]]);
}

module rozszerenie() {
    leg_length=30;
    roz_height = 5;
    thickness=40;
    eps=0.01;
    podstawa_height= 40;
    difference() {
        translate([0,0,-leg_length])
         linear_extrude(height = podstawa_height+leg_length+roz_height, scale = 1)
            
            powierzchnia_rozszerzenia();
        
        translate([220,130,-200])
            rotate(90+45+15)
            linear_extrude(height = 200, scale = 1)
                wciecie();
        
        translate([-10,-130,-200])
        linear_extrude(height = 200, scale = 1)
                wciecie_przednie_podst();
        translate([0,0,-eps])
            podstawa();

        translate([-10,200,-200])
        linear_extrude(height = 200, scale = 1)
               wciecie_tylne_podst();
    }
}
rozszerenie();
//podstawa();