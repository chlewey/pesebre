// chlewscenery

sky_sphere {
  pigment {
    gradient y
    pigment_map {
      [0.00 color <0,6,0>/45]
      [0.495 color <8,6,5>/45]
      [0.505 bozo
        pigment_map {
          [0.3 color rgb <4,5,10>/50 ]
          [0.7 color rgb <4,3, 2>/50 ]
          [1.0 color rgb <4,2, 1>/50 ]
        }
        scale 0.1   
        warp {
          turbulence 0.5
        }
      ]
      [1.00 bozo
        pigment_map {
          [0.3 color rgb <0,0,5>/50 ]
          [0.7 color rgb <6,6,6>/50 ]
          [1.0 color rgb <3,3,3>/50 ]
        }
        scale 0.1
        warp {
          turbulence 0.5
        }
      ]
    }
    scale 2
    translate -y
  }
}

#declare sunD = 5000000;
#declare sunR = pi*sunD/360;

#declare SunShape = sphere { <0,0,0> sunR
  texture{
    pigment {
      rgb <1,.9,0>
    }
    finish{
      ambient 0.9
    }
  }
}

#declare Sun = light_source {
  z*sunD color rgb 1.5
  area_light <-sunR,-sunR,0>, <sunR,sunR,0>, 5, 5
  adaptive 1
  //jitter
  looks_like { SunShape }
}