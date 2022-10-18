PImage pu1,pu2,pu3,pd1,pd2,pd3,pl1,pr1,pl2,pr2,pl3,pr3,e1al,e1ar,e1bl,e1br,e1cl,e1cr,e1dr,e1dl,e2,e3,background1,background2,background3,start1;
int backy=600;
int backy2=600;
int pcounter=0;
int pdir=1;
int e1counter=0;
int e1dir=1;
final int dead = 0;
final int active = 1;
final int end=2;
final int start=3;
int gamemode=start;
int lives=3;
int enemycounter=2;
int score=0;
ArrayList<alien> enemies = new ArrayList<alien>();
int enemytype=1;
void setup()
{   
size(1000,950); 
start1 = loadImage("start1.png");
start1.resize(width,height);
background1 = loadImage("cwb11.png");  
background1.resize(600,200);
background2 = loadImage("cwb18.png");  
background2.resize(width,height);
background3 = loadImage("cwb13.png");  
background3.resize(1000,500);
enemycounter=2;
player = new mainchar(480,100,0,0,false,false);
enemies.add(new alien((int)random(900.50),900,3,-3));
enemytype=2;

} 
 
void draw () 
{ 
 image(background2,0,0);

if(gamemode==active){
image(background1,400, backy);
 image(background3,0,backy2);
backy =backy-3;     
if(backy == -210) {          
backy=600;
}
backy2 =backy2-1;     
if(backy2 == -500) {          
backy2=600;
}
fill(255);
    textSize(32);
    textAlign(CENTER);
    text("Score: "+str(score),850,50);
    textAlign(CENTER);

for (int i = 0; i < enemies.size(); i++) {
  enemies.get(i).update();
}

player.update();
}

if(gamemode==dead){
  for (int i = enemies.size()-1; i>=0; i--) {
  enemies.remove(i);
  }
  if (lives==0){
    gamemode=end; 
  }
  else{
    fill(0);
    rect(100,350,800,100);
    fill(255);
    textSize(32);
    textAlign(CENTER);
    text("You Have "+str(lives)+" Lives Left. Press Enter To Continue.",500,400);
    textAlign(CENTER);
  }
}
if(gamemode==end){
 fill(0);
    rect(100,350,800,100);
    fill(255);
    textSize(32);
    textAlign(CENTER);
    text("Game Over",500,400);
    text("Score: "+str(score),500,450);
    textAlign(CENTER);
}
if(gamemode==start){
  lives=3;
  image(start1,0,0);
}
}

class mainchar
{
   int x;
   int y;
   int xdirection;
   int ydirection;
   boolean xfacing;
   boolean yfacing;
  mainchar(int x, int y, int xdirection, int ydirection, boolean xfacing, boolean yfacing){
    this.x=x;
    this.y=y;
    this.xdirection=xdirection;
    this.ydirection=ydirection;
    this.xfacing=xfacing;
    this.yfacing =yfacing;
    pr1 =loadImage("pigb1.png");
    pr2 =loadImage("pigb2.png");
    pr3 =loadImage("pigb3.png");
    pl1 =loadImage("piga1.png");
    pl2 =loadImage("piga2.png");
    pl3 =loadImage("piga3.png");
    pu1 =loadImage("pigc1.png");
    pu2 =loadImage("pigc2.png");
    pu3 =loadImage("pigc3.png");
    pd1 =loadImage("pigd1.png");
    pd2 =loadImage("pigd2.png");
    pd3 =loadImage("pigd3.png");
  }
  void update(){
    for (int i = 0; i < enemies.size(); i++) {
    if ((abs(this.x-enemies.get(i).x) < 50  &&  abs(this.y-enemies.get(i).y) < 100)==true){
      lives=lives-1;
      gamemode=dead;
    }
    }
  render();
  move();
  }
  
  void move(){

    if ((x==0 && player.xdirection==-10)||(x==width-50 && player.xdirection==10)||(y==100 && player.ydirection==-5)||(y==850 && player.ydirection==5))
   { 
   }
   else {x=x + player.xdirection;
         y=y + player.ydirection;
 }
   
  }

