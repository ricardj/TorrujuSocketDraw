  
import processing.net.*; 

Client myClient; 
String dataIn; 

String host = "127.0.0.1";
int port = 7777;
float brushSize = 20;
 
float SCREEN_WIDTH = 1000;
float SCREEN_LENGTH = 1000;
float mouseXnormalized = 0;
float mouseYnormalized = 0;
DataWrapper myDataWrapper;


void setup() { 
  
  size(1000,1000);
  
  // Connect to the local machine at port 5204.
  // This example will not run if you haven't
  // previously started a server on this port.
  myClient = new Client(this, host, port);
  myDataWrapper = new DataWrapper();
  background(255);
} 
 
void draw() { 
  
  if(mousePressed)
  {
      print("Mouse X" + mouseX + "\n");

      
      //fill(mouseXnormalized,mouseYnormalized,0);
      
      DrawWithBrush(pmouseX, pmouseY, mouseX, mouseY);

  }
  
  
  
  if (myClient.available() > 0) { 
    dataIn = myClient.readString();
    myDataWrapper.ParseData(dataIn);
    DrawWithBrush(myDataWrapper.previousMouseXPosition, myDataWrapper.previousMouseYPosition,
                myDataWrapper.mouseXposition,myDataWrapper.mouseYposition
    );
  } 
 
  
} 

public void DrawWithBrush(float previousX,float  previousY,float positionX, float positionY)
{
  mouseYnormalized = positionY / SCREEN_LENGTH * 255;
  mouseXnormalized = positionX / SCREEN_WIDTH * 255;
  stroke(mouseXnormalized,mouseYnormalized,0);
  strokeWeight(brushSize);
  line(previousX, previousY, positionX, positionY);
}

void keyPressed()
{
   background(255);
}
