
#declare nosun=1;
#declare moonAcim=45;
#declare moonAlt=7.5;
#declare moonA=60;
#declare moonF=75;

#include "sky.inc"
#include "head.inc"
#include "sunmoon.inc"

#macro candle(a,l,r)

union {
  cylinder { 0, l*y, r/2
    material {
      texture {
        pigment { rgb .9 }
      }
    }
  }
  cylinder { (l*0.99)*y, (l*1.075)*y, 0.0375
    material {
      texture {
        pigment { rgb .1 }
      }
    }
  }

  #declare dx=rand(a)*l/50;
  #declare dy=rand(a)*l/50;
  #declare dz=rand(a)*l/50;
   light_source {
    (l*1.1)*y+<dx,dy,dz> rgb <9+rand(a),8+rand(a),4+rand(a)>/150
    looks_like {
      sphere { 0 1
        scale <0.2,0.6+dy,0.2>
        texture {
          pigment { color rgbf <1.2,1.1,0.6,0.4> }
          //finish { ambient rgb .5 }
        }
      }
    }
  }
}

#end // macro candle
#declare R=seed(100+int(300*clock));

#declare Lucia = union {
  object { head(skin_white,hair_blonde,eyes_gray,2.3,0,0.8) translate y*150 }
  union {
    sphere { <-5,84,-25> 7 }
    sphere { < 5,84,-25> 7 }
    material { skin_white } 
  }
  merge {
    cone { y*125 7.5 0 40 }
    sphere { 0 1 scale <30,27.5,20> translate y*100 }
    difference {
      torus { 20 10 scale <1.25,1.3,1> }
      intersection {
        plane { <-1,0,.5> 0 }
        plane { <1,0,0.5> 0 }
      }
      rotate -x*45 translate <0,95,-10>
    }
    texture { pigment { rgb .95 } }
  }
  #declare ii=0;
  torus { 11 1
    translate <0,155,-2.5>
    material {
      texture {
        pigment { rgb .9 }
        finish { reflection 0.05 }
      }
    }
  }
  #while(ii<360)
    object { candle(R,10,1) translate <0,155,-10> rotate y*ii translate -2.5*z }
    #declare ii = ii+60;
  #end
}

object { Lucia
  translate 300*x
  rotate (360*clock)*y
  translate y*(abs(sin(clock*pi/15)))
}

object { Lucia
  translate 250*x
  rotate (360*clock-20)*y
  translate y*(abs(sin(clock*pi/15+1)))
}

object { Lucia
  translate 350*x
  rotate (360*clock-19)*y
  translate y*(abs(sin(clock*pi/15-1)))
}


object { Lucia
  translate 250*x
  rotate (360*clock-40)*y
  translate y*(abs(sin(clock*pi/15+2)))
}

object { Lucia
  translate 350*x
  rotate (360*clock-39)*y
  translate y*(abs(sin(clock*pi/15-2)))
}


#declare camLoc = <3,185,-200>;
#declare camAt = <300*cos(2*pi*clock),150,-300*sin(2*pi*clock)>;
#declare camAng = 50;

#declare velon=union {
  object { candle(R,30,3) translate 100*y }
  merge {
    cone { 0,10 20*y,2 }
    sphere { 20*y,5 }
    cylinder { 21*y 84*y 2 }
    sphere { 85*y,3 }
    cone { 85*y,2 100*y,5 }
    material {
      texture {
        pigment { rgb <.9,.8,.3> }
        finish { reflection 0.2 }
      }
    }
  }
}

#declare ij=-4;
#while(ij<4)
  object { velon translate <400,0,-100*ij> } // 400,400; 400,300; 400,200; 400,100; 400,0; 400,-100; 400,-200; 400,-300
  object { velon translate <-100*ij,0,-400> } // -400,-400; -300,-400
  object { velon translate <-400,0,100*ij> }
  object { velon translate <100*ij,0,400> }
  #declare ij=ij+1;
#end

box { <-609.5,-10,-609.5> <609.5,-0.01,609.5>
  material {
    texture {
      pigment { checker color rgb .2 color rgb .8 scale 30.48 }
      finish { reflection 0.1 }
    }
  }
}

//camera
camera {
  location camLoc
  look_at camAt 
  angle camAng
  aperture 1.2
  focal_point camAt
  blur_samples 7
  right 16/9*x
  up y
}

// flash
light_source { camLoc+5*y rgb 0.3 }
