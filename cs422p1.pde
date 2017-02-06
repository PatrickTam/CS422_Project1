//Patrick Tam - CS422 Spring 2017
//import processing.sound.*;
//SoundFile beepSound;

// here is a processing.js solution from http://aaron-sherwood.com/processingjs/circleSound.html
// uncomment this line to get audio in Processing.js
Audio beepSound = new Audio();
Audio wrongSound = new Audio();
Audio doneSound = new Audio();
Audio alarmSound = new Audio();

// also note the soundfile needs to be in the data folder for processing and outside that folder for Processing.js
// sounds are also a bit slowerer to start up in Processing.js

// placeholder for future image
PImage img;
PImage timeImg;
PImage tempImg;


//a bunch of globals...
int[][] triangles = {{1115, 190, 1085, 190, 1100, 160}, {1180, 190, 1150, 190, 1165, 160}, {1255, 190, 1225, 190, 1240, 160}};
int[][] triangles2 = {{1115, 235, 1085, 235, 1100, 265}, {1180, 235, 1150, 235, 1165, 265}, {1255, 235, 1225, 235, 1240, 265}};

int[] timeArr = {0, 0, 0, 1100, 225};

int[][] triangles3 = {{1115, 50, 1085, 50, 1100, 20}, {1160, 50, 1130, 50, 1145, 20}, {1205, 50, 1175, 50, 1190, 20}};
int[][] triangles4 = {{1115, 100, 1085, 100, 1100, 130}, {1160, 100, 1130, 100, 1145, 130}, {1205, 100, 1175, 100, 1190, 130}};

int[] tempArr = {0, 0, 0, 1100, 90};

// no buttons / mode currently selected
int selectedOne = -1;

String selectedType = "";

String selectedDir = "";

int currentTime;

int[] far = {1230, 30, 1270, 30, 1270, 70, 1230, 70};
int[] cel = {1230, 90, 1270, 90, 1270, 130, 1230, 130};

int[][] func = {{1030, 300, 1130, 300, 1130, 350, 1030, 350}, {1160, 300, 1260, 300, 1260, 350, 1160, 350}, {1030, 380, 1130, 380, 1130, 430, 1030, 430}, {1160, 380, 1260, 380, 1260, 430, 1160, 430}, {1095, 480, 1195, 480, 1195, 530, 1095, 530}};
//1030, 460, 1260, 460
int[] funcColor = {255, 0, 0, 0, 0};

int[][] toastRect = {{1110, 550, 1190, 550, 1190, 570, 1110, 570}, {1110, 570, 1190, 570, 1190, 590, 1110, 590}, {1110, 590, 1190, 590, 1190, 610, 1110, 610}, {1110, 610, 1190, 610, 1190, 630, 1110, 630}, {1110, 630, 1190, 630, 1190, 650, 1110, 650}};
int toastOpt = 0;
int[] toastOptTriangle = {1090, 550, 1090, 570, 1110, 560};
int tempOpt = 0;

int funcSelected = 0;

int[] startRect = {550, 740, 730, 740, 730, 800, 550, 800};

int[] mainRect = {460, 0, 820, 0, 820, 80, 460, 80};

int startFlag = 0;

int temp = 68;
int[] time = {0,0,0};

int startSecond;
int errorSecond;

String errorText = "";

int[] pauseRect = {25, 100, 155, 100, 155, 150, 25, 150};
int pausedFlag = 0;

int[] timeBeforePause = {0,0,0};
int[] tempBeforePause = {0,0,0};

int[] delayTimeRect = {25, 160, 185, 160, 185, 210, 25, 210};
int[] delayRect = {190, 160, 240, 160, 240, 210, 190, 210};

int setDelay = 0;
int[] delayTime = {0,0,0, 575, 225, 0};

int[][] delayTriangles = {{590, 190, 560, 190, 575, 160}, {655, 190, 625, 190, 640, 160}, {720, 190, 690, 190, 705, 160}};
int[][] delayTriangles2 = {{590, 235, 560, 235, 575, 265}, {655, 235, 625, 235, 640, 265}, {720, 235, 690, 235, 705, 265}};
int delayUp = 0;
int delayLoop = -1;

int delayStart = 0;

int[] lockCode = {0,0,0};
int[] inputtingCode = {0,0,0};
int[] codeRect = {25, 260, 155, 260, 155, 310, 25, 310};
int setCode = 0;
int inputCode = 0;
int[] enterButton = {550, 290, 730, 290, 730, 350, 550, 350};

int codeUp = 0;
int codeLoop = -1;


int[] earlyAlarmRect = {25, 360, 185, 360, 185, 410, 25, 410};
int alertIndex = 0;
int[] alertTime = {0, 5, 10, 15, 20, 25};

int[] cleanRect = {25, 460, 155, 460, 155, 510, 25, 510};
int cleanFlag = 0;
int acceptedClean = 0;
int[] yesButton = {530, 290, 630, 290, 630, 350, 530, 350};
int[] noButton = {650, 290, 750, 290, 750, 350, 650, 350};

int[] coolRect = {25, 560, 155, 560, 155, 610, 25, 610};
int coolButton = 0;

int finishedFlag = 0;

int setLock = 0;

int[] additionalFunc = {25, 25, 185, 25, 185, 75, 25, 75};
int additional = 0;

PFont f;

/////////////////////////////////////////////////////

void loadSounds() {
  // beep soundfile shortened from http://soundbible.com/2158-Text-Message-Alert-5.html

  //Processing load sound
  //beepSound = new SoundFile(this, "bing.mp3");

  // processing.js load sound
  beepSound.setAttribute("src", "bing.wav");
  wrongSound.setAttribute("src", "wrong.wav");
  doneSound.setAttribute("src", "done.wav");
  alarmSound.setAttribute("src", "alarm.mp3");
}

void playBeep() {
  // play audio in processing or processing.js
  beepSound.play();
}

void playWrong(){
  wrongSound.play(); 
}

void playDone(){
  doneSound.play(); 
}

void playAlarm(){
  alarmSound.play(); 
}
/////////////////////////////////////////////////////

