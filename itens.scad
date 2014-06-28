//%cube(12);

module base(n){
	linear_extrude(height=3)
	scale(3.54)
	translate([0,-35.4])
	import("itens.dxf", layer=str("base",n));
}

module detalhe(n){
	linear_extrude(height=4)
	scale(3.54)
	translate([0,-35.4])
	import("itens.dxf", layer=str("detalhe",n));
}

if (1){
//hull(){
	base(1);
	detalhe(1);
//}
}

if(1){
//hull(){
	base(2);
	detalhe(2);
//}
}

if(1){
//hull(){
	base(3);
	detalhe(3);
//}
}