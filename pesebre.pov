
#declare standalone=0;

#declare cc = 10*clock;
//#declare cc = 4.8;
#declare ss = cc-int(cc);
#declare swp = -cos(ss*pi);
#declare l0=(1-swp)/2;
#declare l1=(1+swp)/2;

#declare camLoc=<90,340,-3600>;
#declare camAt=<0,110,100>;
#declare camAng=55;

#declare cl0=< -100,140,-1800>; #declare ca0=<   0,160,    0>; #declare aa0=50;
#declare cl1=<  100,340,-3600>; #declare ca1=<   0, 60,  100>; #declare aa1=55;
#declare cl2=<-1000,540,-1000>; #declare ca2=<1600,160,    0>; #declare aa2=10;
#declare cl3=<-1000,740, 1000>; #declare ca3=<1000,160,    0>; #declare aa3=15;
#declare cl4=< -300,140, 1000>; #declare ca4=<   0,260,  300>; #declare aa4=50;
#declare cl5=< 1200,140, 1500>; #declare ca5=<   0,300, -200>; #declare aa5=35;
#declare cl6=< 1500,240,  100>; #declare ca6=< 100,140,-1200>; #declare aa6=25;
#declare cl7=<  600,140,-1000>; #declare ca7=<   0,160, -200>; #declare aa7=35;
#declare cl8=< -100,140, -300>; #declare ca8=<   0, 50,  300>; #declare aa8=50;
#declare cl9=<  100,140, -100>; #declare ca9=<   0, 60,  100>; #declare aa9=35;
/*
#switch(cc)
  #range(0.0,0.99999)
    #declare camLoc=l0*cl0+l1*cl1;
    #declare camAt =l0*ca0+l1*ca1;
    #declare camAng=l0*aa0+l1*aa1;
    #break
  #range(1.0,1.99999)
    #declare camLoc=l0*cl1+l1*cl2;
    #declare camAt =l0*ca1+l1*ca2;
    #declare camAng=l0*aa1+l1*aa2;
    #break
  #range(2.0,2.99999)
    #declare camLoc=l0*cl2+l1*cl3;
    #declare camAt =l0*ca2+l1*ca3;
    #declare camAng=l0*aa2+l1*aa3;
    #break
  #range(3.0,3.99999)
    #declare camLoc=l0*cl3+l1*cl4;
    #declare camAt =l0*ca3+l1*ca4;
    #declare camAng=l0*aa3+l1*aa4;
    #break
  #range(4.0,4.99999)
    #declare camLoc=l0*cl4+l1*cl5;
    #declare camAt =l0*ca4+l1*ca5;
    #declare camAng=l0*aa4+l1*aa5;
    #break
  #range(5.0,5.99999)
    #declare camLoc=l0*cl5+l1*cl6;
    #declare camAt =l0*ca5+l1*ca6;
    #declare camAng=l0*aa5+l1*aa6;
    #break
  #range(6.0,6.99999)
    #declare camLoc=l0*cl6+l1*cl7;
    #declare camAt =l0*ca6+l1*ca7;
    #declare camAng=l0*aa6+l1*aa7;
    #break
  #range(7.0,7.99999)
    #declare camLoc=l0*cl7+l1*cl8;
    #declare camAt =l0*ca7+l1*ca8;
    #declare camAng=l0*aa7+l1*aa8;
    #break
  #range(8.0,8.99999)
    #declare camLoc=l0*cl8+l1*cl9;
    #declare camAt =l0*ca8+l1*ca9;
    #declare camAng=l0*aa8+l1*aa9;
    #break
  #range(9.0,9.99999)
    #declare camLoc=l0*cl9+l1*cl0;
    #declare camAt =l0*ca9+l1*ca0;
    #declare camAng=l0*aa9+l1*aa0;
    #break
  #default
    #declare camLoc=cl0;
    #declare camAt =ca0;
    #declare camAng=aa0;
#end
*/
#declare moonF=105;
#declare moonA=45;
#declare moonAcim = 15;
#declare moonAlt = 5;
#declare sunAcim = moonAcim+180;
#declare sunAlt = -5;

