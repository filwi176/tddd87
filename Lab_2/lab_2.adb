with ada.text_IO; use ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics; use Ada.Numerics;


procedure Lab_2 is
   
   -- Radian to degree ------------------------------------------------------
   function To_Degree(R: in Float) return Float is
      Degree : Float;
   begin
      Degree := 180.0 * R / Pi;
      
      -- Controlling degree value
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
   -------------------------------------------------------------------------
   
   -- Radian to degree menu ------------------------------------------------
   procedure To_Degree_Menu is
      Option : Integer;
      Rad : Float;
      Degree : Float;
      
   begin
      loop
	 Put ("Return, press 1");
	 New_Line;
	 Put ("Calculate, press 2");
	 New_Line;
	 Get (Option);
	 if Option=1 then
	    exit;
	 elsif Option=2 then
	    Put ("Enter radian value: ");
	    Get (Rad);
	    Degree := To_Degree(Rad);
	    Put (Rad, Aft=>2, Exp=>0);
	    Put (" radians equals ");
	    Put (Degree, Aft=>2, Exp=>0);
	    Put (" degrees.");
	    New_Line;
	    exit;
	 end if;
      end loop;
   end To_Degree_Menu; 
   ---------------------------------------------------------------------------
   
   --Degree to radian---------------------------------------------------------
   function To_Radian(D: in Float) return Float is
      Radian : Float;
      
   begin
      Radian := Pi * D / 180.0;
      
      -- Controlling radian value
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
   --------------------------------------------------------------------------
   
   -- Degree to Radian menu--------------------------------------------------
   procedure To_Radian_Menu is
      Option : Integer;
      Deg : Float;
      Radian : Float;
      
   begin
      loop
	 Put ("Return, press 1");
	 New_Line;
	 Put ("Calculate, press 2");
	 New_Line;
	 Get (Option);
	 if Option=1 then
	    exit;
	 elsif Option=2 then
	    Put ("Enter degree value: ");
	    Get (Deg);
	    Radian := To_Radian(Deg);
	    Put (Deg, Aft=>2, Exp=>0);
	    Put (" degrees equals ");
	    Put (Radian, Aft=>2, Exp=>0);
	    Put (" radians. ");
	    New_Line;
	    exit;
	 end if;
      end loop;
   end To_Radian_Menu; 
   --------------------------------------------------------------------------
   
   -- Vector length menu-----------------------------------------------------
   procedure Vector_Length_Menu is
      
      Option : Integer;
      
   begin
      loop 
	 Put ("Return, press 1");
	 Put ("Calculate, press 2");
	 if Option=1 then
	    exit;
	 elsif Option=2 then
	    -- Vector_Length_Function
	 end if;
      end loop;
      
      
      
end Vector_Length_Menu;

   
   Option : Integer;
   
begin
   
   -- Huvudmeny
   
   loop 
      Put ("Radians to degrees, press 1");
      New_Line;
      Put ("Degrees to radians, press 2");
      New_Line;
      Put ("Calculating vector length, press 3");
      New_Line;
      Put ("Float to Integer, press 4");
      New_Line;
      Put ("To create vector data, press 5");
      New_Line;
      Get (Option);
      if Option=1 then
	 -- To_Degree_menu
	 To_Degree_Menu;

	 
      elsif Option=2 then
	 -- To_Radian_menu
	 To_Radian_Menu;
	 
	 --  elsif Option=V then
	 --  	 -- Underprogrammeny Vector_Length
	 
	 --  elsif Option=I then
	 --  	 -- Underprogrammeny To_Integer
	 
	 --  elsif Option=C then
	 --  	 -- Underprogrammeny Create_Vector_Data
	 
	 
      end if;
      
      
   end loop;
   
   
   
end Lab_2;

