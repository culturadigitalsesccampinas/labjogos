H=25;
L=20*sqrt(2);
l=4/sqrt(2);

module bloco(){
	rotate(45)
	rotate_extrude($fn=4)
	difference(){
		square([L/2,H]);

		translate([L/2,l*sqrt(2)])
		rotate(45) square([l,l], center=true);
	
		translate([L/2,H-l*sqrt(2)])
		rotate(45) square([l,l], center=true);
	}
}

module cardinal(){
	cardinal_mascara();
	cardinal_bico();
}

module cardinal_bico(){
	linear_extrude(height=2)
	import("cardinal.dxf", layer="bico");
}

module cardinal_mascara(){
	linear_extrude(height=1)
	import("cardinal.dxf", layer="mascara");
}

e = 1;
union(){
difference(){
	bloco();

	for (i=[0:3])
	rotate(i*90)
	translate([-10,10+0.1,3])
	rotate([90,0])
	linear_extrude(height=e)
	import("cardinal.dxf", layer="mascara");
}
	for (i=[0:3])
	rotate(i*90)
	translate([-10,10+e,3])
	rotate([90,0])
	linear_extrude(height=e)
	import("cardinal.dxf", layer="bico");
}