#include "sky.inc"
#include "head.inc"
#include "sunmoon.inc"

#declare brickwall = material {
  texture {
    pigment { brick <.6,.5,.3>,<.6,.3,.1> scale 2.56 }
  }
}

#declare brickwall_d = material {
  texture {
    pigment { brick <.3,.25,.15>,<.3,.15,.05> scale 2.56 }
  }
}

#declare brickwall_l = material {
  texture {
    pigment { brick <.9,.75,.45>,<.9,.45,.15> scale 2.56 }
  }
}

#declare woodenwall = material {
  texture {
    pigment { wood scale 2.56 rotate 30 }
  }
}

#declare golden = material {
  texture {
    pigment {
      rgb <0.8,0.75,0.25>
    }
    finish {
      reflection .35
      phong 0.9 phong_size 60 
    }
  }
}

#declare aurea = material {
  texture {
    pigment {
      rgbf <0.8,0.75,0.25,0.75>
    }
    finish {
      reflection .35
      phong 0.9 phong_size 60 
    }
  }
}

// Maria
#declare Maria = union {
  object { head(skin_light,hair_black,eyes_brown,2.3,0,0.8) translate y*150 }
  union {
    sphere { <-5,84,-25> 7 }
    sphere { < 5,84,-25> 7 }
    material { skin_light } 
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
    texture { pigment { rgb <.3,.7,.9> } }
  }
  sphere { 0 1 scale <20,20,1> translate <0,150,5> material { aurea } }
}

// Jose
#declare Jose = union {
  object { head(skin_light,hair_gray,eyes_black,1.5,1,1) translate y*160 }
  union {
    sphere { <-5,94,-25> 7 }
    sphere { < 5,94,-25> 7 }
    material { skin_light } 
  }
  merge {
    cone { y*135 7.5 0 40 }
    sphere { 0 1 scale <30,32.5,20> translate y*105 }
    difference {
      torus { 20 10 scale <1.25,1.3,1> }
      intersection {
        plane { <-1,0,.5> 0 }
        plane { <1,0,0.5> 0 }
      }
      rotate -x*45 translate <0,105,-10>
    }
    texture { pigment { rgb <.7,.9,.3> } } 
  }
  sphere { 0 1 scale <18,18,1> translate <0,160,5> material { aurea } }
}

// Jesus
#declare Jesus = union {
  object { head(skin_light,hair_black,skin_light,0,0,0.5) scale .7 translate y*53 }
  union {
    sphere { <-3,22,-12.5> 4 }
    sphere { < 3,22,-12.5> 4 }
    material { skin_light } 
  }
  merge {
    //cone { y*32.5 6 0 20 }
    sphere { 0 1 scale <15,20,10> translate y*20 }
    difference {
      torus { 10 5 scale <1.125,1.3,1> }
      intersection {
        plane { <-1,0,.5> 0 }
        plane { <1,0,0.5> 0 }
      }
      rotate -x*45 translate <0,27.5,-5>
    }
    texture { pigment { rgb <.9,.3,.7> } } 
  }
  sphere { 0 1 scale <25,25,1> translate <0,53,5> material { aurea } }
}

#declare Crib = difference {
  sphere { 0 1 scale <30,15,45> rotate -x*15 translate y*15 }
  sphere { 0 1 scale <16,25,11> translate y*20 rotate x*60 translate <0,20,-20> }
  texture { pigment { rgb <.9,.8,.6> } } 
}

