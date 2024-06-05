import java.io.*;

int angleFacing = 0;                                                            //detect which way to travel, also so we dont run into head
int geckoSize = 5;                                                              //size of the gecko
int runTime = 0;                                                                //timer for speed of game
int[] geckoX = new int[2500];                                                   //this is to store the x position of the gecko and its segments
int[] geckoY = new int[2500];                                                   //this is to store the y position of the gecko and its segments
int bugX = (round(random(47)) + 1) * 8;                                         //this is to store the x position of the bug
int bugY = (round(random(47)) + 1) * 8;                                         //this is to store the y position of the bug
boolean reset = true;                                                           //reset placements of gecko and bug if true
boolean gameOver = false;                                                       //detect if the game is over
boolean mainMenu = true;                                                        //detect if the game is on the main menu
boolean settings = false;                                                       //detect if the game is on the settings menu
boolean scoreboard = false;                                                     //detect if the game is on the scoreboard menu
boolean easyMode = false;                                                       //detect if the game is on easy mode
boolean hardMode = true;                                                        //detect if the game is on hard mode
String typed = "";                                                              //this is to store the text in the text box 
ArrayList<TEXTBOX> textBoxes = new ArrayList<TEXTBOX>();                        //this is to store the text boxes
ArrayList <String> scoreboardNames = new ArrayList<String>();                   //this is to store the names of the top 5 scores
int[] topScore = new int[5];                                                    //this is to store the top 5 scores
int[] allScores = new int[2500];                                                //this is to store all the scores

int startX, startY;                                                             //this is to store the x and y position of the start button
int exitX, exitY;                                                               //this is to store the x and y position of the exit button
int settingsX, settingsY;                                                       //this is to store the x and y position of the settings button
int scoreboardX, scoreboardY;                                                   //this is to store the x and y position of the scoreboard button
int deadMainMenuX, deadMainMenuY;                                               //this is to store the x and y position of the dead main menu button
int easyModeX, easyModeY;                                                       //this is to store the x and y position of the easy mode button
int hardModeX, hardModeY;                                                       //this is to store the x and y position of the hard mode button
int settingsMainMenuX, settingsMainMenuY;                                       //this is to store the x and y position of the settings main menu button
int scoreMainMenuX, scoreMainMenuY;                                             //this is to store the x and y position of the scoreboard main menu button

int startWidth, startHeight;                                                    //this is to store the width and height of the start button
int exitWidth, exitHeight;                                                      //this is to store the width and height of the exit button
int settingsWidth, settingsHeight;                                              //this is to store the width and height of the settings button
int scoreboardWidth, scoreboardHeight;                                          //this is to store the width and height of the scoreboard button
int deadMainMenuWidth, deadMainMenuHeight;                                      //this is to store the width and height of the dead main menu button
int easyModeWidth, easyModeHeight;                                              //this is to store the width and height of the easy mode button
int hardModeWidth, hardModeHeight;                                              //this is to store the width and height of the hard mode button
int settingsMainMenuWidth, settingsMainMenuHeight;                              //this is to store the width and height of the settings main menu button
int scoreMainMenuWidth, scoreMainMenuHeight;                                    //this is to store the width and height of the scoreboard main menu button

boolean startOver = false;                                                      //this is to detect if the mouse is over the start button
boolean exitOver = false;                                                       //this is to detect if the mouse is over the exit button
boolean settingsOver = false;                                                   //this is to detect if the mouse is over the settings button
boolean scoreboardOver = false;                                                 //this is to detect if the mouse is over the scoreboard button
boolean deadMainMenuOver = false;                                               //this is to detect if the mouse is over the dead main menu button
boolean easyModeOver = false;                                                   //this is to detect if the mouse is over the easy mode button
boolean hardModeOver = false;                                                   //this is to detect if the mouse is over the hard mode button
boolean settingsMainMenuOver = false;                                           //this is to detect if the mouse is over the settings main menu button
boolean scoreMainMenuOver = false;                                              //this is to detect if the mouse is over the scoreboard main menu button

