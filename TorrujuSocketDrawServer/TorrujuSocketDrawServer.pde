  
import processing.net.*; 

Server myServer;
String host = "127.0.0.1";
int port = 7777;
DataWrapper myDataWrapper;


float brushSize = 20;
 
float SCREEN_WIDTH = 1000;
float SCREEN_LENGTH = 1000;
float mouseXnormalized = 0;
float mouseYnormalized = 0;



void setup() { 
  
  size(1000,1000);
  myServer = new Server(this,port,host);
  myDataWrapper = new DataWrapper();
  background(255);
} 
 
void draw() { 
  
  if(mousePressed)
  {
      print("Mouse X" + mouseX + "\n");
      mouseYnormalized = mouseY / SCREEN_LENGTH * 255;
      mouseXnormalized = mouseX / SCREEN_WIDTH * 255;
      stroke(mouseXnormalized,mouseYnormalized,0);
      strokeWeight(brushSize);
      //fill(mouseXnormalized,mouseYnormalized,0);
      
      line(pmouseX, pmouseY, mouseX, mouseY);
      myDataWrapper.SetMousePosition(mouseX, mouseY);
      myServer.write(myDataWrapper.GetData()); 
  }
  
} 

void keyPressed()
{
   background(255);
}