// Santa
#declare Santa = union {
  object { head(skin_white,hair_white,eyes_blue,1,3,1) translate y*160 }
  union {
    sphere { <-5,94,-25> 7 }
    sphere { < 5,94,-25> 7 }
    material { skin_white } 
  }
  merge {
    sphere { 0 1 scale <30,65,25> translate y*70 }
    cone { y*135 7.5 0 20 }
    sphere { 0 1 scale <30,35,20> translate y*105 }
    difference {
      torus { 20 10 scale <1.25,1.3,1> }
      intersection {
        plane { <-1,0,.5> 0 }
        plane { <1,0,0.5> 0 }
      }
      rotate -x*45 translate <0,105,-10>
    }
    texture { pigment { rgb <.6,.0,.1> } } 
  }
}

// Kings
#declare Crown = difference {
    cylinder { 0, y*9.99, 9.99 }
    cone { 0, 9, y*10, 10 }
    prism { conic_sweep linear_spline
      0 1
      13
      #declare i=0;
      #while(i<=12)
        <sin(pi*i/6)*(1+mod(i,2)),cos(pi*i/6)*(1+mod(i,2))> 
        #declare i=i+1;
      #end
      scale 10
    }
}

#declare King1 = union {
  object { head(skin_white,hair_blonde,eyes_gray,2,1,1) translate y*160 }
  union {
    sphere { <-5,94,-25> 7 }
    sphere { < 5,94,-25> 7 }
    material { skin_white } 
  }
  merge {
    cone { y*135 7.5 0 40 }
    sphere { 0 1 scale <30,32.5,20> translate y*105 }
    difference {
      torus { 20 10 scale <1.25,1.3,1> }
      intersection {
        plane { <-1,0,.5> 0 }
        plane { <1,0,0.5> 0 }
      }
      rotate -x*45 translate <0,105,-10>
    }
    texture { pigment { rgb <.5,.1,.7> } }
    finish { reflection 0.1 } 
  }
  
  object { Crown
    translate <0,165.5,-2.5>
    material { golden }
  }
}

#declare King2 = union {
  object { head(skin_light,hair_gray,eyes_green,1.2,2,1) translate y*160 }
  union {
    sphere { <-5,94,-25> 7 }
    sphere { < 5,94,-25> 7 }
    material { skin_light } 
  }
  merge {
    cone { y*135 7.5 0 40 }
    sphere { 0 1 scale <30,32.5,20> translate y*105 }
    difference {
      torus { 20 10 scale <1.25,1.3,1> }
      intersection {
        plane { <-1,0,.5> 0 }
        plane { <1,0,0.5> 0 }
      }
      rotate -x*45 translate <0,105,-10>
    }
    texture { pigment { rgb <.9,.7,.3> } } 
    finish { reflection 0.1 } 
  }

  object { Crown
    translate <0,165.5,-2.5>
    material { golden }
  }
}

#declare King3 = union {
  object { head(skin_brown,hair_black,eyes_brown,0.5,1,1) translate y*160 }
  union {
    sphere { <-5,94,-25> 7 }
    sphere { < 5,94,-25> 7 }
    material { skin_brown } 
  }
  merge {
    cone { y*135 7.5 0 40 }
    sphere { 0 1 scale <30,32.5,20> translate y*105 }
    difference {
      torus { 20 10 scale <1.25,1.3,1> }
      intersection {
        plane { <-1,0,.5> 0 }
        plane { <1,0,0.5> 0 }
      }
      rotate -x*45 translate <0,105,-10>
    }
    texture { pigment { rgb <.9,.8,.7> } } 
    finish { reflection 0.1 } 
  }

  object { Crown
    translate <0,165.5,-2.5>
    material { golden }
  }
}

