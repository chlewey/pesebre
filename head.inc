
#macro head(skin,hair,eyes,length,beard,ar)

union {
  #declare r0=12.5;
  #declare ll=length*r0;
  
  merge {
    difference {
      sphere { 0 r0 scale <1,1,.9> }
      plane { y 0 }
    }
    torus { 10 2.5 scale <1,1.2,.9> }
    sphere { 0 1 scale <8,9+4*ar,10-ar> translate <2.44,-5.92,0> }
    intersection {
      cone { <11.5,0,0> 1 <9.5,-10.5,0> 3 }
      sphere { <9.5,-4,0> 6.5 }
    }
    torus { 2 3 scale <1,.5,1> rotate z*90 rotate -y*45 translate <-2,-2, 8.5> }
    torus { 2 3 scale <1,.5,1> rotate z*90 rotate  y*45 translate <-2,-2,-8.5> }
    
    rotate z*16
    translate <2.5,-2.5,0>
    material { skin }
  }
  cylinder { -y*25 0 7.5 material { skin } }
  sphere { 0 3 material { eyes rotate <0,-15,-6> } translate <10,-2.5, 4> }
  sphere { 0 3 material { eyes rotate <0, 15,-6> } translate <10,-2.5,-4> }
  
  #declare r1=5*ll/3; #declare c1=r1+r0;

  #declare r2=5*ll/4;
  #declare c2=r0+3*ll/4+ll/3;
  #declare dx=ll*(12*r0-ll)/(6*r0-ll)/12;

  merge {
    difference {
      sphere { 0 r0 scale <1.01,1.01,.91> }
      plane { y 0 }
      plane { y 0 rotate z*24 }
      //cylinder { <1,0,-2> <1,0,2> 1 scale r0 scale <2,.5,1> }
    }
    #if(beard>0)
      sphere {
        0 1
        scale <8-beard/3,9+4*ar+beard,10-ar-beard/10>
        translate <2.44-beard/4,-5.92-beard,0>
        rotate z*16
      }
    #end
    intersection {
      difference {
        box {<2,0,-20><-r0-ll/3,-ll,20>}
        torus { c1 r1 }
      }
      torus { c2+dx r2 translate dx*x }
      scale <1.01,1.01,.91>
    }
    translate <2.5,-2.5,0>
    material { hair }
  }
  
  rotate y*90
}

#end


#declare skin_white = material {
  texture {
    pigment { rgb <1.0,0.75,0.7> }
  }
}

#declare skin_light = material {
  texture {
    pigment { rgb <0.8,0.55,0.4> }
  }
}

#declare skin_brown = material {
  texture {
    pigment { rgb <0.6,0.35,0.1> }
  }
}

#declare hair_black = material {
  texture {
    pigment { rgb <0.07,0.05,0.1> }
  }
}

#declare hair_brown = material {
  texture {
    pigment { rgb <0.5,0.3,0.1> }
  }
}

#declare hair_red = material {
  texture {
    pigment { rgb <0.9,0.55,0.35> }
  }
}

#declare hair_blonde = material {
  texture {
    pigment { rgb <1.0,0.9,0.5> }
  }
}
 
#declare hair_gray = material {
  texture {
    pigment { rgb <0.57,0.55,0.6> }
  }
}
 
#declare hair_white = material {
  texture {
    pigment { rgb <0.87,0.85,0.9> }
  }
}
 
#declare eyes_blue = material {
  texture {
    pigment { onion
      color_map {
        [0.05 color rgb 0]
        [0.05 color rgb <0,0,1>]
        [0.22 color rgb <.3,.7,1>]
        [0.22 color rgb 1]
      }
    }
    finish {
      reflection 0.1
    }
  }
  scale 4.5
  translate x*3
}

#declare eyes_green = material {
  texture {
    pigment { onion
      color_map {
        [0.05 color rgb 0]
        [0.06 color rgb <0.4,0.5,0.4>]
        [0.22 color rgb <0.55,0.8,0.4>]
        [0.22 color rgb 1]
      }
    }
    finish {
      reflection 0.1
    }
  }
  scale 4.5
  translate x*3
}

#declare eyes_gray = material {
  texture {
    pigment { onion
      color_map {
        [0.05 color rgb 0]
        [0.06 color rgb <0.4,0.5,0.4>]
        [0.22 color rgb <0.55,0.6,0.5>]
        [0.22 color rgb 1]
      }
    }
    finish {
      reflection 0.1
    }
  }
  scale 4.5
  translate x*3
}

#declare eyes_brown = material {
  texture {
    pigment { onion
      color_map {
        [0.05 color rgb 0]
        [0.06 color rgb <0.3,0.2,0.1>]
        [0.22 color rgb <0.4,0.3,0.1>]
        [0.22 color rgb 1]
      }
    }
    finish {
      reflection 0.1
    }
  }
  scale 4.5
  translate x*3
}

#declare eyes_black = material {
  texture {
    pigment { onion
      color_map {
        [0.05 color rgb 0]
        [0.06 color rgb <0.1,0.067,0.033>]
        [0.22 color rgb <0.1,0.075,0.025>]
        [0.22 color rgb 1]
      }
    }
    finish {
      reflection 0.1
    }
  }
  scale 4.5
  translate x*3
}
