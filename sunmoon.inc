
#ifndef(sunD) #declare sunD = 5000000;           #end
#ifndef(sunR) #declare sunR = 0.5*radians(sunD); #end

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

#ifndef(moonF) #declare moonF = 60; #else #declare withmoon=1; #end
#ifndef(moonA) #declare moonA = 45; #else #declare withmoon=1; #end

#declare MoonShape = union {
  sphere { <0,0,0> sunR
    texture{
      pigment {
        rgbf <1,1,1,0.95>
      }
      finish{
        ambient 0.9
      }
    }
  }
  difference {
    sphere { <0,0,0> sunR*0.9995
    texture{
      pigment {
        rgb 0.9
      }
      finish{
        ambient 0.9
      }
    }
    }
    plane { z 0
      rotate moonF*x
      pigment { rgb 0 }
    } 
    rotate -moonA*z
  }
}

#declare Sun = light_source {
  z*sunD color rgb 1.5
  area_light <-sunR,-sunR,0>, <sunR,sunR,0>, 5, 5
  adaptive 1
  //jitter
  looks_like { SunShape }
}

#declare Moon = light_source {
  z*sunD color rgb 0.5
  area_light <-sunR,-sunR,0>, <sunR,sunR,0>, 5, 5
  adaptive 1
  //jitter
  looks_like { MoonShape }
}

#ifndef(sunAcim) #declare sunAcim = 150;          #end // acimut of Sun (clockwise angle from z axis)
#ifndef(sunAlt)  #declare sunAlt  = 53;          #end // elevation of Sun (from plan x-z) 

#ifndef(moonAcim) #declare moonAcim = 0;  #else #declare withmoon=1; #end // acimut of Moon (clockwise angle from z axis)
#ifndef(moonAlt)  #declare moonAlt  = 10; #else #declare withmoon=1; #end // elevation of Moon (from plan x-z) 

#ifndef(nosun)
  // main light: the Sun
  light_source { Sun
    rotate -x*sunAlt
    rotate y*sunAcim
  }
#end

#ifdef(withmoon)
  // main light: the Sun
  light_source { Moon
    rotate -x*moonAlt
    rotate y*moonAcim
  }
#end

// filling light
light_source { 10000*y rgb 0.6
  fade_distance 5000
  fade_power 1
  shadowless
  rotate -x*sunAlt
  rotate y*sunAcim
}

