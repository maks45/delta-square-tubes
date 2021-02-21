include<thread_module.scad>;

inner_diameter = 2;
outer_diameter = 4.5;
fitting_diameter = 5.2;
polygons = 60;

///body module
module body(){
translate([0,0,0])
rotate([90,0,0])
//cylinder(d=9.5, h=10, $fn = polygons);
    metric_thread(diameter = 9.7, length = 10);

translate([0,0,0])
rotate([-90,0,-20])
cylinder(d=9.5, h=15, $fn = polygons);

translate([0,0,0])
rotate([-90,0,20])
cylinder(d=9.5, h=15, $fn = polygons);
}
///hole module
module hole(){
union(){
///fitting hooles
rotate([-90,0,20])
translate([0,0,10])
metric_thread(diameter = fitting_diameter, length = 5.1);
rotate([-90,0,-20])
translate([0,0,10])
        metric_thread(diameter = fitting_diameter, length = 5.1);
///filament_holes    
    
translate([0,0,0])
rotate([90,0,0])
cylinder(d=outer_diameter, h=10.1, $fn = polygons);

translate([0,0,0])
rotate([-90,0,20])
cylinder(d=inner_diameter, h=10.1, $fn = polygons);

translate([0,0,0])
rotate([-90,0,20])
    difference(){
            cylinder(d=outer_diameter, h=10.1, $fn = polygons);
            translate([0,-5,0])
            cube([10,10,11]);
        }
        

translate([0,0,0])
rotate([-90,0,-20])
cylinder(d=inner_diameter, h=10.1, $fn = polygons);
    
translate([0,0,0])
rotate([-90,0,-20])
    difference(){
            cylinder(d=outer_diameter, h=10.1, $fn = polygons);
            translate([-10,-5,0])
            cube([10,10,11]);
        }
}
}
///result
difference(){
    body();
    hole();
}

//metric_thread(diameter=8, pitch=1, length=40);