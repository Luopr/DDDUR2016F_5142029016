void page2(){
  background(255);
  textAlign(CENTER);
  textFont(myfont1,40);
  fill(200,200,255);
  text("the spend distribution",400,100);
  strokeWeight(3);
  stroke(180,180,255);
  line(100,150,100,500);
  line(95,160,100,150);
  line(105,160,100,150);
  line(100,500,630,500);
  line(620,495,630,500);
  line(620,505,630,500);
  
  textAlign(RIGHT);
  textSize(12);
  textFont(myfont3,15);
  text("人数(人)",100,150);
  
  textAlign(LEFT,BOTTOM);
  text("消费(元)",630,500);
  
  int[] Snum=int(Tspend.getStringColumn("number"));
  String[] spendc=Tspend.getStringColumn("spend");
  float[] pointX=new float[spendc.length];
  float[] pointY=new float[spendc.length];
  for(int i=0;i<spendc.length;i++){
    pushMatrix();
    pointX[i]=100+(i+1)*500/26;
    pointY[i]=-35*log(Snum[i]);
    translate(pointX[i],500);
    strokeWeight(7);
    stroke(200,200,255);
    point(0,pointY[i]);
    
    strokeWeight(5);
    stroke(180,180,255);
    point(0,pointY[i]);
    
    strokeWeight(1);
    stroke(220,220,255);
    line(0,0,0,pointY[i]);
    
    rotate(PI/6);
    textFont(myfont1,12);
    textAlign(LEFT,TOP);
    fill(180,180,255);
    text(int(spendc[i])/100,0,10);
    popMatrix();
    if(abs(mouseX-pointX[i])<5&&abs(mouseY-500-pointY[i])<5){
      textAlign(CENTER,BOTTOM);
      fill(40);
      text(Snum[i],pointX[i],500+pointY[i]-5);
    }
  }
  for(int i=0;i<spendc.length-2;i++){   
    while(Snum[i]==1){
      i++;
    }
    int j=i+1;
    while(Snum[j]==1){
      j++;
    }
    strokeWeight(1);
    stroke(220,220,255);
    line(pointX[i],500+pointY[i],pointX[j],500+pointY[j]);
  }
  changepage();
}
void spend(){
  String[] spenda=(table.getStringColumn("spend"));
  String[] spendb=(table.getStringColumn("spend"));
  String[] spendc={};
  Tspend.addColumn("spend");
  Tspend.addColumn("number");
  for(int i=0;i<spenda.length;i++){
    for(int j=0;j<i;j++){
      if(spenda[i].equals(spenda[j])){
        spenda[i]="";
      }    
    }  
  }
  for(int i=0;i<spenda.length;i++){
    if(spenda[i]!=""){
      spendc=append(spendc,spenda[i]);
    }
  }
  for(int i=0;i<spendc.length;i++){
    Tspend.addRow();
    Tspend.setString(i,"spend",spendc[i]);
    Tspend.setInt(i,"number",0);
  }
  int[] Snum=new int[spendc.length];
  for(int i=0;i<spendc.length;i++){
    for(int j=0;j<spendb.length;j++){
      if(spendc[i].equals(spendb[j])){
        Snum[i]++;
      }
    }
  }
    /////////////////////排序~////////////
  for(int i=0;i<spendc.length;i++){
    for(int j=0;j<i;j++){
      if(int(spendc[i])<int(spendc[j])){
        String sc=spendc[i];
        int sn=Snum[i];
        spendc[i]=spendc[j];
        Snum[i]=Snum[j];
        spendc[j]=sc;
        Snum[j]=sn;
      }
    }
  }
  for(int i=0;i<spendc.length;i++){
    Tspend.setString(i,"spend",spendc[i]);
    Tspend.setInt(i,"number",Snum[i]);
  }
  saveTable(Tspend,"Tspend.csv");
}

  