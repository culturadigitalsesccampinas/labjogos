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
			import("rat.dxf", layer=nome);
		}
}

union(){
	difference(){
		bloco();
		camada("cabeca", 1, p=1-0.1);
	}
	camada("olhos", 0.5+0.5);
	camada("boca", 1);
	camada("boca2", 1.5);
	camada("bigode", 0.5+1);
	camada("focinho", 2+0.5);
	camada("dente", 2);
}
