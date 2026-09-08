
module wciecie() {
    mh = 166;
    mw = 181;
    cutout = 50;
    polygon([[0,0], [0,mh-cutout], [cutout, mh],  [mw,mh], [mw,0]]);
}

module powierzchnia() {
    mh = 180;
    mw = 200;
    sh = 0;
    sw = 0;
    polygon([[sw,sh], [sw,mh], [mw, mh], [mw,sh]]);
}

    //linear_extrude(height = 2, scale = 1)
    //    scale([1.05, 1.05, 1])
    //        wciecie();

difference() {
    linear_extrude(height = 0.75, scale = 1)
        powierzchnia();
    
    translate([210,140,-5])
        rotate(90+45+25)
        linear_extrude(height = 5.5, scale = 1)
            wciecie();
}