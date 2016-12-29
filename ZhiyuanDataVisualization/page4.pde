void page4(){
  background(255);
  textAlign(CENTER);
  textSize(40);
  fill(200,200,255);
  String[] timec;
  int[] timenum;
  timec=Ttimenum.getStringColumn("time");
  timenum=int(Ttimenum.getStringColumn("num"));
  text("average swimmers flow",400,100);
   
  stroke(255,240,100);
  fill(255,240,100);
  for(int i=0;i<timec.length;i++){    
    fill(255,240,100);
    arc(150,270,50+75*log(int(timenum[i])),50+75*log(int(timenum[i])),(i-6)*PI/12+PI/180,(i-5)*PI/12-PI/180);
    fill(0);
    textAlign(CENTER,CENTER);
    textSize(12);
    text(timec[i],150+60*sin(i*PI/12+PI/24),270-60*cos(i*PI/12+PI/24));
  }
  fill(255);
  noStroke();
  ellipse(150,270,30,30);
  noFill();
  noStroke();
  stroke(255,240,100,100);
  ellipse(150,270,120,120);
  ellipse(150,270,30,30);
  strokeWeight(45);
  stroke(255,120);
  ellipse(150,270,75,75);
  stroke(255,80);
  strokeCap(SQUARE);
  arc(150,270,165,165,-PI/2,PI/2,OPEN);
  stroke(255,40);
  arc(150,270,255,255,-PI/2,PI/2,OPEN);
  stroke(0,40);
  arc(150,270,255,255,PI/2,3*PI/2,OPEN);
  stroke(0,80);
  arc(150,270,165,165,PI/2,3*PI/2,OPEN);

  
  
  noStroke();
  fill(0);
  arc(150,270,120,120,PI/2,3*PI/2);
  fill(255);
  arc(210,270,120*sqrt(2),120*sqrt(2),3*PI/4,5*PI/4,OPEN);
  
  fill(255,240,90);
  textSize(32);
  text("time",150,270);
  
  changepage();
}