$fn = 100;

module torso(width, height, insertsHeight, insertWidth, insertDepth, screwHole, screwHead)
{
	corner = 2;
	screwHeadRecess = 4;
	difference()
	{
		union()
		{
			intersection()
			{
				hull()
				{
					translate([ (width * 0.5) - corner, (width * 0.5) - corner, corner ]) sphere(r = corner);
					translate([ -(width * 0.5) + corner, (width * 0.5) - corner, corner ]) sphere(r = corner);
					translate([ (width * 0.5) - corner, -(width * 0.5) + corner, corner ]) sphere(r = corner);
					translate([ -(width * 0.5) + corner, -(width * 0.5) + corner, corner ]) sphere(r = corner);

					translate([ (width * 0.5) - corner, (width * 0.5) - corner, height + corner ]) sphere(r = corner);
					translate([ -(width * 0.5) + corner, (width * 0.5) - corner, height + corner ]) sphere(r = corner);
					translate([ (width * 0.5) - corner, -(width * 0.5) + corner, height + corner ]) sphere(r = corner);
					translate([ -(width * 0.5) + corner, -(width * 0.5) + corner, height + corner ]) sphere(r = corner);
				}
				cube([ width, width, height * 2 ], center = true);
			}
			rotate([ 0, 0, 0 ]) insert(width, height, insertsHeight, insertWidth, insertDepth);
			rotate([ 0, 0, 90 ]) insert(width, height, insertsHeight, insertWidth, insertDepth);
			rotate([ 0, 0, 180 ]) insert(width, height, insertsHeight, insertWidth, insertDepth);
			rotate([ 0, 0, 270 ]) insert(width, height, insertsHeight, insertWidth, insertDepth);
		}
		cylinder(h = height * 2.1, r1 = screwHole, r2 = screwHole, center = true);
		cylinder(h = screwHeadRecess * 2, r1 = screwHead, r2 = screwHead, center = true);
		translate([ 0, 0, screwHeadRecess - 0.05 ]) cylinder(h = screwHead * 0.5, r1 = screwHead, r2 = screwHole, center = false);
		// uncomment to do a cut view
		//translate([ 0, width * 0.5, 0]) cube([ width * 2, width, (height + insertsHeight) * 3], center = true);
	}
}


module insert(width, height, insertsHeight, insertWidth, insertDepth, screwHole, screwHead)
{
	translate([ (width * 0.5) - (insertDepth * 0.5), 0, height + (insertsHeight * 0.5) ]) cube([ insertDepth, insertWidth, insertsHeight ], center = true);
}

torso(20, 15, 2, 5.5, 5.5, 3, 5.5);