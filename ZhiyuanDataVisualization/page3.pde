void page3(){
  background(255);
  if(monthdate==0){
    monthchoose();
  }
  if(monthdate!=0){
    datechoose();
  }
  changepage();
}
void monthchoose(){
    textAlign(CENTER);
    textFont(myfont1,40);
    fill(200,200,255);
    text("swimmer flow each day",400,100);
    stroke(0);
    strokeWeight(1);
    fill(255);
    rect(150,150,198,198,5,5,5,5);
    rect(352,150,198,198,5,5,5,5);
    rect(150,352,198,198,5,5,5,5);
    rect(352,352,198,198,5,5,5,5);
    
    fill(0);
    textAlign(CENTER,CENTER);
    text("Oct",250,250);
    text("Nov",450,250);
    text("Dec",250,450);
    text("Jan",450,450);
  
  if(abs(mouseX-249)<100&&abs(mouseY-249)<100){
    fill(220);
    rect(150,150,198,198,5,5,5,5);
    fill(0);
    textSize(42);
    text("Oct",250,250);
    if(mousePressed){
      monthdate=1;
      month=0;
      datechoose();
    }
  }
  if(abs(mouseX-451)<100&&abs(mouseY-249)<100){
    fill(220);
    rect(352,150,198,198,5,5,5,5);
    fill(0);
    textSize(42);
    text("Nov",450,250);
    if(mousePressed){
      monthdate=1;
      month=1;
      datechoose();
    }
  }
  if(abs(mouseX-249)<100&&abs(mouseY-451)<100){
    fill(220);
    rect(150,352,198,198,5,5,5,5);
    fill(0);
    textSize(42);
    text("Dec",250,450);
    if(mousePressed){
      monthdate=1;
      month=2;
      datechoose();
    }
  }
  if(abs(mouseX-451)<100&&abs(mouseY-451)<100){
    fill(220);
    rect(352,352,198,198,5,5,5,5);
    fill(0);
    textSize(42);
    text("Jan",450,450);
    if(mousePressed){
      monthdate=1;
      month=3;
      datechoose();
    }
  }
}
void datechoose(){ 
  background(255);
  textAlign(CENTER);
  textFont(myfont1,36);
  String[] monthtext={"Oct","Nov","Dec","Jan"};
  fill(180,180,240);
  text(monthtext[month],400,100);
  
  for(int i=0;i<255;i++){
    noStroke();
    fill(120,120,255,i);
    rect(50,150+i*400.0/255,20,400.0/255);
  }
  
  textAlign(CENTER,CENTER);
  textSize(18);
  fill(200,200,255);
  text(80,100,150);
  text(270,100,550);
  
  strokeWeight(1);
  stroke(220,220,255);
  fill(255);
  rect(150,150,400,400,5,5,5,5);
  
  strokeWeight(1);
  stroke(220,220,255);
  for(int i=1;i<7;i++){
    for(int j=1;j<7;j++){
      line(150,150+i*400/7,550,150+i*400/7);
      line(150+j*400/7,150,150+j*400/7,550-400/7);
    }
  }
  fill(200,200,255);
  textAlign(CENTER,CENTER);
  textSize(28);
  if(abs(mouseX-350)<110&&abs(550-200/7-mouseY)<18){
    fill(255,255,0);
    if(mousePressed){
      monthdate=0;
    }
  }
  text("choose month",350,550-200/7);
    
  int date=0;
  String[] oct={"Mon","Tue","Wed","Thur","Fri","Sat","Sun","","","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","","","","","","","","",""};
  String[] nov={"Mon","Tue","Wed","Thur","Fri","Sat","Sun","","","","","","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","","","","","","","","","",""};
  String[] dec={"Mon","Tue","Wed","Thur","Fri","Sat","Sun","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","","","","","","","","","","","",""};
  String[] jan={"Mon","Tue","Wed","Thur","Fri","Sat","Sun","","","","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","","","","","","","","",""};
  String[] monthstring={};
  int[] monthnum={};
  switch(month){
    case 0:
    monthstring=oct;
    monthnum=octnum;
    break;
    case 1:
    monthstring=nov;
    monthnum=novnum;
    break;
    case 2:
    monthstring=dec;
    monthnum=decnum;
    break;
    case 3:
    monthstring=jan;
    monthnum=jannum;
    break;
  }
  for(int j=0;j<7;j++){
    for(int i=0;i<7;i++){ 
      if(j>0&&monthstring[date]!=""&&monthnum[int(trim(monthstring[date]))]!=0){        
        fill(120,120,255,map(monthnum[int(trim(monthstring[date]))],80,471,0,255));
        strokeWeight(1);
        stroke(220,220,255);
        rect(150+i*400/7,150+j*400/7,400/7,400/7);
        }
      textAlign(CENTER,CENTER);
      textSize(20);
      fill(60);
      text(monthstring[date],150+i*400/7+200/7,150+200/7+j*400/7);
      date++;
    }
    }
  changepage();
}

