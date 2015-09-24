with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;


procedure Lab_3 is
   
   
   
   type Generate_Type is 
     array(1..20) of Integer;
   
   Random : Generate_Type;
   
   
   type Generate_Pair is
     array(1..2) of Integer;
  Random_Generate_Pair : Generate_Pair;
   
   type Generate_Pair_Array is
     array(1..20) of Generate_Pair;
   
Random_Generate_Pair_Array : Generate_Pair_Array;
   
   
   
   
   
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
   
   
     
   -------------------------------------------------
   function Generate return Generate_Pair_Array is
      
      subtype OneTen_Integer is Integer range 1..10;
      
      package OneTen_Integer_Random is
   	 new Ada.Numerics.Discrete_Random(Result_Subtype => OneTen_Integer);
      
      G : OneTen_Integer_Random.Generator;
      Arr : Generate_Pair_Array;
   begin
      OneTen_Integer_Random.Reset(G);
      
      Arr:= (others => (others => OneTen_Integer_Random.Random(G)));
      
      return Arr;
      
   end Generate;
   
      -------------------------------------------------
   -- SKRÄP?
   --  function Generate return Generate_Pair_Array is
      
   --     subtype OneTen_Integer is Integer range 1..10;
      
   --     package OneTen_Integer_Random is
   --  	 new Ada.Numerics.Discrete_Random(Result_Subtype => OneTen_Integer);
      
   --     G : OneTen_Integer_Random.Generator;
   --     Pair : Generate_Pair;
   --     Arr : Generate_Pair_Array;
   --  begin
   --    OneTen_Integer_Random.Reset(G);
      
   --     Pair := (others => OneTen_Integer_Random.Random(G));
      
      
   --     Arr := (others => (others => Pair));
      
   --     return Arr;
      
   --  end Generate;
   
   
   
   --------------------------------------------   
   
 
   procedure Put(Arr: in Generate_Type) is
      
   begin  
      
      for I in Arr'Range loop
	 
	 Put(Arr(I));
	 New_Line;
	
      end loop;
      
   end Put;
   
   --------------------------------------------   
   
   
   procedure Put(Arr: in Generate_Pair_Array) is
      
   begin  
      
      for I in Arr'Range loop
	 Put(Arr(I)(1));
	 Put(Arr(I)(2));
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
   -----------------------------------------------
   procedure Sort(Arr : in out Generate_Pair_Array) is 
      
      
      Swapper : Generate_Pair_Array;
      
   begin 
      Swapper := (others => (others => 0));
      
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

   -------
   -------------------------------------------------   
begin
   
   --  -- DEL A
   --  -- Generera 20 slumptal
   --  Random := Generate;
   
   --  -- Skriv ut osorterat
   --  Put("Osorterade tal: ");
   --  Put(Random);
   
   --  New_Line;
   
   --  -- Sortera fältet Random
   --  Put("Sorterade tal: ");
   --  New_Line;
   
   --  Sort(Random);
   
   --  -- Skriv ut sorterat
   --  Put(Random);
   
   --  New_Line(2);
   ------------------------------------------------------
   
   
   -- DEL B
   
   -- Generera slumptal till talpar
   Random_Generate_Pair_Array := Generate;
   

   -- Skriv ut osorterade talpar
   Put(Random_Generate_Pair_Array);
   
   New_Line;
      
   -- Sortera talar med avseende på andra talet och sedan på det första talet

   --  for I in 1..20 loop
       Sort(Random_Generate_Pair_Array(I));
      
      
      
      
      
   --     end loop;
         
   --  -- Skriv ut sorterade talpar, ett talpar per rad
   
        Put(Random_Generate_Pair_Array);
   
   
   
   ------------------------------------------------------

   
end Lab_3;
