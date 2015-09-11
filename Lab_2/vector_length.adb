
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics; use Ada.Numerics;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;


-- Function Vector Length-------------------------------------------------

   function Vector_Length(X,Y,Z: in Float) return Float is
      
      Length : Float;
      Hypotenuse : Float;
      
   begin 
      

      Hypotenuse:= Sqrt(X**2 + Y**2);
      Length:= Sqrt(Hypotenuse**2 + Z**2);
      
      return Length;
      
      
   end Vector_Length;
   --------------------------------------------------------------------------
