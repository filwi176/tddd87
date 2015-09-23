with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;


procedure Lab_3 is
 
   
     
   type Generate_Type is 
     array(1..20) of Integer;
   
   Random : Generate_Type;
   

   
-------------------------------------------------
   function Generate return Generate_Type is
      
      subtype Twenty_Integer is Integer range 1..20;
      
      package Twenty_Integer_Random is
	 new Ada.Numerics.Discrete_Random(Result_Subtype => Twenty_Integer);
      
      G : Twenty_Integer_Random.Generator;
      
   begin
	Twenty_Integer_Random.Reset(G);
	
return Twenty_Integer_Random.Random(G);
	  
      
      
     
      
      end Generate;
   
   
   
-----------------------------------------------   
   
   
   
   procedure Put(A: in Generate_Type) is
     
   begin  
      
      for I in A'Range loop
	 
	 Put(A(I));
	 New_Line;
	 
	 
      end loop;
      
   end Put;
   
   
   
begin
   
   -- -- DEL A
   -- -- Generera 20 slumptal
   -- Generate(parameter, Random)
   
   -- -- Skriv ut osorterat KLAR
   Put(Random);
   
   
   Random := Generate;
   
   -- -- Sortera fältet Random
   -- Sort(parameter, Random)
   
   -- -- Skriv ut sorterat
   -- Put(parameter, Random)
   
   
   ------------------------------------------------------
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
end Lab_3;
