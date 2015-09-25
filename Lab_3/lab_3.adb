with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;


procedure Lab_3 is
   
   
   
   type Generate_Type is 
     array(1..20) of Integer;
   
   Random : Generate_Type;
   
   
   type Generate_Pair is
     array(1..2) of Integer;

   
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
   
   --------------------------------------------   
   
   
   procedure Put(Arr: in Generate_Type) is
      
   begin  
      
      for I in Arr'Range loop
	 
	 Put(Arr(I), Width => 6);
	 New_Line;
	 
      end loop;
      
   end Put;
   
   --------------------------------------------   
   
   
   procedure Put(Arr: in Generate_Pair_Array) is
      
   begin  
      
      for I in Arr'Range loop
	 Put(Arr(I)(1), Width => 4);
	 Put(Arr(I)(2), Width => 4);
   	 New_Line;
      end loop;
      
   end Put;
   ----------------------------------------
   procedure Swap(A, B : in out Integer) is
      Swapper: Integer;
   begin
      Swapper := A;
      A := B;
      B := Swapper;      
   end Swap;
   ------------------------------------------
   procedure Swap(A, B : in out Generate_Pair) is
      Swapper: Generate_Pair;
   begin
      Swapper:= (others => 0);
      Swapper := A;
      A := B;
      B := Swapper;      
   end Swap;
   ------------------
   --DEL A-----------------------------
   procedure Sort(Arr : in out Generate_Type) is 
      
   begin 

      
      for J in (Arr'First + 1)..Arr'Last loop
	 
	 for I in reverse J.. Arr'Last loop
	    if Arr(I) < Arr(I-1) then
	       Swap(Arr(I),Arr(I-1)); 
	    end if; 
	 end loop;
	 
      end loop;     
      
      
   end Sort;
   
   

   
   -----------------------------------------------
   procedure Sort(Arr : in out Generate_Pair_Array) is 
      
      
      
      function "<"(Pairone, Pairtwo : in Generate_Pair) return Boolean is
	 
	 
      begin

	 if Pairtwo(2) > Pairone(2) then
	    return True;
	    
	 elsif  Pairone(2) = Pairtwo(2) and Pairtwo(1) > Pairone(1) then
	    return True;
	    
	 else
	    return False;  
	    
	    
	 end if;
	 
	 
	 
      end "<";
      
      
      
   begin 

      
      for J in (Arr'First + 1)..Arr'Last loop
	 
	 for I in reverse J.. Arr'Last loop
	    if Arr(I) < Arr(I-1) then
	       Swap(Arr(I), Arr(I-1)); 
	    end if; 
	 end loop;
	 
      end loop;     
      
      
   end Sort;

   -----------------------------------------------
   --  procedure Sort(Arr : in out Integer) is 
   
   --  begin 

   
   --     for J in (Arr'First + 1)..Arr'Last loop
   
   --  	  for I in reverse J.. Arr'Last loop
   --  	     if Arr(I) < Arr(I-1) then
   --  		Swap(Arr(I), Arr(I-1)); 
   --  	     end if; 
   --  	  end loop;
   
   --     end loop;     
   
   
   --  end Sort;

   
   -------------------------------------------------   
begin
   
   -- DEL A
   
   Put("DEL A");
   New_Line;
   -- Generera 20 slumptal
   Random := Generate;
   
   -- Skriv ut osorterat
   Put("Osorterade tal: ");
   New_Line;
   Put(Random);
   
   New_Line;
   
   -- Sortera fältet Random
   Put("Sorterade tal: ");
   New_Line;
   
   Sort(Random);
   
   -- Skriv ut sorterat
   Put(Random);
   
   New_Line(2);
   
   --------------------------------
   
   
   -- DEL B
   Put("DEL B");
   New_Line;
   -- Generera slumptal till talpar
   Random_Generate_Pair_Array := Generate;
   

   -- Skriv ut osorterade talpar
   Put("Osorterade tal: ");
   New_Line;
   Put(Random_Generate_Pair_Array);
   
   New_Line;
   
   -- Sortera talar med avseende på andra talet och sedan på det första tale
   Put("Sorterade tal: ");
   New_Line;

   Sort(Random_Generate_Pair_Array);
   
   

   
   -- Skriv ut sorterade talpar, ett talpar per rad
   
   Put(Random_Generate_Pair_Array);
   
   New_Line(2);
   
   ------------------------------------------------------

   
end Lab_3;
