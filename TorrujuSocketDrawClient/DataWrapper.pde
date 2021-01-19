public class DataWrapper
{
   public float mouseXposition;
   public float mouseYposition;
   public float previousMouseXPosition;
   public float previousMouseYPosition;
   public void SetMousePosition(float mouseXposition, float mouseYposition)
   {
     this.mouseXposition = mouseXposition;
     this.mouseYposition = mouseYposition;
   }
   
   public String GetData()
   {
      return "" + mouseXposition + " " + mouseYposition; 
   }
   
   public void ParseData(String data)
   {
       previousMouseXPosition = this.mouseXposition;
       previousMouseYPosition = this.mouseYposition;
       int spacePosition = data.indexOf(" ");
       this.mouseXposition = int(data.substring(0,spacePosition));
       this.mouseYposition = int(data.substring(spacePosition +1, data.length()));
   }
}
