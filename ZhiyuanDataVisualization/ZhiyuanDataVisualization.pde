//////////////罗培荣   5142029016 致远游泳馆数据可视化
  PFont myfont1;
  PFont myfont2;
  PFont myfont3;
  int p=0;
  PImage logo;
  PImage male;
  PImage female;
  PImage bachelor;
  PImage master;
  PImage doctor;
  Table Ttype;
  Table table;
  Table Ttime;
  Table Tdatenum;
  Table Ttimenum;
  Table Tfrequence;
  Table Tfrenum;
  Table Gtype;
  Table Tspend;
  Table Taccount;
  float[] Pgender;
  float[] Ptype;
  String[] spenda,spendb,spendc;
  float[] Pspend;
  int month;
  int date;
  int monthdate;
  int[] datenum;
  String[] datec;
  int[] octnum,novnum,decnum,jannum,monthnum;
  String[] timec;
  int[] timenum;
void setup(){
  Ttype=new Table();
  Gtype=new Table();
  Tfrenum=new Table();
  Tfrequence=new Table();
  Ttimenum=new Table();
  Tdatenum=new Table();
  Ttime = new Table();
  Tspend= new Table();
  Pspend=new float[4];
  Taccount=loadTable("account.csv","header");
  table=loadTable("致远游泳馆数据.csv","header");  
  size(800,600);
  logo=loadImage("logo.png");
  male=loadImage("male.png");
  female=loadImage("female.png");
  bachelor=loadImage("bachelor.png");
  master=loadImage("master.png");
  doctor=loadImage("doctor.png");
  myfont1=loadFont("Arial-Black-48.vlw");
  myfont2=createFont("Alias",32);
  myfont3=createFont("MicrosoftYaHeiLight",32);
  swimmerstype();
  spend();
  timedata();
}
////////////////turn to other pages//////////
void draw(){
  pageJudge();
}
////////judge the page////////////
void pageJudge(){
  switch(p){
    case 0:
    page0();
    break;
    
    case 1:
    page1();
    break;
    
    case 2:
    page2();
    break;
    
    case 3:
    page3();
    break;
    
    case 4:
    page4();
    break;
    
    case 5:
    exit();
    break;
    
  }
}

void changepage(){
  colorMode(HSB,100);
  strokeWeight(5);
  stroke(0,40,100);
  fill(0,70,100);
  ellipse(760,270,30,30);
  stroke(255);
  fill(0,0,100);
  triangle(755,265,755,275,765,270);
  
  strokeWeight(5);
  stroke(16,40,100);
  fill(16,70,100);
  ellipse(760,320,30,30);
  textAlign(CENTER,CENTER);
  fill(0,0,100);
  textSize(15);
  text("1",760,320);
  
  strokeWeight(5);
  stroke(33,40,100);
  fill(33,70,100);
  ellipse(760,370,30,30);
  textAlign(CENTER,CENTER);
  fill(0,0,100);
  text("2",760,370);
  
  strokeWeight(5);
  stroke(50,40,100);
  fill(50,70,100);
  ellipse(760,420,30,30);
  textAlign(CENTER,CENTER);
  fill(0,0,100);
  text("3",760,420);
  
  strokeWeight(5);
  stroke(67,40,100);
  fill(67,70,100);
  ellipse(760,470,30,30);
  fill(0,0,100);
  text("4",760,470);
  
  strokeWeight(5);
  stroke(67,40,100);
  fill(67,70,100);
  ellipse(760,520,30,30);
  fill(0,0,100);
  strokeWeight(2);
  rect(755,515,10,10);
  
  
  if(mousePressed==true){
    for(int i=0;i<6;i++){
      if((mouseX-760)*(mouseX-760)+(mouseY-270-50*i)*(mouseY-270-50*i)<225){
        p=i;
      }
    }
  }
  
  colorMode(RGB,255);
}