color startColor, exitColor, settingsColor, scoreboardColor, deadMainMenuColor, easyModeColor, hardModeColor, settingsMainMenuColor, scoreMainMenuColor;                                    //this is to store the color of the buttons
color startHighlight, exitHighlight, settingsHighlight, scoreboardHighlight, deadMainMenuHighlight, easyModeHighlight, hardModeHighlight, settingsMainMenuHighlight, scoreMainMenuHighlight;    //this is to store the color of the buttons when the mouse is over them
color currentColor;                                                             //this is to store the color of the buttons when the mouse is over them

void setup() {
    size(400,400);                                  //this is to set the size of the game
    textAlign(CENTER);                              //all text aligned to the center
    background(249, 202, 48);                       //sandy colored background
    
    startColor = color(0, 0, 0);                    //black
    exitColor = color(0, 0, 0);                     //black
    settingsColor = color(0, 0, 0);                 //black
    scoreboardColor = color(0, 0, 0);               //black
    startHighlight = color(90, 90, 90);             //grey
    exitHighlight = color(90, 90, 90);              //grey
    settingsHighlight = color(90, 90, 90);          //grey
    scoreboardHighlight = color(90, 90, 90);        //grey
    currentColor = startColor;                      //set the current color to the start color
    deadMainMenuColor = color(0, 0, 0);             //black
    deadMainMenuHighlight = color(90, 90, 90);      //grey
    easyModeColor = color(0, 0, 0);                 //black
    easyModeHighlight = color(90, 90, 90);          //grey
    hardModeColor = color(0, 0, 0);                 //black
    hardModeHighlight = color(90, 90, 90);          //grey
    settingsMainMenuColor = color(0, 0, 0);         //black
    settingsMainMenuHighlight = color(90, 90, 90);  //grey
    scoreMainMenuColor = color(0, 0, 0);            //black
    scoreMainMenuHighlight = color(90, 90, 90);     //grey
    
    startWidth = 100;                               //set the width of the start button
    startHeight = 40;                               //set the height of the start button
    exitWidth = 100;                                //set the width of the exit button
    exitHeight = 40;                                //set the height of the exit button
    settingsWidth = 100;                            //set the width of the settings button
    settingsHeight = 40;                            //set the height of the settings button
    scoreboardWidth = 100;                          //set the width of the scoreboard button
    scoreboardHeight = 40;                          //set the height of the scoreboard button
    deadMainMenuWidth = 100;                        //set the width of the dead main menu button
    deadMainMenuHeight = 40;                        //set the height of the dead main menu button
    easyModeWidth = 100;                            //set the width of the easy mode button
    easyModeHeight = 40;                            //set the height of the easy mode button
    hardModeWidth = 100;                            //set the width of the hard mode button
    hardModeHeight = 40;                            //set the height of the hard mode button
    settingsMainMenuWidth = 100;                    //set the width of the settings main menu button
    settingsMainMenuHeight = 40;                    //set the height of the settings main menu button
    scoreMainMenuWidth = 100;                       //set the width of the scoreboard main menu button
    scoreMainMenuHeight = 40;                       //set the height of the scoreboard main menu button
    
    startX = width / 4 - startWidth / 2;                                //set the x position of the start button
    startY = height / 2 - startHeight / 2;                              //set the y position of the start button
    exitX = ((width / 4) * 3) - exitWidth / 2;                          //set the x position of the exit button
    exitY = ((height / 4) * 3) - exitHeight / 2;                        //set the y position of the exit button
    settingsX = ((width / 4) * 3) - settingsWidth / 2;                  //set the x position of the settings button
    settingsY = height / 2 - settingsHeight / 2;                        //set the y position of the settings button
    scoreboardX = width / 4 - scoreboardWidth / 2;                      //set the x position of the scoreboard button
    scoreboardY = ((height / 4) * 3) - exitHeight / 2;                  //set the y position of the scoreboard button
    deadMainMenuX = width / 2 - deadMainMenuWidth / 2;                  //set the x position of the dead main menu button
    deadMainMenuY = ((height / 4) * 3) - deadMainMenuHeight / 2;        //set the y position of the dead main menu button
    easyModeX = width / 4 - easyModeWidth / 2;                          //set the x position of the easy mode button
    easyModeY = 150 - easyModeHeight / 2;                               //set the y position of the easy mode button
    hardModeX = ((width / 4) * 3) - hardModeWidth / 2;                  //set the x position of the hard mode button
    hardModeY = 150 - hardModeHeight / 2;                               //set the y position of the hard mode button
    settingsMainMenuX = width / 2 - settingsMainMenuWidth / 2;          //set the x position of the settings main menu button
    settingsMainMenuY = ((height / 4) * 3) - settingsMainMenuHeight / 2;//set the y position of the settings main menu button
    scoreMainMenuX = width / 2 - scoreMainMenuWidth / 2;                //set the x position of the scoreboard main menu button
    scoreMainMenuY = ((height / 4) * 3) - scoreMainMenuHeight / 2;      //set the y position of the scoreboard main menu button

    TEXTBOX nameTextBox = new TEXTBOX();
    nameTextBox.X = width/2 - 100;
    nameTextBox.Y = height/2 + 20;
    nameTextBox.W = 200;
    nameTextBox.H = 40;
    nameTextBox.BorderWeight = 1;
    nameTextBox.BorderEnable = true;
    textBoxes.add(nameTextBox);
    
    mainMenu(); //run main menu
}