void timedata(){
  Ttime.addColumn("date");
  Ttime.addColumn("time");
  table=loadTable("致远游泳馆数据.csv","header");
  String[] timerow=table.getStringColumn("time");
  String[] date=new String[timerow.length];
  String[] time=new String[timerow.length];
  for(int i=0;i<timerow.length;i++){
    int indexof=timerow[i].indexOf(" ");
    date[i]=trim(timerow[i].substring(0,indexof));
    time[i]=trim(timerow[i].substring(indexof));
    Ttime.addRow();
    Ttime.setString(i,"date",date[i]);
    Ttime.setString(i,"time",time[i]);
  }

  
  /////////////create the table datenum:the number of each date;
  String[] dateb=Ttime.getStringColumn("date");
  String[] datea=Ttime.getStringColumn("date");
  String[] datec={};

  for(int i=0;i<datea.length;i++){
    for(int j=0;j<i;j++){
      if(datea[i].equals(dateb[j])){
        datea[i]="";
      }
    }
  }
  for(int i=0; i<datea.length; i++){
  if(datea[i] != "" ) {
    datec = append(datec, datea[i]);
  }
 } 

 int[] datenum=new int[datec.length];
 for(int i=0;i<datec.length;i++){
   for(int j=0;j<dateb.length;j++){
     if(dateb[j].equals(datec[i])){
       datenum[i]++;
     }
   }
 }
 Tdatenum.addColumn("date");
 Tdatenum.addColumn("num");
 for(int i=0;i<datenum.length;i++){
   Tdatenum.addRow();
   Tdatenum.setString(i,"date",datec[i]);
   Tdatenum.setInt(i,"num",datenum[i]);
 }
//////////the num of each hour;/////
 String[] timea = Ttime.getStringColumn("time");
 for(int i=0;i<timea.length;i++){
   if(timea[i].length()==5){
     timea[i]=timea[i].substring(0,2);
   }
   else{
     timea[i]=timea[i].substring(0,1);
   }
 } 
  for(int i=0;i<timea.length;i++){
    for(int j=0;j<i;j++){
      if(int(timea[i])<int(timea[j])){
        String order=timea[i];
        timea[i]=timea[j];
        timea[j]=order;
      }
    }
  }
 String[] timeb = Ttime.getStringColumn("time");
  for(int i=0;i<timeb.length;i++){
  if(timeb[i].length()==5){
    timeb[i]=timeb[i].substring(0,2);
  }
  else{
    timeb[i]=timeb[i].substring(0,1);
  }
 }
  for(int i=0;i<timeb.length;i++){
   for(int j=0;j<i;j++){
     if(int(timeb[i])<int(timeb[j])){
       String order=timeb[i];
       timeb[i]=timeb[j];
       timeb[j]=order;
     }
   }
 }
 String[] timec={};
 for(int i=0;i<timea.length;i++){
   for(int j=0;j<i;j++){
     if(timea[i].equals(timeb[j])){
       timea[i]="";
     }
   }
 }
 for(int i=0;i<timea.length;i++){
   if(timea[i] !=""){
     timec = append(timec, timea[i]);
   }
 }
 int[] timenum=new int[timec.length];
 for(int i=0;i<timec.length;i++){
   for(int j=0;j<timeb.length;j++){
     if(timec[i].equals(timeb[j])){
       timenum[i]++;
     }
   }
 }
 Ttimenum.addColumn("time");
 Ttimenum.addColumn("num");
 for(int i=0;i<timenum.length;i++){
   Ttimenum.addRow();
   Ttimenum.setString(i,"time",timec[i]);
   Ttimenum.setInt(i,"num",timenum[i]);
 }
 /////////////////the frequence of swimmer////////////
 //String[] accounta=table.getStringColumn("account");
 //String[] accountb=table.getStringColumn("account");
 //String[] accountc={};
 //for(int i=0;i<accounta.length;i++){
 //  for(int j=0;j<i;j++){
 //    if(accounta[i].equals(accountb[j])){
 //      accounta[i]="";
 //    }
 //  }
 //}
 //for(int i=0;i<accounta.length;i++){
 //  if(accounta[i]!=""){
 //    accountc=append(accountc,accounta[i]);
 //  }
 //}
 //int[] frequencenum=new int[accountc.length];
 //for(int i=0;i<accountc.length;i++){
 //  for(int j=0;j<accountb.length;j++){
 //    if(accountc[i].equals(accountb[j])){
 //      frequencenum[i]++;
 //    }
 //  }
 //}
 //Tfrequence.addColumn("account");
 //Tfrequence.addColumn("frequence");
 //for(int i=0;i<accountc.length;i++){
 //  Tfrequence.addRow();
 //  Tfrequence.setString(i,"account",accountc[i]);
 //  Tfrequence.setInt(i,"frequence",frequencenum[i]);
 //}
 //////////////////频率分布////////////
 //String[] frea=Tfrequence.getStringColumn("frequence");
 //String[] freb=Tfrequence.getStringColumn("frequence");
 //String[] frec={};
 //for(int i=0;i<frea.length;i++){
 //  for(int j=0;j<i;j++){
 //    if(frea[i].equals(freb[j])){
 //      frea[i]="";
 //    }
 //  }
 //}
 //for(int i=0;i<frea.length;i++){
 //  if(frea[i]!=""){
 //    frec=append(frec,frea[i]);  
 //  }
 //}
 //int[] frenum=new int[frec.length];
 //for(int i=0;i<frec.length;i++){
 //  for(int j=0;j<freb.length;j++){
 //    if(frec[i].equals(freb[j])){
 //      frenum[i]++;
 //    }
 //  }
 //}
 //Tfrenum.addColumn("frequence");
 //Tfrenum.addColumn("num");
 //for(int i=0;i<frec.length;i++){
 //  Tfrenum.addRow();
 //  Tfrenum.setString(i,"frequence",frec[i]);
 //  Tfrenum.setInt(i,"num",frenum[i]);
 //}
////////////save all Table////////////
 saveTable(Tfrenum,"Tfrenum.csv");
 saveTable(Ttimenum,"Ttimenum.csv");
 saveTable(Tdatenum,"Tdatenum.csv");
 saveTable(Ttime,"Ttime.csv");
 saveTable(Tfrequence,"Tfrequence.csv");
 
 ////////////////
  octnum=new int[32];
  novnum=new int[32];
  decnum=new int[32];
  jannum=new int[32];
   for(int i=0;i<datec.length;i++){
    datec[i]=datec[i].substring(datec[i].indexOf("/")+1);
    if(trim(datec[i].substring(0,datec[i].indexOf("/"))).equals("10")){
      octnum[int(datec[i].substring(datec[i].indexOf("/")+1))]=datenum[i];
    }
    if(trim(datec[i].substring(0,datec[i].indexOf("/"))).equals("11")){
      novnum[int(datec[i].substring(datec[i].indexOf("/")+1))]=datenum[i];
    }
    if(trim(datec[i].substring(0,datec[i].indexOf("/"))).equals("12")){
      decnum[int(datec[i].substring(datec[i].indexOf("/")+1))]=datenum[i];
    }
    if(trim(datec[i].substring(0,datec[i].indexOf("/"))).equals("1")){
      jannum[int(datec[i].substring(datec[i].indexOf("/")+1))]=datenum[i];
    }
  }
  //printArray(datec);
  //printArray(octnum);
  //printArray(jannum);
}