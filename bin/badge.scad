resize([50,50,5])
  mirror()
    intersection() {
      scale([1,1,10])
        surface(file = "badge.dat", convexity = 5);
      translate([0,0,-300]) scale([1,1,1000])
        surface(file = "badge-shape.dat", convexity = 5);
    }