void draw() {
    if (gameOver) {           
        deadScreen();                 
    }
    else if (mainMenu) {
        mainMenu();
    }
    else if (settings) {
        settingsMenu();
    }
    else if (scoreboard) {
        scoreboard();
    }
    else{
        runTime += 1;               //add 1 to time
        fill(0);
        stroke(0);                  //color black for bug
        rect(bugX,bugY,8,8);        //draw bug
        fill(255,0,0);              //make boarder red
        stroke(255,0,0);            //make boarder red
        rect(0,0,width,8);          //draw boarder
        rect(0,height - 8,width,8); //draw boarder
        rect(0,0,8,height);         //draw boarder
        rect(width - 8,0,8,height); //draw boarder
        
        if ((runTime % 10) == 0) {  //will change this for speed controls
            move();                 //for moving gecko co-ords
            display();              //for checking if ghecho has hit bug and to display the gecko
            checkdead();            //check if poor gecko ded
        }
    }
}

void keyPressed() {  //for checking when user presses a key and changes the angle so you cant be dumb and go backwards
    if (keyCode == UP && angleFacing!= 270 && (geckoY[1] - 8)!= geckoY[2]) {       //detects up
        angleFacing = 90;
    }
    if (keyCode == DOWN && angleFacing!= 90 && (geckoY[1] + 8)!= geckoY[2]) {      //detects down
        angleFacing = 270;
    }
    if (keyCode == LEFT && angleFacing!= 0 && (geckoX[1] - 8)!= geckoX[2]) {       //detects left
        angleFacing = 180;
    }
    if (keyCode == RIGHT && angleFacing!= 180 && (geckoX[1] + 8)!= geckoX[2]) {    //detects right
        angleFacing = 0;
    }
    if (gameOver){
        for (TEXTBOX t : textBoxes) {
            if (t.KEYPRESSED(key, (int)keyCode)) {
                
            }
        }
    }
}

void move() {
    for (int i = geckoSize; i > 0; i--) {
        if (i != 1) {
            geckoX[i] = geckoX[i - 1];
            geckoY[i] = geckoY[i - 1];
        } else {
            switch(angleFacing) {
                case 0:
                    geckoX[1] += 8;
                    if (easyMode) {
                        if (geckoX[1] > width) {
                            geckoX[1] = 0; // Wrap around to the left side
                        }
                    } else {
                        if (geckoX[1] >= width) {
                            gameOver = true; // Hit the wall in normal mode
                        }
                    }
                    break;
                case 90:
                    geckoY[1] -= 8;
                    if (geckoY[1] < 0) {
                        if (easyMode) {
                            geckoY[1] = height - 8; // Wrap around to the bottom
                        } else {
                            gameOver = true; // Hit the wall
                        }
                    }
                    break;
                case 180:
                    geckoX[1] -= 8;
                    if (geckoX[1] < 0) {
                        if (easyMode) {
                            geckoX[1] = width - 8; // Wrap around to the right side
                        } else {
                            gameOver = true; // Hit the wall
                        }
                    }
                    break;
                case 270:
                    geckoY[1] += 8;
                    if (geckoY[1] > height) {
                        if (easyMode) {
                            geckoY[1] = 0; // Wrap around to the top
                        } else {
                            gameOver = true; // Hit the wall
                        }
                    }
                    break;
            }
        }
    }
}

