with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;


procedure Lab_3 is
   
   
   
   type Generate_Type is 
     array(1..20) of Integer;
   
   Random : Generate_Type;
   

   -------------------------------------------------
   function Generate return Generate_Type is
      
      subtype OneTen_Integer is Integer range 1..10;
      
      package OneTen_Integer_Random is
	 new Ada.Numerics.Discrete_Random(Result_Subtype => OneTen_Integer);
      
      G : OneTen_Integer_Random.Generator;
      Arr : Generate_Type;
   begin
      OneTen_Integer_Random.Reset(G);
     
      Arr:= (others => OneTen_Integer_Random.Random(G));
      
      return Arr;
     
   end Generate;
   
   
   
   -----------------------------------------------   
   
   
   
   procedure Put(Arr: in Generate_Type) is
      
   begin  
      
      for I in Arr'Range loop
	 
	 Put(Arr(I));
	 New_Line;
	
      end loop;
      
   end Put;
   
   
   -----------------------------------------------
   procedure Sort(Arr : in out Generate_Type) is 
      
      
      Swapper : Generate_Type;
      
   begin 
      Swapper := (others => 0);
      
      for J in (Arr'First + 1)..Arr'Last loop
	 
	 for I in reverse J.. Arr'Last loop
	    if Arr(I) < Arr(I-1) then
	       Swapper(I) := Arr(I) ;
	       Arr(I) := Arr(I-1);
	       Arr(I-1) := Swapper(I);
	    end if; 
	 end loop;
	 
      end loop;     
      
      
   end Sort;

   -------------------------------------------------   
begin
   
   -- DEL A
   -- Generera 20 slumptal
   Random := Generate;
   
   -- Skriv ut osorterat
   Put("Osorterade tal: ");
   Put(Random);
   
   New_Line;
   
   -- Sortera fältet Random
   Put("Sorterade tal: ");
   New_Line;
   
   Sort(Random);
   
   -- Skriv ut sorterat
   Put(Random);
   
   
   ------------------------------------------------------
   
   
   -- DEL B
   
   -- Generera slumptal till talpar
   
   -- Skriv ut osorterade talpar
   
   -- Sortera talar med avseende på andra talet och sedan på det första talet
   
   -- Skriv ut sorterade talpar, ett talpar per rad
   
   
   
   
   
   ------------------------------------------------------

   
end Lab_3;