#declare Cammel = union {
  union {
    merge {
      sphere { 0 1 scale <20,39,20> rotate x*45 }
      intersection {
        torus { 45 15 }
        plane { -x 0 }
        plane { z 0 }
        rotate -z*90
        translate <0,10,55>
      }
      //cylinder { 0, z*40, 15 rotate x*22.5 }
      torus { 0.5 0.5 scale <10,8,20> rotate x*135 rotate -z*30 translate <15,20,16> }
      torus { 0.5 0.5 scale <10,8,20> rotate x*135 rotate z*30 translate <-15,20,16> }
      material { hair_brown } 
    }
    sphere { 0 3
      material { eyes_brown rotate 75*y rotate 10*x }
      translate < 8,8,-15>
    }
    sphere { 0 3
      material { eyes_brown rotate 105*y rotate 10*x }
      translate <-8,8,-15>
    }
    translate y*180
  }
  union {
    merge {
      sphere { 0 1 scale <45,50,90> translate <0,150,110> }
      sphere { 0 1 scale <30,40,30> translate <0,180,110> }
      material { hair_brown }
    }
    merge {
      cone { < 15,150, 60> 15 < 25,5, 50> 3 }
      cone { <-15,150, 60> 15 <-25,5, 50> 3 }
      cone { < 15,150,160> 15 < 25,5,170> 3 }
      cone { <-15,150,160> 15 <-25,5,170> 3 }
      material { hair_brown }
    }
    translate <0,-5,20>
  }
}

//object { Cammel rotate y*90 translate camLoc*0.8+camAt*0.2-100*y }


//Sheep
#declare Shepard = union {
  object { head(skin_light,hair_black,eyes_brown,0,0,0.6667) translate y*130 }
  union {
    sphere { <-4,75,-22.5> 6 }
    sphere { < 4,75,-22.5> 6 }
    material { skin_light } 
  }
  merge {
    cone { y*105 7.5 0 30 }
    sphere { 0 1 scale <20,22.5,15> translate y*85 }
    difference {
      torus { 15 7.5 scale <1.25,1.3,1> }
      intersection {
        plane { <-1,0,.5> 0 }
        plane { <1,0,0.5> 0 }
      }
      rotate -x*45 translate <0,85,-10>
    }
    texture { pigment { rgb <.9,.8,.7> } } 
  }
}

#declare Sheep = union {
  union {
    merge {
      sphere { 0 1 scale <12.5,15,10> rotate x*22.5 }
      cylinder { 0, z*20, 7.5 rotate x*22.5 }
      torus { 0.5 0.5 scale <5,4,10> rotate x*105 rotate -z*30 translate <10,10,8> }
      torus { 0.5 0.5 scale <5,4,10> rotate x*105 rotate z*30 translate <-10,10,8> }
      material { hair_gray } 
    }
    sphere { 0 2.5
      material { eyes_brown rotate 75*y rotate 10*x }
      translate < 4,4,-7>
    }
    sphere { 0 2.5
      material { eyes_brown rotate 105*y rotate 10*x }
      translate <-4,4,-7>
    }
    translate y*60
  }
  union {
    merge {
      sphere { 0 1 scale <30,25,45> translate <0,45,55> }
      sphere { 0 1 scale <12,8,10> translate <0,67,4> }
      material { hair_white }
    }
    merge {
      cone { < 10,50,30> 5 < 20,1,25> 3 }
      cone { <-10,50,30> 5 <-20,1,25> 3 }
      cone { < 10,50,80> 5 < 20,1,85> 3 }
      cone { <-10,50,80> 5 <-20,1,85> 3 }
      material { hair_gray }
    }
  }
}

