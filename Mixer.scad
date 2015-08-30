module slider_peg() {
translate([0,0,4]) cube([1.15,4,8],center=true);
}

module dial_peg() {
translate([0,0,5])difference() { cylinder(r=3,h=10,center=true);
for (i=[0:5]) {
rotate(60*i)
translate([3,0,1]) cylinder(r=0.25,h=8,center=true);
}
}
}

module trapezoid(dimensions,slant_x,slant_y) {
translate([0,0,-dimensions[2]/2]) intersection() {
rotate([90,0,0]) 
translate([0,0,-dimensions[1]/2]) linear_extrude(height=dimensions[1])
polygon(points=[[-dimensions[0]/2,0],[dimensions[0]/2,0],[0,tan(90-slant_x)*dimensions[0]/2]]);
rotate([0,-90,0]) 
translate([0,0,-dimensions[0]/2]) linear_extrude(height=dimensions[0])
polygon(points=[[0,-dimensions[1]/2],[0,dimensions[1]/2],[tan(90-slant_y)*dimensions[1]/2,0]]);
translate([0,0,dimensions[2]/2])cube(dimensions,center=true);
}
}

module slider() {
difference() {
union() {
translate([0,0,3]) difference() {
translate([0,0,5]) trapezoid([16,23.5,10],20,20);
scale([0.5,1,1]) translate([0,0,57])sphere(r=50);
translate([7.75,0,0]) rotate([0,-110,0]) trapezoid([20,1,1],90,30);
translate([-7.75,0,0]) rotate([0,110,0]) trapezoid([20,1,1],90,30);
translate([0,0,8]) rotate([0,180,0]) trapezoid([20,2,2],90,30);
}
translate([0,0,1.5])cube([6,9,3],center=true);
}
slider_peg();
}
}

module dial() {
difference() {
union(){
translate([0,0,13/2+3.5])cylinder(r1=14/2,r2=12.5/2,h=13,center=true);
difference() {
translate([0,0,0])scale([1,1,1]) sphere(r=8);
translate([0,0,-100])cube([200,200,200],center=true);
}
}
for (i=[0:15]) {
rotate(360/18.5*(i+1.75))
translate([13/2,0,10])
rotate([0,90+atan(12/0.75),0]) 
cylinder(r=0.25,h=12.5,center=true);
}
translate([3+2.5,0,16])cube([5,0.5,3],center=true);
translate([6.5,0,14])cube([1,0.5,5],center=true);
translate([25,5,13+3.5]) scale([4,0.75,1]) cylinder(r=14/2,h=2,center=true);
translate([0,0,13+3.5])difference() {
cylinder(r=20,h=2,center=true);
cylinder(r=11.5/2,h=3,center=true);
}
translate([25,-5,13+3.5]) scale([4,0.75,1]) cylinder(r=14/2,h=2,center=true);
translate([0,0,31]) rotate([0,3.75,0]) cube([30,30,30],center=true);
dial_peg();
}
}

slider();
//dial();

$fn=50;