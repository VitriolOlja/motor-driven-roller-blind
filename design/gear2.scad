outer_diameter = 35;
inner_diameter = 4;
ring_height = 2;
num_holes = 16;
hole_diameter = 8;
hole_radius = outer_diameter / 2 ;


module ring2D() {
    difference() {
        // Outer ring shape
        difference() {
            circle(outer_diameter / 2, $fn=100);
            circle(inner_diameter / 2, $fn=100);
        }
        // Add circular cutouts
        for (i = [0 : 360 / num_holes : 360 - (360 / num_holes)]) {
            rotate(i)
                translate([hole_radius + hole_diameter / 4, 0])
                    circle(hole_diameter / 2, $fn=30);
                    
        }
    }
}

// Now extrude the entire 2D shape once
linear_extrude(height = ring_height){
    ring2D();
}