// chimenea
#declare Media = union {
  intersection {
    prism { conic_sweep bezier_spline
      0 1
      32
      <-5,17> <-2,17> < 2,17> < 5,17>
      < 5,17> < 5,14> < 5,10> < 5, 7>
      < 5, 7> < 5, 4> < 7, 2> <10, 2>
      <10, 2> <12, 2> <13, 1> <13,-1>
      <13,-1> <13,-3> <11,-5> <10,-5>
      <10,-5> < 7,-5> < 3,-5> < 0,-5>
      < 0,-5> <-3,-5> <-5,-3> <-5, 0>
      <-5, 0> <-5, 6> <-5,11> <-5,17>
    }
    box { <-6,1.1,-6> <14,0.9,18> }
    rotate z*180 rotate -x*90
    pigment { red 2/3 }
  }
  intersection {
    prism { conic_sweep bezier_spline
      0 1
      32
      <-4.5, 5> <-1.5, 5> < 1.5, 5> < 4.5, 5>
      < 4.5, 5> < 5.5, 5> < 6.5, 4> < 6.5, 3>
      < 6.5, 3> < 6.5, 1> < 6.5,-1> < 6.5,-3>
      < 6.5,-3> < 6.5,-4> < 5.5,-5> < 4.5,-5>
      < 4.5,-5> < 1.5,-5> <-1.5,-5> <-4.5,-5>
      <-4.5,-5> <-5.5,-5> <-6.5,-4> <-6.5,-3>
      <-6.5,-3> <-6.5,-1> <-6.5, 1> <-6.5, 3>
      <-6.5, 3> <-6.5, 4> <-5.5, 5> <-4.5, 5>
    }
    box { <-6,1.2,-6> <14,0.8,18> }
    translate z*20
    rotate z*180 rotate -x*90
    material { hair_white }
  }
}

#declare Chimenea = union {
  difference {
    merge {
      box { <-15,60,20> <15,300,60> }
      box { <-40,10, 0> <40, 62,61> }
      material { brickwall }
    }
    merge {
      box { < -7,45,30> < 7,301,50> }
      box { <-25,17,-1> <25, 55,50> }
      material { brickwall_d } 
    }
  }
  object { Media rotate z*15 translate <-20,40,-2> }
  object { Media rotate z*15 translate <  5,40,-2> }
  object { Media rotate z*15 translate < 30,40,-2> }
}

#declare Tree = union {
  merge {
    #declare it=0;
    #while(it<6)
      cone { <0,125-20*it,0> 11+6*it <0,150-20*it,0> 5*it }
      #declare it=it+1;
    #end
    pigment { green 0.6 }
  }
  intersection {
    sphere { <0,15,0> 20 }
    box { <-25,0,-25> <25,10,25>}
    material { golden }
  }
  cylinder { <0,1,0> <0,100,0> 4
    pigment { rgb <.5,.3,.1> }
  }
}

#declare Menorah=union {
  merge {
    intersection {
      union {
        torus{ 10 1 }
        torus{ 20 1 }
        torus{ 30 1 }
        rotate x*90
        translate y*45
      }
      plane { y 45 }
    }
    cylinder { y*45, y*5, 1.5 }
    cone { y*6, 1, 0, 5 }
    material { golden }
  }
  light_source { <-30,47,0> rgb <.09,.06,0> looks_like { sphere { 0 1 scale <.6,3,.6> pigment { rgbf <1.2,1.1,0.9,0.6> } } } }
  light_source { <-20,47,0> rgb <.09,.06,0> looks_like { sphere { 0 1 scale <.6,3,.6> pigment { rgbf <1.2,1.1,0.9,0.6> } } } }
  light_source { <-10,47,0> rgb <.09,.06,0> looks_like { sphere { 0 1 scale <.6,3,.6> pigment { rgbf <1.2,1.1,0.9,0.6> } } } }
  light_source { <  0,47,0> rgb <.09,.06,0> looks_like { sphere { 0 1 scale <.6,3,.6> pigment { rgbf <1.2,1.1,0.9,0.6> } } } }
  light_source { < 10,47,0> rgb <.09,.06,0> looks_like { sphere { 0 1 scale <.6,3,.6> pigment { rgbf <1.2,1.1,0.9,0.6> } } } }
  light_source { < 20,47,0> rgb <.09,.06,0> looks_like { sphere { 0 1 scale <.6,3,.6> pigment { rgbf <1.2,1.1,0.9,0.6> } } } }
  light_source { < 30,47,0> rgb <.09,.06,0> looks_like { sphere { 0 1 scale <.6,3,.6> pigment { rgbf <1.2,1.1,0.9,0.6> } } } }
}