void setup() {
  // set the canvas size
  size(1280, 800);

  // grab an image to use later
  // as with sounds Processing likes files in the data directory, Processing.js outside that directory
  img = loadImage("sketch2.gif", "gif");
  img.loadPixels();

  timeImg = loadImage("time.png", "png");
  timeImg.loadPixels();

  tempImg = loadImage("temp.png", "png");
  tempImg.loadPixels();
  tempImg.resize(50, 50);

  f = createFont("Arial", 24, true);

  loadSounds();
}

/////////////////////////////////////////////////////

void draw() {
  String timeString;
  String tempString;

  background(0);
  noStroke();

  currentTime = second();

  // draw some buttons
  fill(127, 127, 127);

  //top arrows of time
  for (int loopCounter=0; loopCounter < triangles.length; loopCounter++)
    triangle(triangles[loopCounter][0], triangles[loopCounter][1], triangles[loopCounter][2], triangles[loopCounter][3], triangles[loopCounter][4], triangles[loopCounter][5]);

  //bottom arrows of time
  for (int loopCounter=0; loopCounter < triangles2.length; loopCounter++)
    triangle(triangles2[loopCounter][0], triangles2[loopCounter][1], triangles2[loopCounter][2], triangles2[loopCounter][3], triangles2[loopCounter][4], triangles2[loopCounter][5]);

  //top arrows of temp
  for (int loopCounter=0; loopCounter < triangles3.length; loopCounter++)
    triangle(triangles3[loopCounter][0], triangles3[loopCounter][1], triangles3[loopCounter][2], triangles3[loopCounter][3], triangles3[loopCounter][4], triangles3[loopCounter][5]);

  //bottom arrows of temp
  for (int loopCounter=0; loopCounter < triangles4.length; loopCounter++)
    triangle(triangles4[loopCounter][0], triangles4[loopCounter][1], triangles4[loopCounter][2], triangles4[loopCounter][3], triangles4[loopCounter][4], triangles4[loopCounter][5]);
    
  //each of the function rectangles
  for (int loopCounter=0; loopCounter < func.length; loopCounter++)
    rect(func[loopCounter][0], func[loopCounter][1], 100, 50, 10);
    
  //if we are setting the delay, we need the content to show in the middle to set the delay time, so here we load the triangles
  if(setDelay == 1){
    for (int loopCounter=0; loopCounter < delayTriangles.length; loopCounter++)
      triangle(delayTriangles[loopCounter][0], delayTriangles[loopCounter][1], delayTriangles[loopCounter][2], delayTriangles[loopCounter][3], delayTriangles[loopCounter][4], delayTriangles[loopCounter][5]);
      
    for (int loopCounter=0; loopCounter < delayTriangles2.length; loopCounter++)
      triangle(delayTriangles2[loopCounter][0], delayTriangles2[loopCounter][1], delayTriangles2[loopCounter][2], delayTriangles2[loopCounter][3], delayTriangles2[loopCounter][4], delayTriangles2[loopCounter][5]);
  }
  
  //when inputting or setting the lock code, we need to load the arrows again here
  if(setCode == 1 || inputCode == 1){
    for (int loopCounter=0; loopCounter < delayTriangles.length; loopCounter++)
      triangle(delayTriangles[loopCounter][0], delayTriangles[loopCounter][1], delayTriangles[loopCounter][2], delayTriangles[loopCounter][3], delayTriangles[loopCounter][4], delayTriangles[loopCounter][5]);
      
    for (int loopCounter=0; loopCounter < delayTriangles2.length; loopCounter++)
      triangle(delayTriangles2[loopCounter][0], delayTriangles2[loopCounter][1], delayTriangles2[loopCounter][2], delayTriangles2[loopCounter][3], delayTriangles2[loopCounter][4], delayTriangles2[loopCounter][5]);
      
    rect(enterButton[0], enterButton[1], 180, 60, 10);
  }
  
  rect(additionalFunc[0], additionalFunc[1], 160, 50, 10);
  
  //start rectangle on the bottom
  rect(startRect[0], startRect[1], 180, 60, 10);
  
  //rectangle on top containing the temp and time
  rect(mainRect[0], mainRect[1], 360, 80, 10);
  
  //grey rectangle behind the toast options
  fill(127);
  rect(1085, 540, 120, 120, 10);

  //each of the toast options, getting darker as it goes on
  fill(200, 200, 200);
  rect(toastRect[0][0], toastRect[0][1], 80, 20);
  
  fill(150);
  rect(toastRect[1][0], toastRect[1][1], 80, 20);
  
  fill(100);
  rect(toastRect[2][0], toastRect[2][1], 80, 20);
  
  fill(50);
  rect(toastRect[3][0], toastRect[3][1], 80, 20);
  
  fill(0);
  rect(toastRect[4][0], toastRect[4][1], 80, 20);
  
  //triangle to follow where the user clicked on the toast
  triangle(toastOptTriangle[0], toastOptTriangle[1] + (20*toastOpt), toastOptTriangle[2], toastOptTriangle[3] + (20*toastOpt), toastOptTriangle[4], toastOptTriangle[5] + (20*toastOpt));
  
  fill(127);
  
  //pause rectangle
  if(additional == 1)
  rect(pauseRect[0], pauseRect[1], 130, 50, 10);
  
  //delay rectangle
  if(additional == 1)
  rect(delayTimeRect[0], delayTimeRect[1], 160, 50, 10);
  //different color, depending if we set it to delay
  if(delayStart == 0)
    fill(255, 0, 0);
  else
    fill(0, 255, 0);
  if(additional == 1)
  rect(delayRect[0], delayRect[1], 50, 50, 10);
  
  fill(127);
  
  //rectangle to set the code before starting
  if(additional == 1)
  rect(codeRect[0], codeRect[1], 130, 50, 10);
  
  fill(0);
  textSize(20);
  //text right next to the delay rectangle to also say on or off
  if(delayStart == 0){
     text("OFF", delayRect[0] + 25, delayRect[1]+30); 
  }
  else{
    text("ON", delayRect[0]+25, delayRect[1]+30);
  }
  
  fill(127);
  //alarm rectangle
  if(additional == 1)
  rect(earlyAlarmRect[0], earlyAlarmRect[1], 160, 50, 10);
  
  //clean rectangle
  if(additional == 1)
  rect(cleanRect[0], cleanRect[1], 130, 50, 10);
  
  //cool rectangle
  if(additional == 1)
  rect(coolRect[0], coolRect[1], 130, 50, 10);
  
  //if we did click to clean
  if(cleanFlag == 1){
   rect(yesButton[0], yesButton[1], 100, 60, 10); 
   rect(noButton[0], noButton[1], 100, 60, 10); 
  }
  
  textFont(f);
  textSize(36);
  fill(127, 127, 127);
  textAlign(CENTER);

  //text for the time under the arrows
  timeString = str(timeArr[0]);// + " : " + str(timeArr[1]) + " : " + str(timeArr[2]);
  text(timeString, timeArr[3], timeArr[4]);
  text(":", timeArr[3]+35, timeArr[4]);
  timeString = str(timeArr[1]);
  text(timeString, timeArr[3]+65, timeArr[4]);
  text(":", timeArr[3]+110, timeArr[4]);
  timeString = str(timeArr[2]);
  text(timeString, timeArr[3]+140, timeArr[4]);
  timeImg.resize(50, 50);
  rect(timeArr[3]-75, timeArr[4]-40, 50, 50);
  image(timeImg, timeArr[3]-75, timeArr[4]-40);

  textSize(12);
  //put in the units
  text("hr", timeArr[3]+25, timeArr[4]);
  text("min", timeArr[3]+95, timeArr[4]);
  text("sec", timeArr[3]+165, timeArr[4]);
  textSize(36);

  //text for temp under the arrows
  tempString = str(tempArr[0]);
  text(tempString, tempArr[3], tempArr[4]);
  tempString = str(tempArr[1]);
  text(tempString, tempArr[3]+45, tempArr[4]);
  tempString = str(tempArr[2]);
  text(tempString, tempArr[3]+90, tempArr[4]);
  tempImg.resize(15, 50);
  //rect(timeArr[3]-75, timeArr[4]-40, 50, 50);
  image(tempImg, tempArr[3]-50, tempArr[4]-40);
  
  //if we did want to set delay, print out those numbers too under the arrows in the middle of the screen
  if(setDelay == 1){
   text("Set delay...", delayTime[3]-110, delayTime[4]);
   text(str(delayTime[0]), delayTime[3], delayTime[4]);
   text(str(delayTime[1]), delayTime[3]+65, delayTime[4]);
   text(str(delayTime[2]), delayTime[3]+130, delayTime[4]);
   text("min", delayTime[3]+180, delayTime[4]);
  }
  
  //same for codes
  else if(setCode == 1){
    text("Set code...", delayTime[3]-110, delayTime[4]);
   text(str(inputtingCode[0]), delayTime[3], delayTime[4]);
   text(str(inputtingCode[1]), delayTime[3]+65, delayTime[4]);
   text(str(inputtingCode[2]), delayTime[3]+130, delayTime[4]);
  }
  
  else if(inputCode == 1){
    text("Input code...", delayTime[3]-110, delayTime[4]);
   text(str(inputtingCode[0]), delayTime[3], delayTime[4]);
   text(str(inputtingCode[1]), delayTime[3]+65, delayTime[4]);
   text(str(inputtingCode[2]), delayTime[3]+130, delayTime[4]);
  }
  
  //if it is delayed and we did start it, display it in the center of the screen
  if(delayStart == 1 && startFlag == 1){
    int delayAmt = (delayTime[0]*100) + (delayTime[1]*10) + delayTime[2];
    String t;
    if(delayTime[5] < 10)
      t = "0" + str(delayTime[5]);
    else
      t = str(delayTime[5]);
     text("Will start in... " + delayAmt + " min:" + t + " sec", 640, 190); 
  }

  //farenheit and celsius to the right of the temp
  rect(far[0], far[1], 40, 40, 10);
  rect(cel[0], cel[1], 40, 40, 10);

  textSize(24);
  //put on the labels
  if (tempOpt == 0) {
    fill(255, 0, 0);
    text("°F", far[0]+20, far[1]+30);
    fill(0);
    text("°C", cel[0]+20, cel[1]+30);
  } else {
    fill(0);
    text("°F", far[0]+20, far[1]+30);
    fill(255, 0, 0);
    text("°C", cel[0]+20, cel[1]+30);
  }
  textSize(36);
  fill(127, 127, 127);
  
  //text for functions
  fill(funcColor[0], 0, 0);
  textSize(18);
  text("Bake", func[0][0]+50, func[0][1]+30);
  fill(funcColor[1], 0, 0);
  text("Broil", func[1][0]+50, func[1][1]+30);
  fill(funcColor[2], 0, 0);
  text("Pizza", func[2][0]+50, func[2][1]+30);
  fill(funcColor[3], 0, 0);
  text("Convection\nBake", func[3][0]+50, func[3][1]+25);
  
  //line between to separate toast and bagel from the rest
  stroke(127);
  line(1030, 460, 1260, 460);
  
  fill(funcColor[4], 0, 0);
  text("Toast/Bagel", func[4][0]+50, func[4][1]+30);

  //color if we did start
  if(startFlag == 0)
    fill(0);
  else
    fill(0, 255, 0);
  textSize(36);
  text("Start/Stop", startRect[0]+90, startRect[1]+40);
  
  if(setCode == 1 || inputCode == 1){
    text("Enter", enterButton[0]+90, enterButton[1]+40);
  }
  
  fill(0);
  textSize(24);
  
  //diff text and color if we did pause
  fill(0);
  if(additional == 1){
  if(pausedFlag == 0){
   text("Pause", pauseRect[0] + 60, pauseRect[1] + 30);
  }
  else{
   fill(255, 153, 0);
   text("Unpause", pauseRect[0] + 60, pauseRect[1] + 30);
   fill(0);
  }
  }
  
  //yes/no labels on buttons if we want to clean
  if(cleanFlag == 1){
    fill(127);
    textSize(30);
   text("Do you want to clean the oven? Takes 5 minutes.", yesButton[0]+100, yesButton[1]-30);
   fill(0);
   textSize(24);
   text("Yes", yesButton[0]+45, yesButton[1]+40);
   text("No", noButton[0]+45, noButton[1]+40);
  }
  
  //cool text color change
  textSize(16);
  if(coolButton == 0)
    fill(0);
  else
    fill(0, 191, 255);
  if(additional == 1)
  text("Cool After\nCooking", coolRect[0]+60, coolRect[1]+20);
  
  fill(0);
  
  //setting code
  textSize(18);
  if(additional == 1)
  text("Set Lock Code", codeRect[0] + 65, codeRect[1] + 30);
  textSize(18);
  textAlign(LEFT);
  int actualDelay = (delayTime[0]*100) + (delayTime[1]*10) + delayTime[2];
  if(additional == 1)
  text("Delay: " + str(actualDelay) + " min", delayTimeRect[0] + 15 , delayTimeRect[1] + 32);
  textAlign(CENTER);
  textSize(24);
  
  //delay arrow logic
  if(delayLoop != -1){
    
   if(delayLoop == 0){
    if(delayUp == 1){
     if(delayTime[0] == 9)
       delayTime[0] = 0;
     else
       delayTime[0] += 1;
    }
    else{
     if(delayTime[0] == 0)
       delayTime[0] = 9;
     else
       delayTime[0] -= 1;
    }
   }
   
   else if(delayLoop == 1){
    if(delayUp == 1){
     if(delayTime[1] == 9)
       delayTime[1] = 0;
     else
       delayTime[1] += 1;
    }
    else{
     if(delayTime[1] == 0)
       delayTime[1] = 9;
     else
       delayTime[1] -= 1;
    }
   }
   
   else if(delayLoop == 2){
    if(delayUp == 1){
     if(delayTime[2] == 9)
       delayTime[2] = 0;
     else
       delayTime[2] += 1;
    }
    else{
     if(delayTime[2] == 0)
       delayTime[2] = 9;
     else
       delayTime[2] -= 1;
    }
     
   }
   delayLoop = -1;
  }
  
  //code arrow logic
  if(codeLoop != -1){
    if(codeLoop == 0){
    if(codeUp == 1){
     if(inputtingCode[0] == 9)
       inputtingCode[0] = 0;
     else
       inputtingCode[0] += 1;
    }
    else{
     if(inputtingCode[0] == 0)
       inputtingCode[0] = 9;
     else
       inputtingCode[0] -= 1;
    }
   }
   
   else if(codeLoop == 1){
    if(codeUp == 1){
     if(inputtingCode[1] == 9)
       inputtingCode[1] = 0;
     else
       inputtingCode[1] += 1;
    }
    else{
     if(inputtingCode[1] == 0)
       inputtingCode[1] = 9;
     else
       inputtingCode[1] -= 1;
    }
   }
   
   else if(codeLoop == 2){
    if(codeUp == 1){
     if(inputtingCode[2] == 9)
       inputtingCode[2] = 0;
     else
       inputtingCode[2] += 1;
    }
    else{
     if(inputtingCode[2] == 0)
       inputtingCode[2] = 9;
     else
       inputtingCode[2] -= 1;
    }
     
   }
    codeLoop = -1;
  }
  
  
  textSize(16);
  if(alertIndex != 0)
    fill(155, 255, 0);
  if(additional == 1)
  text("Alert when " + alertTime[alertIndex] + " min left", earlyAlarmRect[0] + 80, earlyAlarmRect[1] + 30);
  
  fill(0);
  
  textSize(20);
  if(additional == 1)
  text("Clean oven", cleanRect[0] + 60, cleanRect[1]+30);
  
  textSize(16);
  if(additional == 1)
    fill(0, 255, 130);
  else
    fill(0);
  text("Additional Features", additionalFunc[0]+80, additionalFunc[1]+30);
  
  fill(0);
  
  textSize(24);
  //text("Current Temp: ", mainRect[0] + 80, mainRect[1]+30);
  textAlign(LEFT);
  //farenheit or celsius for the temp on top
  if(tempOpt == 0){
     String tempText = "Current Temp: " + str(temp) + "°F";
     text(tempText, mainRect[0] + 10, mainRect[1]+30);
  }
  else{
    String tempText = "Current Temp: " + str(temp) + "°C";
     text(tempText, mainRect[0] + 10, mainRect[1]+30);
  }
  
  //label on the main rectangle, PAUSED, ON, OFF, etc
  if(startFlag == 1){
   if(pausedFlag == 1){
     fill(255, 153, 0);
     text("PAUSED", mainRect[0] + 250, mainRect[1] + 30);
   }
   else{
     if(delayStart == 1){
       fill(0, 0, 255);
       text("DELAYED", mainRect[0] + 250, mainRect[1] + 30);
     }
     else{
       if(finishedFlag == 1 && coolButton == 1){
         fill(0, 191, 255);
         text("COOLING", mainRect[0] + 250, mainRect[1] + 30);
       }
       else{
         fill(0, 255, 0);
         text("ON", mainRect[0] + 250, mainRect[1] + 30);
       }
     }
   }
  }
  else{
   fill(255, 0, 0);
   text("OFF", mainRect[0] + 250, mainRect[1] + 30);
  }
  fill(0);
  //making the time on the main rectangle
  String t0;
  String t1; 
  String t2;
  if(time[0] < 10)
    t0 = "0" + str(time[0]);
  else
    t0 = str(time[0]);
    
  if(time[1] < 10)
    t1 = "0" + str(time[1]);
  else
    t1 = str(time[1]);
    
  if(time[2] < 10)
    t2 = "0" + str(time[2]);
  else
    t2 = str(time[2]);
  
  String timeText = "Time left: " + t0 + "  : " + t1 + "    : " + t2;
  text(timeText, mainRect[0] + 10, mainRect[1]+60);
  
  textSize(16);
  text("hr", mainRect[0] + 142, mainRect[1]+60);
  text("min", mainRect[0] + 195, mainRect[1]+60);
  text("sec", mainRect[0] + 263, mainRect[1]+60);
  
  textAlign(CENTER);
  
  textSize(24);
  //arrow logic control on the time and temp on the right
  if (selectedOne == 0) {
    //fill(127,0,0);
    //triangle (300, 300, 250, 200, 200, 300);
    if (selectedType == "time") {
      if (selectedDir == "up") {
        if (timeArr[0] == 99)
          timeArr[0] = 0;
        else
          timeArr[0] += 1;
      } else {
        if (timeArr[0] == 0)
          timeArr[0] = 99;
        else
          timeArr[0] -= 1;
      }
    } else if (selectedType == "temp") {
      if (selectedDir == "up") {
        if (tempArr[0] == 9)
          tempArr[0] = 0;
        else
          tempArr[0] += 1;
      } else {
        if (tempArr[0] == 0)
          tempArr[0] = 9;
        else
          tempArr[0] -= 1;
      }
    }
    selectedOne = -1;
  }

  if (selectedOne == 1) {
    if (selectedType == "time") {
      if (selectedDir == "up") {
        if (timeArr[1] == 59)
          timeArr[1] = 0;
        else
          timeArr[1] += 1;
      } else {
        if (timeArr[1] == 0)
          timeArr[1] = 59;
        else
          timeArr[1] -= 1;
      }
    } else if (selectedType == "temp") {
      if (selectedDir == "up") {
        if (tempArr[1] == 9)
          tempArr[1] = 0;
        else
          tempArr[1] += 1;
      } else {
        if (tempArr[1] == 0)
          tempArr[1] = 9;
        else
          tempArr[1] -= 1;
      }
    }
    selectedOne = -1;
  }

  if (selectedOne == 2) {
    if (selectedType == "time") {
      if (selectedDir == "up") {
        if (timeArr[2] == 59)
          timeArr[2] = 0;
        else
          timeArr[2] += 1;
      } else {
        if (timeArr[2] == 0)
          timeArr[2] = 59;
        else
          timeArr[2] -= 1;
      }
    } else if (selectedType == "temp") {
      if (selectedDir == "up") {
        if (tempArr[2] == 9)
          tempArr[2] = 0;
        else
          tempArr[2] += 1;
      } else {
        if (tempArr[2] == 0)
          tempArr[2] = 9;
        else
          tempArr[2] -= 1;
      }
    }
    selectedOne = -1;
  }
  
  // print out the number of seconds the app has been running

  textFont(f);
  textSize(36);
  fill(127, 127, 127);
  textAlign(CENTER);

  //timeString = str(floor(currentTime/1000));
  //text(timeString, 100, 425);
  
  //timer logic here
  if(startFlag == 1){
    //not paused or delayed
   if(pausedFlag == 0 && delayStart != 1){
     //it is not toast, not cleaning, and not cooling, set temp to what it is on the right side
     if(funcSelected != 4 && acceptedClean != 1 && !(coolButton == 1 && finishedFlag == 1))
       temp = (tempArr[0]*100) + (tempArr[1]*10) + tempArr[2];
     else if(acceptedClean == 1){}
     //if it is cooling, set it to the cool values
     else if(coolButton == 1 && finishedFlag == 1){
       if(tempOpt == 0)
           temp = 50;
        else
           temp = 10;
     }
     else{
      if(tempOpt == 0)
          temp = 250;
        else
          temp = 121; 
     }
     //counter, timer logic
    if(millis() - startSecond > 1000){
        startSecond = millis(); 
        if(time[2] == 0){
          if(time[1] != 0){
           if(alertIndex != 0 && alertTime[alertIndex] == time[1] && time[0] == 0){
            playAlarm(); 
           }
           time[1] -= 1;
           time[2] = 59;
          }
          else{
           if(time[0] != 0){
            time[0] -= 1;
            time[1] = 59;
            time[2] = 59;
           }
           else{
             //DONE!!
             startFlag = 0;
             //if cleaning, we are done
             if(acceptedClean == 1){
               acceptedClean = 0;
               playDone();
             }
             //we finished cooking, but the user wants to cool, so set that up here
             if(finishedFlag == 0 && coolButton == 1){
              time[0] = 0;
              time[1] = 3;
              time[2] = 0;
              
              if(tempOpt == 0)
                temp = 50;
              else
                temp = 10;
                
               startFlag = 1;
               finishedFlag = 1;
               playDone();  
             }
             //done cooling, done
             else if(coolButton == 1 && finishedFlag == 1){
              finishedFlag = 0;
              startFlag = 0;
              coolButton = 0;
              playDone();
             }
             else if(coolButton == 0){
              playDone(); 
             }
           }
          }
        }
        else{
           time[2] -= 1; 
        }   
      }
    }
    //if delayed and confirmed, and not paused, do the logic here...
    else if(delayStart == 1 && pausedFlag == 0){
      if(tempOpt == 0)
         temp = 68;
      else
         temp = 20;
      if(millis() - startSecond > 1000){
         startSecond = millis();
         
         if(delayTime[5] == 0){
            if(delayTime[2] != 0){
              delayTime[2] -= 1;
              delayTime[5] = 59;
            }
            else{
             if(delayTime[1] != 0){
              delayTime[1] -= 1;
              delayTime[2] = 9;
              delayTime[5] = 59;
             }
             else{
                if(delayTime[0] != 0){
                 delayTime[0] -= 1;
                 delayTime[1] = 9;
                 delayTime[2] = 9;
                 delayTime[5] = 59;
                }
                else{
                 //DONE DELAY!!
                 delayStart = 0;
                }
             }
            }
         }
         else{
          delayTime[5] -= 1; 
         }
      }
    }
    else{
      //cool
      if(coolButton == 1 && finishedFlag == 1 && pausedFlag == 0){
        if(tempOpt == 0)
           temp = 50;
        else
           temp = 10;
      }
      else{
        if(tempOpt == 0)
           temp = 68;
        else
           temp = 20;
      }
    }
  }
  else if(acceptedClean == 1){
    
  }
  else{
   if(tempOpt == 0)
     temp = 68;
   else
     temp = 20;
  }
  
  //error message timer, lasts 5 seconds
  if(millis() - errorSecond < 5000){
    if(errorText != ""){
      fill(255, 0, 0);
      text(errorText, 640, 120);
    }
   }
   else{
    errorText = ""; 
   }
   fill(127);
}

