module main_panel()
    translate([0,0,1.4])
    scale([1.01,1.008,1.1])
    import("painel-kitchen-aid-kua15a.3mf");
    
module base()
    difference(){
    main_panel();
    translate([-100,-100,0])
    cube([200,200,200]);
    }
    
module full() {
    main_panel();
    rotate([0,180,0])
    linear_extrude(height=2.5, scale=1.1)
        projection()
            base();
}

//import("painel-kitchen-aid-kua15a.3mf");
full();