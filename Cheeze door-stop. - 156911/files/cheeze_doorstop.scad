difference(){
	cube([150,50,50], center=true);
	translate([0,0,25]) rotate([0,15,0]) {cube([200,80,50], center=true);}
	
	translate([20,23,0]) sphere(r=15, $fn=50);
	translate([-25,25,0]) sphere(r=10, $fn=50);
	translate([-15,-18,0]) sphere(r=18, $fn=50);
	translate([30,-18,0]) sphere(r=12, $fn=50);
	translate([-49,-10,6]) sphere(r=13, $fn=50);
	//translate([-49,-15,0]) sphere(r=12, $fn=50);
	translate([5,-0,0]) sphere(r=5, $fn=50);
	translate([35,5,-10]) sphere(r=6, $fn=50);
	#translate([-35,5,8]) sphere(r=4, $fn=50);
	#translate([-55,8,12]) sphere(r=4, $fn=50);
	#translate([-45,15,12]) sphere(r=4, $fn=50);
	translate([-65,20,12]) sphere(r=8, $fn=50);
	#translate([-55,24,0]) sphere(r=4, $fn=50);
	translate([-5,25,-15]) sphere(r=6, $fn=50);
	#translate([-50,25,-15]) sphere(r=7, $fn=50);
	translate([-62,-22,0]) sphere(r=5, $fn=50);
	#translate([5,-25,-14]) sphere(r=6, $fn=50);
	translate([-55,-25,-15]) sphere(r=7, $fn=50);
	translate([-35,-24,-15]) sphere(r=4, $fn=50);
	translate([-75,-25,2]) sphere(r=7, $fn=50);
	translate([-75,25,-12]) sphere(r=7, $fn=50);
	translate([-75,0,-8]) sphere(r=12, $fn=50);
}