/* Single Wine Bottle Drying Rack
/  
*/
$fn = $preview ? 25:100;

// 1 Gallon Carboy
bottle_neck_od = 130;
bottle_neck_length = 95;
radial_top_wall_thickness = 3;
radial_bottom_wall_thickness = 12;
stand_length = 5;

/*
// 1 liter EZ Cap Bottle
bottle_neck_od = 59;
bottle_neck_length = 120;
radial_top_wall_thickness = 3;
radial_bottom_wall_thickness = 12;
stand_length = 5;
*/

/*
// 16 oz Estilo Swing Top Bottle
bottle_neck_od = 55;
bottle_neck_length = 110;
radial_top_wall_thickness = 3;
radial_bottom_wall_thickness = 12;
stand_length = 5;  
*/

/*
// User defined for new bottle types
bottle_neck_od = 59;
bottle_neck_length = 120;
radial_top_wall_thickness = 3;
radial_bottom_wall_thickness = 12;
stand_length = 5;
*/

top_od = bottle_neck_od+2*radial_top_wall_thickness;
bottom_od = 2*bottle_neck_od;

top_id = bottle_neck_od;
bottom_id = bottom_od - 2*radial_bottom_wall_thickness;

total_length = bottle_neck_length + stand_length;

theta = atan(2*total_length/(bottom_od-top_od));

module leg_cut() {
    hull() {
        translate([0,0,total_length-(top_id/2)-10])rotate([0,90,0])cylinder(h=bottom_od/2, d=top_id/2);
        translate([0,-(bottom_id-2)/2,-1])cube([bottom_od/2,bottom_id-2,1]);
    }
}

difference() {
    cylinder(h=total_length, d1=bottom_od, d2=top_od);

    // cut hole for bottle neck
    translate([0,0,-0.01])cylinder(h=total_length+0.02, d1=bottom_id, d2=top_id);

    // remove material for legs
    for (i=[0:360/3:360]) {
        rotate(i)leg_cut();
    }
}