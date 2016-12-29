void page0(){
  background(255);
  image(logo,115,50);
  
  textFont(myfont1,40);
  textAlign(CENTER);
  fill(0,0,255,50);
  text("Data Visualization",400,250);
  
  textFont(myfont1,40);
  textAlign(CENTER);
  fill(0,0,255,50);
  text("Of Swimmers",400,330);
  
  strokeWeight(5);
  stroke(20,20,255,50);
  fill(255);
  ellipse(400,500,150,150);
  
  textFont(myfont2,32);
  textAlign(CENTER);
  fill(100);
  text("Start",400,510);
  
  if((mouseX-400)*(mouseX-400)+(mouseY-500)*(mouseY-500)<75*75){
    fill(0,0,255,20);
    ellipse(400,500,150,150);
    textFont(myfont2,34);
    textAlign(CENTER);
    text("Start",400,510);
    if(mousePressed){
      p=1;
    }
  }
}
