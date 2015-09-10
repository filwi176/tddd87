with ada.text_IO; use ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics; use Ada.Numerics;


procedure Lab_2 is

   -- Radian to degree
   function To_Degree(R: in Float) return Float is
      Degree : Float;
   begin
      Degree := 180.0 * R / Pi;
      
      loop 
	 if Degree>360.0 then
	    Degree := Degree - 360.0;
	 elsif Degree<-360.0 then
	    Degree := Degree + 360.0;
	 else exit;
	 end if;
      end loop;
      
      if Degree<0.0 then
	 Degree := 360.0 + Degree;
      end if;
      
      return Degree;
   end To_Degree;
   
   
   --Degree to radian
   function To_Radian(D: in Float) return Float is
      Radian : Float;
      
   begin
      Radian := Pi * D / 180.0;
      
      loop
	 if Radian>2.0*Pi then
	    Radian := Radian - 2.0*Pi;
	 elsif Radian<-2.0*Pi then
	    Radian := Radian + 2.0*Pi;
	 else exit;
	 end if;
      end loop;
      
      if Radian<0.0 then
	 Radian := 2.0*Pi + Radian;
      end if;
      
      return Radian;
   end To_Radian;
   
   
   Degree : Float;
   Rad : Float;
   Deg : Float;
   Radian : Float;
   
begin
   
   Get (Rad);
   Degree := To_Degree(Rad);
   Put (Degree, Aft=>2, Exp=>0);
   
   New_Line;
   
   Get (Deg);
   Radian := To_Radian(Deg);
   Put (Radian, Aft=>2, Exp=>0);
   
end Lab_2;