  boolean xcrash(int x)
   {
      return x>(width-25) || x<=25; 
   }
  void render(){
   if(pcounter==31){
     pdir=-1;
     pcounter=30;
   }
   if(pcounter==-1){
     pdir=1;
     pcounter=0;
   }
    if((this.yfacing==true)&&(pcounter>=0 && pcounter<=10))
   {
  image(pd1,x,y);
  pd1.resize(50,50);
  pcounter=pcounter+pdir;
   }
   else if((this.yfacing ==true)&&(pcounter>10 && pcounter<=20))
   {
  image(pd2,x,y);
  pd2.resize(50,50);
  pcounter=pcounter+pdir;
   }
    else if((this.yfacing ==true)&&(pcounter>20 && pcounter<=30))
   {
  image(pd3,x,y);
  pd3.resize(50,50);
  pcounter=pcounter+pdir;
   }
   else if(this.ydirection ==0 && this.xfacing==false && (pcounter>=0 && pcounter<=10))
   {
  image(pr1,x,y);
  pr1.resize(50,50);
  pcounter=pcounter+pdir;
   }
   else if(this.ydirection ==0 && this.xfacing==true &&(pcounter>=0 && pcounter<=10))
   {
  image(pl1,x,y);
  pl1.resize(50,50);
  pcounter=pcounter+pdir;
   }
    else if(this.ydirection ==0 && this.xfacing==false &&(pcounter>10 && pcounter<=20))
   {
  image(pr2,x,y);
  pr2.resize(50,50);
  pcounter=pcounter+pdir;
   }
   else if (this.ydirection==0 && this.xfacing==true &&(pcounter>10 && pcounter<=20)){
  image(pl2,x,y);
  pl2.resize(50,50);
  pcounter=pcounter+pdir;
   }
    else if(this.ydirection ==0 && this.xfacing==false &&(pcounter>20 && pcounter<=30))
   {
  image(pr3,x,y);
  pr3.resize(50,50);
  pcounter=pcounter+pdir;
   }
   else if (this.ydirection==0 && this.xfacing==true &&(pcounter>20 && pcounter<=30)){
  image(pl3,x,y);
  pl3.resize(50,50);
  pcounter=pcounter+pdir;
   }
   else{
     if(pcounter>=0 && pcounter<=10){
       image(pu1,x,y);
       pu1.resize(50,50);
       pcounter=pcounter+pdir;
   }
   else if(pcounter>10 && pcounter<=20){
       image(pu2,x,y);
       pu2.resize(50,50);
       pcounter=pcounter+pdir;
   }
   else if(pcounter>20 && pcounter<=30){
       image(pu3,x,y);
       pu3.resize(50,50);
       pcounter=pcounter+pdir;
   }
  }
  }
}
class alien{
  int x;
  int y;
  int speedx;
  int speedy;
  
