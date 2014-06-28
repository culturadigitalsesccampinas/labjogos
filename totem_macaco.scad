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

module camada(nome, e, p=1){
		for (i=[0:3]){
			rotate(i*90)
			translate([-7.5,10+e-p,5])
			rotate([90,0])
			linear_extrude(height=e)
			translate([-0.5,0])
			scale(2.65)
			translate([0,-14.4])
			import("macaco.dxf", layer=nome);
		}
}

union(){
	difference(){
		bloco();
		camada("cabeca", 1, p=1-0.1);
	}
}