void display() {
    if (geckoX[1] ==  bugX && geckoY[1] ==  bugY) {       //if the gecko hits the bug
        geckoSize += 1;                                   //add 1 to the size of the gecko
        reset = true;                                     //reset the bug and gecko
        while(reset) {
            bugX = (round(random(47)) + 1) * 8;           //randomise the bug position
            bugY = (round(random(47)) + 1) * 8;
            for (int i = 1; i < geckoSize; i++) {
                if (bugX ==  geckoX[i] && bugY ==  geckoY[i]) { //check if the bug is in the gecko
                    reset = true;
                }
                else{
                    reset = false;                        //if not then continue program
                    i = 1000;
                }
            }
        }
    }
    stroke(81, 166, 50);
    fill(81, 166, 50);                                  //green color for gecko
    rect(geckoX[1], geckoY[1], 8, 8);                   //draw head
    stroke(249, 202, 48);
    fill(249, 202, 48);                                 //sandy color for tail  
    rect(geckoX[geckoSize], geckoY[geckoSize], 8, 8);   //erase tail
}

void checkdead() {
    for (int i = 2; i <=  geckoSize; i++) {              
        if (hardMode) {                     
            if (geckoX[1] ==  geckoX[i] && geckoY[1] ==  geckoY[i]) {                             //check if the gecko has hit itself
                gameOver = true;                                                                  //if the head of the gecko is in the same position as the tail then game over
            }
            if (geckoX[1] >= (width - 8) || geckoY[1]>= (height - 8) || geckoX[1]<= 0 || geckoY[1]<= 0) { //check if the gecko has hit the wall
                gameOver = true;                                                                  //if the head of the gecko is in the same position as the wall then agem over
            }
        }
        if (easyMode) {
            if (geckoX[1] ==  geckoX[i] && geckoY[1] ==  geckoY[i]) {                             //check if the gecko has hit itself
                gameOver = true;                                                                  //if the head of the gecko is in the same position as the tail then game over
            }
        }
    }
}
void restart() {                    //reset all variables
    background(249, 202, 48);       //sandy colored background
    geckoX[1] = 200;                //reset gecko position
    geckoY[1] = 200;               
    for (int i = 2;i < 1000;i++) {  //reset all other gecko segments
        geckoX[i] = 0;
        geckoY[i] = 0;
    }
    gameOver = false;                 //reset game over
    settings = false;                 //reset settings
    scoreboard = false;               //reset scoreboard
    bugX = (round(random(47)) + 1) * 8;   //reset bug position
    bugY = (round(random(47)) + 1) * 8;
    geckoSize = 5;                    //reset gecko size
    runTime = 0;                      //reset timer
    angleFacing = 0;                  //reset angle
    reset = true;                     //reset reset
}
void mainMenu() {
    buttonUpdate(mouseX, mouseY);                   //check if mouse is over button
    background(249, 202, 48);                       //sandy colored background
    
    if (startOver) {
        fill(startHighlight);                       //if mouse is over button then highlight
    }
    else{
        fill(startColor);                           //if mouse is not over button then normal color
    }
    stroke(255);                                    //white boarder
    rect(startX, startY, startWidth, startHeight);  //draw button
    
    if (exitOver) {
        fill(exitHighlight);
    }
    else{
        fill(exitColor);
    }
    stroke(255);
    rect(exitX, exitY, exitWidth, exitHeight);
    
    if (settingsOver) {
        fill(settingsHighlight);
    }
    else{
        fill(settingsColor);
    }
    stroke(255);
    rect(settingsX, settingsY, settingsWidth, settingsHeight);
    
    if (scoreboardOver) {
        fill(scoreboardHighlight);
    }
    else{
        fill(scoreboardColor);
    }
    stroke(255);
    rect(scoreboardX, scoreboardY, scoreboardWidth, scoreboardHeight);
    
    fill(255);                                                                          //white text
    textSize(20);                                                                       //text size 20
    text("Start", startX + startWidth / 2, startY + startHeight / 2);                   //put text on buttons
    text("Exit", exitX + exitWidth / 2, exitY + exitHeight / 2);
    text("Settings", settingsX + settingsWidth / 2, settingsY + settingsHeight / 2);
    text("Scoreboard", scoreboardX + scoreboardWidth / 2, scoreboardY + scoreboardHeight / 2);
    
    fill(81, 166, 50);                                                                  //green text
    textSize(50);                                                                       //text size 50
    text("Gecko Game", 200, 100);                                                       //put title text on screen
    
}
void buttonUpdate(int x, int y) {
    if (mainMenu) {
        if (startOver(startX, startY, startWidth, startHeight)) {   //check if mouse is over button
            startOver = true;                                       //if mouse is over button then highlight
            exitOver = false;                                       //the other 3 is to prevent the other buttons being highlighted if over a different button
            settingsOver = false;
            scoreboardOver = false;
        }
        else if (exitOver(exitX, exitY, exitWidth, exitHeight)) {
            exitOver = true;
            startOver = false;
            settingsOver = false;
            scoreboardOver = false;
        }
        else if (settingsOver(settingsX, settingsY, settingsWidth, settingsHeight)) {
            settingsOver = true;
            startOver = false;
            exitOver = false;
            scoreboardOver = false;
        }
        else if (scoreboardOver(scoreboardX, scoreboardY, scoreboardWidth, scoreboardHeight)) {
            scoreboardOver = true;
            startOver = false;
            exitOver = false;
            settingsOver = false;
            
        }
        else{
            startOver = false;  //if mouse is not over any button then normal color
            exitOver = false;
            settingsOver = false;
            scoreboardOver = false;
        }
    }
    if (gameOver) {
        if (startOver(deadMainMenuX, deadMainMenuY, deadMainMenuWidth, deadMainMenuHeight)) {   //check if mouse is over button
            deadMainMenuOver = true;                                                            //if mouse is over button then highlight
        }
        else{
            deadMainMenuOver = false;                                                           //if mouse is not over button then normal color
        }
    }
    if (settings) {
        if (settingsMainMenuOver(settingsMainMenuX, settingsMainMenuY, settingsMainMenuWidth, settingsMainMenuHeight)) {
            settingsMainMenuOver = true;
            easyModeOver = false;
            hardModeOver = false;
        }
        else if (easyModeOver(easyModeX, easyModeY, easyModeWidth, easyModeHeight)) {
            easyModeOver = true;
            settingsMainMenuOver = false;
            hardModeOver = false;
        }
        else if (hardModeOver(hardModeX, hardModeY, hardModeWidth, hardModeHeight)) {
            hardModeOver = true;
            settingsMainMenuOver = false;
            easyModeOver = false;
        }
        else{
            settingsMainMenuOver = false;
            easyModeOver = false;
            hardModeOver = false;
        }
    }
    if (scoreboard) {
        if (scoreMainMenuOver(scoreMainMenuX, scoreMainMenuY, scoreMainMenuWidth, scoreMainMenuHeight)) {
            scoreMainMenuOver = true;
        }
        else{
            scoreMainMenuOver = false;
        }
    }
}
void mousePressed() {    //check if mouse is pressed and if it is over a button
    if (mainMenu) {      //if mouse is over button then run the function
        if (startOver) {
            mainMenu = false;
            gameOver = false;
            restart();
        }
        if (exitOver) {
            exit();
        }
        if (settingsOver) {
            settings = true;
            mainMenu = false;
            settingsMenu();
        }
        if (scoreboardOver) {
            scoreboard = true;
            mainMenu = false;
            scoreboard();
        }
    }
    if (gameOver) {
        if (deadMainMenuOver) {
            mainMenu = true;
            gameOver = false;
            saveToScoreboard();
        }
        for (TEXTBOX t : textBoxes) {
             t.PRESSED(mouseX, mouseY);
        }
    }
    if (settings) {
        // Handle button clicks in the settings menu
        if (easyModeOver) {
            easyMode = true;
            hardMode = false;
            // Handle easy mode
        } else if (hardModeOver) {
            hardMode = true;
            easyMode = false;
            // Handle hard mode
        } else if (settingsMainMenuOver) {
            mainMenu = true;
            settings = false;
            // Reset button highlighting for settings menu
            easyModeOver = false;
            hardModeOver = false;
        }
    }
    if (scoreboard) {
        if (scoreMainMenuOver) {
            mainMenu = true;
            scoreboard = false;
        }
    }
}
boolean startOver(int x, int y, int width, int height) {                             //check if mouse is over button
    if (mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height) { //if mouse is over button then return true
        return true;
    }
    else {
        return false;                                                                //if mouse is not over button then return false
    }
}
boolean exitOver(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height) {
        return true;
    } 
    else {
        return false;
    }
}
boolean settingsOver(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height) {
        return true;
    } 
    else {
        return false;
    }
}
boolean scoreboardOver(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height) {
        return true;
    } 
    else {
        return false;
    }
}
boolean deadMainMenuOver(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height) {
        return true;
    } 
    else {
        return false;
    }
}
boolean easyModeOver(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height) {
        return true;
    } 
    else {
        return false;
    }
}
boolean hardModeOver(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height) {
        return true;
    }
    else {
        return false;
    }
}
boolean settingsMainMenuOver(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height) {
        return true;
    } 
    else {
        return false;
    }
}
boolean scoreMainMenuOver(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height) {
        return true;
    } 
    else {
        return false;
    }
}

