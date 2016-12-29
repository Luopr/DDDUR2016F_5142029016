void page1(){
  colorMode(RGB,255);
  background(255);
  textAlign(CENTER);
  textFont(myfont1,40);
  fill(200,200,255);
  text("the type of swimmers",400,100);
  textFont(myfont1,24);
  fill(#C9C9C9);  
  text("the proportion of gender",270,150);
  text("the proportion of type",270,350);
  stroke(150);
  strokeWeight(5);
  
  fill(255,228,189);
  //rect(60,170,400,120);
  
  fill(178,77,255,80);
  //rect(60,170,400*Pgender[0],120);
  pushMatrix();
  translate(-265,100);
  scale(1.3,0.6);
  noStroke();
  rectMode(CENTER);
  fill(200,200,255);
  rect(400,300,300,100);
  
  fill(255);
  curve(250,220,250,250,300,250,300,220);
  fill(200,200,255);
  curve(300,280,300,250,350,250,350,280);
  fill(255);
  curve(350,220,350,250,400,250,400,220);
  fill(200,200,255);
  curve(400,280,400,250,450,250,450,280);
  fill(255);
  curve(450,220,450,250,500,250,500,220);
  fill(200,200,255);
  curve(500,280,500,250,550,250,550,280);
  
  popMatrix();
      
  pushMatrix();
  translate(60,170);
  text(int(round(100*Pgender[0]))+"%",60,30);
  scale(0.2,0.2);
  for(int i=0;i<8;i++){
    image(male,200*i,200);
  }
  popMatrix();
   
  pushMatrix();
  translate(60+400*Pgender[0],170);
  text(int(round(100*Pgender[1]))+"%",52,30);
  scale(0.2,0.2);
  image(female,0,200);
  image(female,200,200);
  popMatrix();
  rectMode(CORNER);
  rect(60,370,400,120);
  
  fill(59,59,59);
  rect(60,370,400*Ptype[0],120);
  text("bechalor",120,575);
  
  fill(150,148,198);
  rect(60+400*Ptype[0],370,400*Ptype[1],120);
  text("master",290,575);
  
  fill(255,99,135);
  rect(60+400*Ptype[0]+400*Ptype[1],370,400*Ptype[2],120);
  text("doctor",430,575);
  
  fill(#C9C9C9); 
  text(int(round(100*Ptype[0]))+"%",120,440);
  text(int(round(100*Ptype[1]))+"%",290,440);
  text(int(round(100*Ptype[2]))+"%",430,440);
  
  pushMatrix();
  translate(60,500);
  scale(0.3,0.3);
  image(bachelor,20,0);
  image(master,600,0);
  image(doctor,1100,0);
  popMatrix();
  changepage();
}


/////处理男女比数据并保存为csv
void swimmerstype(){  
  String[] account=(table.getStringColumn("account"));
  Gtype.addColumn("gender");
  Gtype.addColumn("number");
  Gtype.addRow();
  Gtype.addRow();
  Gtype.setString(0,"gender","male");
  Gtype.setString(1,"gender","female");
  Ttype.addColumn("type");
  Ttype.addColumn("number");
  Ttype.addRow();
  Ttype.addRow();
  Ttype.setString(0,"type","bachelor");
  Ttype.setString(1,"type","master");
  Ttype.setString(2,"type","doctor");
  int[] Gnum=new int[2];//the number of gender;
  int[] Tnum=new int[3];//the number of type;
  for(int i=0;i<account.length;i++){
    for(int j=0;j<Taccount.getRowCount();j++){
      if(account[i].equals(Taccount.getString(j,"account"))){
        if(Taccount.getString(j,"gender").equals("male")){
          Gnum[0]++;
        }
        if(Taccount.getString(j,"gender").equals("female")){
          Gnum[1]++;
        }
        if(Taccount.getString(j,"type").equals("bachelor")){
          Tnum[0]++;
        }
        if(Taccount.getString(j,"type").equals("master")){
          Tnum[1]++;
        }
        if(Taccount.getString(j,"type").equals("doctor")){
          Tnum[2]++;
        }
      }
    }
  }
  for(int i=0;i<2;i++){
    Gtype.setInt(i,"number",Gnum[i]);
  }
  for(int i=0;i<3;i++){
    Ttype.setInt(i,"number",Tnum[i]);
    saveTable(Ttype,"Ttype.csv");
  }
  Pgender=new float[2];
  Ptype=new float[3];
  for(int i=0;i<Pgender.length;i++){
    Pgender[i]=float(Gnum[i])/(Gnum[0]+Gnum[1]);
  }
  for(int i=0;i<Ptype.length;i++){
    Ptype[i]=float(Tnum[i])/(Tnum[1]+Tnum[2]+Tnum[0]);
  }
}