  alien(int x, int y, int speedx, int speedy){
   this.x=x;
   this.y=y;
   this.speedx=speedx;
   this.speedy=speedy;
    e1ar =loadImage("ghostar.png");
   e1al =loadImage("ghostal.png");
   e1br =loadImage("ghostbr.png");
   e1bl =loadImage("ghostbl.png");
   e1cr =loadImage("ghostcr.png");
   e1cl =loadImage("ghostcl.png");
   e1dr =loadImage("ghostdr.png");
   e1dl =loadImage("ghostdl.png");
   e3=loadImage("rocket1a.png");
   e2=loadImage("spacea.png");
  }
  void render(){
      if(e1counter==41){
     e1dir=-1;
     e1counter=40;
   }
   if(e1counter==-1){
     e1dir=1;
     e1counter=0;
   }
    if(this.speedx ==3 && this.speedy ==-3)
   {
    if(e1counter>=0 && e1counter<=10){
      image(e1ar,x,y);
      e1ar.resize(50,50);
      e1counter=e1counter+e1dir;
    }
    if(e1counter>10 && e1counter<=20){
      image(e1br,x,y);
      e1br.resize(50,50);
      e1counter=e1counter+e1dir;
    }
    if(e1counter>20 && e1counter<=30){
      image(e1cr,x,y);
      e1cr.resize(50,50);
      e1counter=e1counter+e1dir;
    }
    if(e1counter>30 && e1counter<=40){
      image(e1dr,x,y);
      e1dr.resize(50,50);
      e1counter=e1counter+e1dir;
    }
   }
   else if(this.speedx ==-3 && this.speedy ==-3)
   {
  if(e1counter>=0 && e1counter<=10){
      image(e1al,x,y);
      e1al.resize(50,50);
      e1counter=e1counter+e1dir;
    }
    if(e1counter>10 && e1counter<=20){
      image(e1bl,x,y);
      e1bl.resize(50,50);
      e1counter=e1counter+e1dir;
    }
    if(e1counter>20 && e1counter<=30){
      image(e1cl,x,y);
      e1cl.resize(50,50);
      e1counter=e1counter+e1dir;
    }
    if(e1counter>30 && e1counter<=40){
      image(e1dl,x,y);
      e1dl.resize(50,50);
      e1counter=e1counter+e1dir;
    }
   }
    else if(this.speedy ==0)
   {
  image(e2,x,y);
  e2.resize(50,50);
   }
    else if(this.speedx ==0 && this.speedy ==-5)
   {
  image(e3,x,y);
  e3.resize(50,50);
   }
  
  }
   boolean crash(alien other)
   {
     return (abs(this.x-other.x) < 100  &&  abs(this.y-other.y) < 100);
   }
  boolean xcrash(int x)
   {
      return (x>(width-50)&& speedy!=0) || x<=0; 
   }
  void move(){
    x=x-speedx;
    y=y+speedy;
      if (xcrash(x)==true)
   {
     speedx=-speedx;
   }
   for (int i = 0; i < enemies.size(); i++) {
    if (((abs(this.x-enemies.get(i).x) < 50  &&  abs(this.y-enemies.get(i).y) < 100))&&this != enemies.get(i)==true){
      speedx=-speedx;
    }
    }
   
    if (y<=-50 || x>=1050 ||x==-48){
      if (enemycounter==0){
        if (enemytype==1){
          enemies.add(new alien((int)random(900.50),900,3,-3));
          enemytype=2;  
          score = score +100;
        }
        else if(enemytype==2){
          enemies.add(new alien(0,(int)random(850.50),-3,0));
          enemytype=3;
          score = score +500;
        }
        else{
          enemies.add(new alien((int)random(900.50),900,0,-5));
          enemytype=1;
          score=score+200;
        }
        enemycounter=2*enemies.size();
      }
       else{
         enemycounter=enemycounter-1;
       }
       if(speedy==0){
         x=0;
         y=(int)random(850.50);
         score = score+200;
       }
       else{
      x=((int)random(900.50));
      y=900;}
      score=score+300;
    }
  }
  void update(){   
      render();
      move();  
  
}
}
 void keyPressed(){
  if (key == CODED){
    if(keyCode == LEFT){
      player.xdirection=-10;
      player.xfacing=false;
    }
    if(keyCode == RIGHT){
      player.xdirection=10;
      player.xfacing=true;
    } 
    if(keyCode == DOWN){
      player.ydirection=5;
      player.yfacing=true;
    } 
    if(keyCode == UP){
      player.ydirection=-5;
      player.yfacing=false;
    } 
  }
  }
   void keyReleased(){
  if (key == CODED){
    if(keyCode == LEFT){
      player.xdirection=0;
    }
    if(keyCode == RIGHT){
      player.xdirection=0;
    } 
    if(keyCode == DOWN){
      player.ydirection=0;
      player.yfacing=false;
    } 
    if(keyCode == UP){
      player.ydirection=0;
    }   
  }
   if(gamemode==dead && keyCode == ENTER){
    setup();
    gamemode=active;
  }
  if(gamemode==start && keyCode == ENTER){
    gamemode=active;
  }
  if(gamemode==end && keyCode == ENTER){
    setup();
    gamemode=start;
  }
  } 
mainchar player;