#declare Manger = union {
  object { Chimenea translate <0,0,300> }
  object { Tree translate <-150,0,250> }
  object { Menorah translate <5,60,306> }
  difference {
    merge {
      box { <-395,0,320> <395,255,335> }
      box { <-385,0,-245> <-360,255,345> }
      box { < 360,0,-245> < 385,255,345> }
      box { <-395,0,-235> <395,255,-210> }
      material { woodenwall }
    }
    box { <-40,10,300> <40,62,360> }
    cylinder { <0,0,-250> <0,0,-200> 200 }
    plane { -y 1 rotate  z*25 translate y*250 }
    plane { -y 1 rotate -z*25 translate y*250 }
  }
  intersection {
    difference {
      intersection {
        plane { y 5 rotate  z*25 translate y*250 }
        plane { y 5 rotate -z*25 translate y*250 }
      }
      intersection {
        plane { y 0 rotate  z*25 translate y*250 }
        plane { y 0 rotate -z*25 translate y*250 }
      }
    }
    box { <-400,0,-250> <400,300,350> }
    pigment { rgb <.7,.6,.4> }
  }
}

#declare Star = intersection {
  prism { linear_spline -1, 1,
    11
    #declare ii=0;
    #declare sq=(sqrt(5)-1)/2;
    #while(ii<=10)
      <sin(pi*ii/5)*(sq+mod(ii,2)),cos(pi*ii/5)*(sq+mod(ii,2))>
      #declare ii=ii+1;
    #end
  }
  sphere { 0 1 scale <sq+1,1,sq+1> }
  rotate x*90
  scale <20,20,5>
}

#declare Burro = union {
  union {
    merge {
      sphere { 0 1 scale <20,35,20> rotate x*22.5 }
      cylinder { <-2,0,0> <2,0,0> 1 scale <1,35,20> rotate x*22.5 translate <0,10,10> }
      cylinder { 0, z*50, 15 rotate x*22.5 }
      torus { 0.5 0.5 scale <7,6,20> rotate x*105 rotate -z*30 translate <12,30,12> }
      torus { 0.5 0.5 scale <7,6,20> rotate x*105 rotate z*30 translate <-12,30,12> }
      material { hair_gray } 
    }
    sphere { 0 3
      material { eyes_brown rotate 60*y rotate 10*x }
      translate < 10,6,-15>
    }
    sphere { 0 3
      material { eyes_brown rotate 120*y rotate 10*x }
      translate <-10,6,-15>
    }
    translate y*70
  }
  union {
    merge {
      sphere { 0 1 scale <50,40,80> translate <0,40,110> }
      sphere { 0 1 scale <12,8,10> translate <0,67,4> }
      material { hair_gray }
    }
    merge {
      cone   { < 30,30, 50> 15 < 40,10, 20> 10 }
      sphere { < 40,10, 20> 10 }
      cone   { < 40,10, 20> 10 < 50,10, 60>  5 }
      sphere { < 50,10, 60> 10 }
      
      cone   { <-30,30, 50> 15 <-40,10, 20> 10 }
      sphere { <-40,10, 20> 10 }
      cone   { <-40,10, 20> 10 <-50,10, 60>  5 }
      sphere { <-50,10, 60> 10 }

      cone   { <-30,30,170> 15 <-40,10,200> 10 }
      sphere { <-40,10,200> 10 }
      cone   { <-40,10,200> 10 <-50,10,160>  5 }
      sphere { <-50,10,160> 10 }

      cone   { < 30,30,170> 15 < 40,10,200> 10 }
      sphere { < 40,10,200> 10 }
      cone   { < 40,10,200> 10 < 50,10,160>  5 }
      sphere { < 50,10,160> 10 }

      material { hair_gray }
    }
  }
}

