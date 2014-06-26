altura = 5.5;
R = 25;
c = 28;

H1 = altura*0.5;
H2 = altura;
n=4;

module base()
{
rotate(45)cylinder(h=(H2+5), r=(((1.25*R)*3)+4.8), $fn=n);
}

module base2()
{
rotate(45)translate([0,0,-1])cylinder(h=H2, r=(((1.25*R)*3)+9.8), $fn=n);
}

module celula()
{
cylinder(h=H2-2, r=c, $fn=n);
}

module bloco(){
	hull(){
			cylinder(h=H1, r=R, $fn=n);
			cylinder(h=H2-1, r=R/2, $fn=n);
		
	}
}


k=1.27*sqrt(2);

for (i=[-1,0,1]){
  for (j=[-1,0,1]){
    translate([(k*i*R), (k*R*j)]){
		
		
		difference()
		{
			rotate(45)color("red")celula();
			rotate([180,0,45])translate([0,0,-(H2)])color("grey")bloco();
			
		}
		

  	} 
  }
}



difference()
{

	color("blue")base2();	
	color("green")base();		
		
		
}