void deadScreen() {
    background(249, 202, 48);                       //sandy colored background
    buttonUpdate(mouseX, mouseY);                   //check if mouse is over button
    
    fill(255,0,0);                                  //red text
    textSize(50);                                   //text size 50
    text("You Died", 200, 100);                     //put title text on screen
    fill(0);                                        //black text
    textSize(20);                                   //text size 20
    text("Your Score Was: " + geckoSize, 200, 150); //put score text on screen
    //put button on bottom middle of screen
    text("Please Enter Your Name", 200, 200);
    textAlign(LEFT);
    for (TEXTBOX t : textBoxes) {
        t.DRAW();
    }
    if (deadMainMenuOver) {
        fill(deadMainMenuHighlight);
    }
    else{
        fill(deadMainMenuColor);
    }
    textAlign(CENTER);
    stroke(255);
    rect(deadMainMenuX, deadMainMenuY, deadMainMenuWidth, deadMainMenuHeight);
    fill(255);
    textSize(20);
    text("Main Menu", deadMainMenuX + deadMainMenuWidth / 2, deadMainMenuY + deadMainMenuHeight / 2);
}
void settingsMenu() {
    background(249, 202, 48);       // Sandy colored background
    buttonUpdate(mouseX, mouseY);   // Check if mouse is over button
    
    fill(0);                        // Black text
    textSize(50);                   // Text size 50
    text("Settings", 200, 50);      // Title text
    
    // Check if mouse is over Easy Mode button
    if (easyModeOver) {
        fill(easyModeHighlight); // Highlight when mouse is over
    }
    else{
        fill(easyModeColor);
    }
    stroke(255);
    rect(easyModeX, easyModeY, easyModeWidth, easyModeHeight);
    
    // Check if mouse is over Hard Mode button
    if (hardModeOver) {
        fill(hardModeHighlight); // Highlight when mouse is over
    }
    else{
        fill(hardModeColor);
    }
    stroke(255);
    rect(hardModeX, hardModeY, hardModeWidth, hardModeHeight);
    
    // Check if mouse is over Main Menu button
    if (settingsMainMenuOver) {
        fill(settingsMainMenuHighlight); // Highlight when mouse is over
    }
    else{
        fill(settingsMainMenuColor);
    }
    stroke(255);
    rect(settingsMainMenuX, settingsMainMenuY, settingsMainMenuWidth, settingsMainMenuHeight);
    
    fill(255);      // White text
    textSize(20);   // Text size 20
    text("Easy Mode", easyModeX + easyModeWidth / 2, easyModeY + easyModeHeight / 2);
    text("Hard Mode", hardModeX + hardModeWidth / 2, hardModeY + hardModeHeight / 2);
    text("Main Menu", settingsMainMenuX + settingsMainMenuWidth / 2, settingsMainMenuY + settingsMainMenuHeight / 2);
    //what mode your on below the buttons in the middle of screen
    fill(0);
    if (easyMode) {
        text("Easy Mode", 200, 155);
    }
    else if (hardMode) {
        text("Hard Mode", 200, 155);
    }
}

