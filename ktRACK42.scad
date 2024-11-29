//
// ktRACK42
//
 
gap1 = 0.001;
gap2 = 0.002;
th = 2;

//bot
x = 43;
y = 37;
z = 25;
h = 33+5;

//cntrl
CW = 50;
CH = 120;//123;
CD = 32;

//sw
SW = 44;
SH = 23;
SH2 = SH*2.5;
SD = 24;//33;

SCW = 42.5;
SCH = 34.5;


//box
BW = 62;
BH = 170;//172;
BD = h+th;


base();
//case();


module case()
{
//color("blue")
{
difference()
{
    union()
    {
        translate([-th-1/2, -th-1/2, 0]) cube([BW+th*2+1, BH+th*2+1, h]);
    }
    translate([-1/2, -1/2, -gap1]) cube([BW+1, BH+1, h-th]);
    //wire
    translate([BW-th*3-8, BH-th-15+4, 0]) cube([8, 15+5, 20]);
    //bot
    translate([th+SW, th, 0]) bot_base();
    translate([th+SW, th, 30]) bot_base();
    
    translate([th, th+x/2-SCH/2, BD-5]) cube([SCW+3, SCH, 10]);
    
    
    //translate([-20, 60, 0]) cube([200, 200, 200]);
    
}
translate([th+SW-th-1/2, -1, 0]) cube([th, th+1, h]);
translate([th+SW-th-1/2, -1, 0]) rotate([0, -0.3, 0]) cube([th, th+1, h]);
translate([th+1, th+x/2-SCH/2+SCH, BD-5-15+1]) cube([SCW, th, 15]);
}
}

module base()
{
difference()
{
    union()
    {
        translate([0, 0, 0]) cube([BW, BH, 30]);
        translate([th+SW, th, 0]) bot_base();
    }
    //wire
    translate([th, x+th*2, th]) cube([5, CH, CD]);
    translate([th, BH-th-15-1-15, th]) cube([15, 15+15, CD]);
    translate([BW-th*3-8, BH-th-15+4, th+12]) cube([8, 15, CD]);
    //ctrl
    translate([th+5+th, x+th*2, th]) cube([CW, CH, CD]);
    //sw
    translate([th, th+x/2-SH/2, th]) sw();
    
    translate([th+SW-th-1, 0, 0]) cube([th+1, th+1, 30]);
    
    //neji
    translate([BW/2+3,  BH-20+10, -gap1]) cylinder(r1=6/2, r2=6/2, h=th+gap2, $fn=100);
    translate([BW/2+3,  BH/3-5, -gap1]) cylinder(r1=6/2, r2=6/2, h=th+gap2, $fn=100);
    
    translate([17, 70, -5]) cube([33, 70, 10]);
    
    //translate([0, 40, 0]) cube([200, 200, 200]);
    
}
}


module sw()
{
translate([0, 0, 5])
difference()
{
    union()
    {
        translate([0, 0, 0]) cube([SW, SH2, SD]);
        translate([    0, 0, -5]) cube([12, SH2, 5]);
        translate([SW-12, 0, -5]) cube([12, SH2, 5]);
    }
    translate([-5+1, -gap1, 14.75]) cube([5, SH2+gap2, 2]);
    translate([SW-1, -gap1, 14.75]) cube([5, SH2+gap2, 2]);
    
}
translate([0, SH, 0]) cube([SW, SH, SD+5]);
}



module bot_base()
{
translate([y-1, 0, h]) rotate([0, 0, 90])
{
difference()
{
    union()
    {
        translate([-th, -th, -h]) cube([x+th*2, y+th*1-1, z+h-15]);
    }
    //bot
    translate([0, 0, -gap1]) cube([x, y, z+gap2]);
    
    translate([x/2-5/2-3, y+th-13+gap1, -10-gap1]) cube([10, 13, z+10+gap2]);
    
    translate([x/2-(SCH+1)/2, y-3, -7]) cube([SCH+1, SCW, 10]);
}
translate([0, 0, 0]) cube([x, 14, 1]);
}
}

