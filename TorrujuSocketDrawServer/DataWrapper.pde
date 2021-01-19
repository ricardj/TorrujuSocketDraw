public class DataWrapper
{
   float mouseXposition;
   float mouseYposition;
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
       int spacePosition = data.indexOf(" ");
       this.mouseXposition = int(data.substring(0,spacePosition));
       this.mouseYposition = int(data.substring(spacePosition +1, data.length()));
   }
}