void appendTextToFile(String filename, String text){
  File f = new File(dataPath(filename));
  if(!f.exists()){
    createFile(f);
  }
  try {
    PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(f, true)));
    out.println(text);
    out.close();
  }catch (IOException e){
      e.printStackTrace();
  }
}

/**
 * Creates a new file including all subfolders
 */
void createFile(File f){
  File parentDir = f.getParentFile();
  try{
    parentDir.mkdirs(); 
    f.createNewFile();
  }catch(Exception e){
    e.printStackTrace();
  }
}

void saveToScoreboard() {
    if (textBoxes.get(0).Text.equals("")) {
        return;
    } else {
        typed = textBoxes.get(0).Text;
        String mode = "";
        if (easyMode) {
            mode = "easy";
        } else if (hardMode) {
            mode = "hard";
        }
        String main = typed + ":"+mode+":"+geckoSize;
        //put above into an array but all as one string
        appendTextToFile("scoreboard.txt", main);
    }
    draw();
}
void scoreboard() {
    background(249, 202, 48);       // Sandy colored background
    buttonUpdate(mouseX, mouseY);   // Check if mouse is over button
    
    fill(0);                        // Black text
    textSize(50);                   // Text size 50
    text("Scoreboard", 200, 50);    // Title text
    
    // Check if mouse is over Main Menu button
    if (scoreMainMenuOver) {
        fill(scoreMainMenuHighlight); // Highlight when mouse is over
    }
    else{
        fill(scoreMainMenuColor);
    }
    stroke(255);
    rect(scoreMainMenuX, scoreMainMenuY, scoreMainMenuWidth, scoreMainMenuHeight);
    
    fill(255);      // White text
    textSize(20);   // Text size 20
    text("Main Menu", scoreMainMenuX + scoreMainMenuWidth / 2, scoreMainMenuY + scoreMainMenuHeight / 2);
    text("Easy Mode", 100, 100);
    text("Hard Mode", 300, 100);
    
    fill(0);
    textSize(15);
    scoreboardNames.clear();
    topScore = new int[5];
    allScores = new int[2500];
    String[] lines = loadStrings("scoreboard.txt");
    for (int i = 0; i < lines.length; i++) {
        String[] parts = split(lines[i], ':');
        if (parts[1].equals("easy")) {
            scoreboardNames.add(parts[0]);
            allScores[i] = Integer.parseInt(parts[2]);
        }
    }
    allScores = sort(allScores);
    for (int i = 0; i < 5; i++) {
        topScore[i] = allScores[allScores.length - 1 - i];
    }
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < lines.length; j++) {
            String[] parts = split(lines[j], ':');
            if (topScore[i] == Integer.parseInt(parts[2]) && parts[1].equals("easy")) {
                text(i + 1 + ". " + parts[0] + " - " + parts[2], 100, 120 + (i * 20));
            }
        }
    }
    scoreboardNames.clear();
    topScore = new int[5];
    allScores = new int[2500];
    for (int i = 0; i < lines.length; i++) {
        String[] parts = split(lines[i], ':');
        if (parts[1].equals("hard")) {
            scoreboardNames.add(parts[0]);
            allScores[i] = Integer.parseInt(parts[2]);
        }
    }
    allScores = sort(allScores);
    for (int i = 0; i < 5; i++) {
        topScore[i] = allScores[allScores.length - 1 - i];
    }
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < lines.length; j++) {
            String[] parts = split(lines[j], ':');
            if (topScore[i] == Integer.parseInt(parts[2]) && parts[1].equals("hard")) {
                text(i + 1 + ". " + parts[0] + " - " + parts[2], 300, 120 + (i * 20));
            }
        }
    }
}