/////////////////////////////////////////////////////

// if the mouse button is released inside a known button keep track of which button was pressed
// and play a confirmation sound

void mouseReleased() {

  //BUNCH of the triangle logic when needed, a lot of them... only clickable when on screen
  for (int loopCounter=0; loopCounter < triangles.length; loopCounter++) {
    float[] triX = {triangles[loopCounter][0], triangles[loopCounter][2], triangles[loopCounter][4]}; 
    float[] triY = {triangles[loopCounter][1], triangles[loopCounter][3], triangles[loopCounter][5]};
    if (pnpoly(3, triX, triY, mouseX, mouseY) == 1) {
      //if it is started and not paused, need to do that before touching any of these triangles
      if(startFlag == 1 && pausedFlag != 1){
       errorText = "Please stop or pause the oven to adjust";
       playWrong();
       errorSecond = millis();
       return;
      }
      //which triangle
      selectedOne = loopCounter;
      //what kind
      selectedType = "time";
      //what direction
      selectedDir = "up";
      playBeep();
    }

    float[] triX2 = {triangles2[loopCounter][0], triangles2[loopCounter][2], triangles2[loopCounter][4]}; 
    float[] triY2 = {triangles2[loopCounter][1], triangles2[loopCounter][3], triangles2[loopCounter][5]};
    if (pnpoly(3, triX2, triY2, mouseX, mouseY) == 1) {
      if(startFlag == 1 && pausedFlag != 1){
       errorText = "Please stop or pause the oven to adjust";
       playWrong();
       errorSecond = millis();
       return;
      }
      selectedOne = loopCounter;
      selectedType = "time";
      selectedDir = "down";
      playBeep();
    }

    float[] triX3 = {triangles3[loopCounter][0], triangles3[loopCounter][2], triangles3[loopCounter][4]}; 
    float[] triY3 = {triangles3[loopCounter][1], triangles3[loopCounter][3], triangles3[loopCounter][5]};
    if (pnpoly(3, triX3, triY3, mouseX, mouseY) == 1) {
      if(startFlag == 1 && pausedFlag != 1){
       errorText = "Please stop or pause the oven to adjust";
       playWrong();
       errorSecond = millis();
       return;
      }
      selectedOne = loopCounter;
      selectedType = "temp";
      selectedDir = "up";
      playBeep();
    }

    float[] triX4 = {triangles4[loopCounter][0], triangles4[loopCounter][2], triangles4[loopCounter][4]}; 
    float[] triY4 = {triangles4[loopCounter][1], triangles4[loopCounter][3], triangles4[loopCounter][5]};
    if (pnpoly(3, triX4, triY4, mouseX, mouseY) == 1) {
      if(startFlag == 1 && pausedFlag != 1){
       errorText = "Please stop or pause the oven to adjust";
       playWrong();
       errorSecond = millis();
       return;
      }
      selectedOne = loopCounter;
      selectedType = "temp";
      selectedDir = "down";
      playBeep();
    }
    
    //these are for the triangles in the center
    float[] triX5 = {delayTriangles[loopCounter][0], delayTriangles[loopCounter][2], delayTriangles[loopCounter][4]};
    float[] triY5 = {delayTriangles[loopCounter][1], delayTriangles[loopCounter][3], delayTriangles[loopCounter][5]};
    if(pnpoly(3, triX5, triY5, mouseX, mouseY) == 1){
      //if clicked in the area, need to check if the triangles were actually spawned
      if(setDelay == 1){
        delayLoop = loopCounter;
        delayUp = 1;
        playBeep();
      }
      else if(setCode == 1 || inputCode == 1){
        codeLoop = loopCounter;
        codeUp = 1;
        playBeep();
      }
    }
    
    //same as tri5
    float[] triX6 = {delayTriangles2[loopCounter][0], delayTriangles2[loopCounter][2], delayTriangles2[loopCounter][4]};
    float[] triY6 = {delayTriangles2[loopCounter][1], delayTriangles2[loopCounter][3], delayTriangles2[loopCounter][5]};
    if(pnpoly(3, triX6, triY6, mouseX, mouseY) == 1){
      if(setDelay == 1){
        delayLoop = loopCounter;
        delayUp = 0;
        playBeep();
      }
      else if(setCode == 1 || inputCode == 1){
        codeLoop = loopCounter;
        codeUp = 0;
        playBeep();
      }
    }
  }

  //delay rectangle
  float[] delayX = {delayTimeRect[0], delayTimeRect[2], delayTimeRect[4], delayTimeRect[6]};
  float[] delayY = {delayTimeRect[1], delayTimeRect[3], delayTimeRect[5], delayTimeRect[7]};
  if(pnpoly(4, delayX, delayY, mouseX, mouseY) == 1){
    if(additional == 0)
      return;
    if((pausedFlag != 1 && startFlag == 1)){
      errorText = "Please stop or pause the oven to adjust";
      playWrong();
      errorSecond = millis();
      return;
    }
    //toggle
   if(setDelay == 0){
    setDelay = 1;
    setCode = 0;
    inputCode = 0;
   }
   else{
    setDelay = 0; 
   }
  }
  
  float[] delay2X = {delayRect[0], delayRect[2], delayRect[4], delayRect[6]};
  float[] delay2Y = {delayRect[1], delayRect[3], delayRect[5], delayRect[7]};
  if(pnpoly(4, delay2X, delay2Y, mouseX, mouseY) == 1){
    if(additional == 0)
      return;
   if(delayStart == 0){
    delayStart = 1;
   }
   else{
    delayStart = 0; 
   }
  }

  //farenheit button, calculations inside
  float[] optX = {far[0], far[2], far[4], far[6]};
  float[] optY = {far[1], far[3], far[5], far[7]};
  if (pnpoly(4, optX, optY, mouseX, mouseY) == 1) {
    playBeep();
    if(tempOpt == 1){
       int currTemp = (tempArr[0] * 100) + (tempArr[1] * 10) + (tempArr[2]);
       int farenheit = currTemp * (9/5) + 32;
       
       tempArr[0] = 0;
       tempArr[1] = 0;
       tempArr[2] = 0;
       
       farenheit = int(farenheit);
       tempArr[2] = farenheit % 10;
       farenheit /= 10;
       farenheit = int(farenheit);
       tempArr[1] = farenheit % 10;
       farenheit /= 10;
       farenheit = int(farenheit);
       tempArr[0] = farenheit % 10;
       
       temp = int(temp * (9/5) + 32);
    }
    tempOpt = 0;
  }

  //celsius button, calculations inside
  float[] opt2X = {cel[0], cel[2], cel[4], cel[6]};
  float[] opt2Y = {cel[1], cel[3], cel[5], cel[7]};
  if (pnpoly(4, opt2X, opt2Y, mouseX, mouseY) == 1) {
    playBeep();
    if(tempOpt == 0){
       int currTemp = (tempArr[0] * 100) + (tempArr[1] * 10) + (tempArr[2]);
       int celsius = (currTemp - 32) * (5/9);
       if(celsius < 0)
         celsius = 0;
       tempArr[0] = 0;
       tempArr[1] = 0;
       tempArr[2] = 0;
       
       celsius = int(celsius);
       tempArr[2] = celsius % 10;
       celsius /= 10;
       celsius = int(celsius);
       tempArr[1] = celsius % 10;
       celsius /= 10;
       celsius = int(celsius);
       tempArr[0] = celsius % 10;
       
       temp = int((temp - 32) * (5/9));
    }
    tempOpt = 1;
  }
  
  //setting the code
  float[] codeX = {codeRect[0], codeRect[2], codeRect[4], codeRect[6]};
  float[] codeY = {codeRect[1], codeRect[3], codeRect[5], codeRect[7]};
  if(pnpoly(4, codeX, codeY, mouseX, mouseY) == 1){
    if(additional == 0)
      return;
   if(inputCode == 1 || startFlag == 1){
     inputtingCode[0] = 0;
     inputtingCode[1] = 0;
     inputtingCode[2] = 0;
    playWrong();
    return;
   }
   if(setCode == 0){
     //mkae sure to clear out the input code
     inputtingCode[0] = 0;
     inputtingCode[1] = 0;
     inputtingCode[2] = 0;
     setDelay = 0;
     setCode = 1;
   }
   else{
    setCode = 0; 
   }
  }
  
  
  //load all the functions
   for (int loopCounter=0; loopCounter < func.length; loopCounter++) {
     float[] funX = {func[loopCounter][0], func[loopCounter][2], func[loopCounter][4], func[loopCounter][6]};
     float[] funY = {func[loopCounter][1], func[loopCounter][3], func[loopCounter][5], func[loopCounter][7]};
     
     if(pnpoly(4, funX, funY, mouseX, mouseY) == 1){
       if(startFlag == 1 && pausedFlag != 1){
       errorText = "Please stop or pause the oven to adjust";
       playWrong();
       errorSecond = millis();
       return;
      }
       funcSelected = loopCounter;
       for(int i = 0; i < func.length; i++){
        funcColor[i] = 0; 
       }
       funcColor[loopCounter] = 255;
       playBeep(); 
     }
   }
   
   //load the toaster rectangles
   for (int loopCounter=0; loopCounter < toastRect.length; loopCounter++) {
     float[] toastX = {toastRect[loopCounter][0], toastRect[loopCounter][2], toastRect[loopCounter][4], toastRect[loopCounter][6]};
     float[] toastY = {toastRect[loopCounter][1], toastRect[loopCounter][3], toastRect[loopCounter][5], toastRect[loopCounter][7]};
     
     if(pnpoly(4, toastX, toastY, mouseX, mouseY) == 1){
       if(startFlag == 1){
       errorText = "Please stop the oven to adjust";
       playWrong();
       errorSecond = millis();
       return;
      }
       if(funcSelected == 4){
        toastOpt = loopCounter;
        playBeep();
       }
       else{
         //only allow if we are on the toaster option to select any toaster browning option
         errorText = "Select Toast/Bagel before changing";
         playWrong();
         errorSecond = millis();
         return;
       }
     }
   }
   
  float[] startX = {startRect[0], startRect[2], startRect[4], startRect[6]};
  float[] startY = {startRect[1], startRect[3], startRect[5], startRect[7]};
  
  if(pnpoly(4, startX, startY, mouseX, mouseY) == 1){
    if(startFlag == 0){
      if(timeArr[0] == 0 && timeArr[1] == 0 && timeArr[2] == 0 && funcSelected != 4){
       playWrong();
       errorText = "Set a time before starting";
       startFlag = 0;
       errorSecond = millis();
       return;
      }
     else{
       //set a bunch of things off
      //startFlag = 1;
      setDelay = 0;
      setCode = 0;
      if(setLock == 1)
        //tell them to input the code than just starting it
        inputCode = 1;
      else
        startFlag = 1;
      if(funcSelected == 4){
        if(tempOpt == 0)
          temp = 250;
        else
          temp = 121;
        time[0] = 0;
        time[1] = 5 + toastOpt;
        time[2] = 0;
      }
      else{
        temp = (tempArr[0] * 100) + (tempArr[1] * 10) + (tempArr[2]);
        time[0] = timeArr[0];
        time[1] = timeArr[1];
        time[2] = timeArr[2];
      }
      startSecond = millis();
      playBeep();
     }
    }
    else{
      startFlag = 0;
      inputCode = 0;
      if(tempOpt == 0)
        temp = 68;
      else
        temp = 20;
      time[0] = 0;
      time[1] = 0;
      time[2] = 0;
      pausedFlag = 0;
      coolButton = 0;
    }
  }
  
  float[] pausedX = {pauseRect[0], pauseRect[2], pauseRect[4], pauseRect[6]};
  float[] pausedY = {pauseRect[1], pauseRect[3], pauseRect[5], pauseRect[7]};
  if(pnpoly(4, pausedX, pausedY, mouseX, mouseY) == 1){
    if(additional == 0)
      return;
   if(startFlag == 0){
      playWrong();
      errorText = "Oven is not running";
      errorSecond = millis();
      return;
   }
   //keep the time and tmep prior to the pause to check if they changed, if they did, then they wanted to change something, so set it to their desired one
   if(pausedFlag == 0){
    pausedFlag = 1;
    timeBeforePause[0] = timeArr[0];
    timeBeforePause[1] = timeArr[1];
    timeBeforePause[2] = timeArr[2];
    
    tempBeforePause[0] = tempArr[0];
    tempBeforePause[1] = tempArr[1];
    tempBeforePause[2] = tempArr[2];
    playBeep();
   }
   else{
     pausedFlag = 0;
     if(timeBeforePause[0] == timeArr[0] && timeBeforePause[1] == timeArr[1] && timeBeforePause[2] == timeArr[2]){ 
     }
     else{
       time[0] = timeArr[0];
       time[1] = timeArr[1];
       time[2] = timeArr[2];
     }
     
     if(tempBeforePause[0] == tempArr[0] && tempBeforePause[1] == tempArr[1] && tempBeforePause[2] == tempArr[2]){ 
     }
     else{
      temp = (tempArr[0] * 100) + (tempArr[1] * 10) + (tempArr[2]);
     }
     playBeep();
  }
  }
  
  float[] enterX = {enterButton[0], enterButton[2], enterButton[4], enterButton[6]};
  float[] enterY = {enterButton[1], enterButton[3], enterButton[5], enterButton[7]};
  if(pnpoly(4, enterX, enterY, mouseX, mouseY) == 1){
    //if inputting code, check if correct
   if(inputCode == 1){
     if(inputtingCode[0] == lockCode[0] && inputtingCode[1] == lockCode[1] && inputtingCode[2] == lockCode[2]){
      startFlag = 1; 
      inputCode = 0;
      inputtingCode[0] = 0;
      inputtingCode[1] = 0;
      inputtingCode[2] = 0;
     }
     else{
       inputCode = 0;
       playWrong();
      errorText = "Incorrect code, try again";
      errorSecond = millis();
      time[0] = 0;
      time[1] = 0;
      time[2] = 0;
      return;
     }
   }
   else if(setCode == 1){
     lockCode[0] = inputtingCode[0];
     lockCode[1] = inputtingCode[1];
     lockCode[2] = inputtingCode[2];
     inputtingCode[0] = 0;
      inputtingCode[1] = 0;
      inputtingCode[2] = 0;
     setCode = 0;
     cleanFlag = 0;
     setLock = 1;
   }
  }
  
  float[] alarmX = {earlyAlarmRect[0], earlyAlarmRect[2], earlyAlarmRect[4], earlyAlarmRect[6]};
  float[] alarmY = {earlyAlarmRect[1], earlyAlarmRect[3], earlyAlarmRect[5], earlyAlarmRect[7]};
  if(pnpoly(4, alarmX, alarmY, mouseX, mouseY) == 1){
    if(additional == 0)
      return;
    if(alertIndex == 5){
     alertIndex = 0; 
    }
    else
      alertIndex += 1;
  }
  
  float[] cleanX = {cleanRect[0], cleanRect[2], cleanRect[4], cleanRect[6]};
  float[] cleanY = {cleanRect[1], cleanRect[3], cleanRect[5], cleanRect[7]};
  if(pnpoly(4, cleanX, cleanY, mouseX, mouseY) == 1){
    if(additional == 0)
      return;
     if(startFlag == 1 || cleanFlag == 1){
       errorText = "Oven is currently running";
       errorSecond = millis();
       playWrong(); 
       return;
     }
     if(cleanFlag == 0){
       cleanFlag = 1; 
       inputCode = 0;
       setCode = 0;
     }
  }
  
  float[] yesX = {yesButton[0], yesButton[2], yesButton[4], yesButton[6]};
  float[] yesY = {yesButton[1], yesButton[3], yesButton[5], yesButton[7]};
  if(pnpoly(4, yesX, yesY, mouseX, mouseY) == 1){
    if(cleanFlag == 1){
       cleanFlag = 0;
       acceptedClean = 1;
       startFlag = 1;
       playBeep();
       
       time[0] = 0;
       time[1] = 5;
       time[2] = 0;
       
       if(tempOpt == 0)
         temp = 750;
       else
         temp = 399;
    }
  }
  
  
  float[] noX = {noButton[0], noButton[2], noButton[4], noButton[6]};
  float[] noY = {noButton[1], noButton[3], noButton[5], noButton[7]};
  if(pnpoly(4, noX, noY, mouseX, mouseY) == 1){
    if(cleanFlag == 1){
       cleanFlag = 0;
    }
  }
  
  float[] coolX = {coolRect[0], coolRect[2], coolRect[4], coolRect[6]};
  float[] coolY = {coolRect[1], coolRect[3], coolRect[5], coolRect[7]};
  if(pnpoly(4, coolX, coolY, mouseX, mouseY) == 1){
    if(additional == 0)
      return;
    if(coolButton == 0){
     coolButton = 1;
    }
    else{
     coolButton = 0; 
    }
  }
  
  float[] addX = {additionalFunc[0], additionalFunc[2], additionalFunc[4], additionalFunc[6]};
  float[] addY = {additionalFunc[1], additionalFunc[3], additionalFunc[5], additionalFunc[7]};
  if(pnpoly(4, addX, addY, mouseX, mouseY) == 1){
    playBeep();
   if(additional == 0)
     additional = 1;
   else
     additional = 0;
  }
}

//from http://stackoverflow.com/questions/217578/how-can-i-determine-whether-a-2d-point-is-within-a-polygon/2922778#2922778
//finds if a click is within the polygon
int pnpoly(int nvert, float[] vertx, float[] verty, float testx, float testy)
{
  int i, j, c = 0;
  for (i = 0, j = nvert - 1; i < nvert; j = i++) {
    if (((verty[i]>testy) != (verty[j]>testy)) &&
      (testx < (vertx[j] - vertx[i]) * (testy - verty[i]) / (verty[j] - verty[i]) + vertx[i])) {
      if (c == 0)
        c = 1;
      else
        c = 0;
      //c = c;
    }
  }
  return c;
}