#declare Buey = union {
  union {
    merge {
      sphere { 0 1 scale <22,32,20> rotate x*22.5 }
      cylinder { 0, z*50, 12 rotate x*22.5 }
      torus { 0.5 0.5 scale <7,6,15> rotate x*105 rotate -z*70 translate <20,20,12> }
      torus { 0.5 0.5 scale <7,6,15> rotate x*105 rotate z*70 translate <-20,20,12> }
      material { hair_brown } 
    }
    sphere { 0 3
      material { eyes_brown rotate 60*y rotate 10*x }
      translate < 10,6,-15>
    }
    sphere { 0 3
      material { eyes_brown rotate 120*y rotate 10*x }
      translate <-10,6,-15>
    }
    merge {
      intersection {
        torus { 40 5 }
        plane { z 0 }
        plane { x 0 }
      }
      sphere { -40*x 5 }
      cone { -40*x 5 <-40,0,20> 2 }
      sphere { -40*z 5 }
      cone { -40*z 5 <20,0,-40> 2 }
      
      rotate -y*45
      rotate -x*80
      translate <0,65,15>
      material { skin_light }
    }
    
    translate y*70
  }
  union {
    merge {
      sphere { 0 1 scale <50,40,80> translate <0,40,110> }
      sphere { 0 1 scale <12,8,10> translate <0,67,4> }
      material { hair_brown }
    }
    merge {
      cone   { < 30,30, 50> 15 < 40,10, 20> 10 }
      sphere { < 40,10, 20> 10 }
      cone   { < 40,10, 20> 10 < 50, 5, 65>  5 }
      
      cone   { <-30,30, 50> 15 <-40,10, 20> 10 }
      sphere { <-40,10, 20> 10 }
      cone   { <-40,10, 20> 10 <-50, 5, 65>  5 }

      cone   { <-30,30,170> 15 <-40,10,200> 10 }
      sphere { <-40,10,200> 10 }
      cone   { <-40,10,200> 10 <-50, 5,155>  5 }

      cone   { < 30,30,170> 15 < 40,10,200> 10 }
      sphere { < 40,10,200> 10 }
      cone   { < 40,10,200> 10 < 50, 5,155>  5 }

      material { hair_brown }
    }
    translate -z*10
  }
}


// Scene
plane { y 0  texture { pigment { rgb <0.6,0.5,0.2> } finish { reflection .075 } } }

object { Maria translate z*200 rotate y*15 }   
object { Jose translate z*200 rotate -y*15 }
object { Jesus rotate x*60 translate <0,20,80> }   
object { Crib translate z*100 }

object { Burro rotate y*120 translate < 100,0,50> }
object { Buey rotate -y*120 translate <-100,0,50> }

object { Santa rotate y*150 translate <40,240,300> }

//object { Star translate <0,275,-200> material { golden } }

object { Manger }


union {
  object { King1 }
  object { Cammel translate z*120 }
  rotate y*60
  translate x*1000
}
union {
  object { King2 }
  object { Cammel translate z*120 }
  rotate y*60
  translate x*1300
}
union {
  object { King3 }
  object { Cammel translate z*120 }
  rotate y*60
  translate x*1600
}


#declare is=0;
#while(is<18)
  object { Shepard translate z*(1000+100*is) rotate y*(75+is*100) }
  object { Sheep translate z*(1100+100*is) rotate y*(77+is*100) }
  object { Sheep translate z*(1050+100*is) rotate y*(80+is*100) }
  object { Sheep translate z*(1030+100*is) rotate y*(70+is*100) }
  #declare is=is+1;
#end


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
light_source { camLoc+5*y rgb 0.5 }

light_source { < 250,110,0> rgb <.15,.1,0> looks_like { sphere { 0 5 pigment { rgb <1.5,1.4,1.2> } } } }
light_source { <   0,220,0> rgb <.15,.1,0> looks_like { sphere { 0 5 pigment { rgb <1.5,1.4,1.2> } } } }
light_source { <-250,110,0> rgb <.15,.1,0> looks_like { sphere { 0 5 pigment { rgb <1.5,1.4,1.2> } } } }

light_source { <0,300,-200> rgb 1 looks_like { Star material { golden } } }