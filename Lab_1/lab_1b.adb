with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_Io;
with Ada.Float_Text_Io; use Ada.Float_Text_IO;

procedure Lab_1 is
   
   procedure Swap (A,B: in out Float) is
      C : Float;
   begin
      C :=A;
      A :=B;
      B :=C;
   end Swap;
      
   
   Pris1 : Float;
   Pris2 : Float;
   Steg : Float;
   MomsIn : Float;
   Moms : Float;
   Antal : Integer;
   
begin
   
   -- Användarens inmatning
   Put ("Första pris: ");
   loop
      Get (Pris1);
      Skip_Line;
      if Pris1<0.0 then
	 Put ("En får inte pengar för att köpa saker! Nytt första pris: ");
      elsif Pris1=0.0 then
	 Put ("Inget är gratis här i livet. Nytt första pris: ");
      else exit;
      end if;
   end loop;
   
   Put ("Sista pris: ");
   loop 
      Get (Pris2);
      Skip_Line;
      if Pris2<0.0 then
	 Put ("En får inte pengar för att köpa saker! Nytt sista pris: ");
      elsif Pris2=0.0 then
	 Put ("Inget är gratis här i livet. Nytt sista pris: ");
      else exit;
      end if;
   end loop;

   Put ("Steg: ");
   loop
      Get (Steg);
      Skip_Line;
      if Steg=0.0 then
	 Put ("Noll är ett osympatiskt tal. Nytt steg: ");
      elsif Steg<0.0 then
	 Put ("Gå baklänges? Kommer inte på fråga. Nytt steg: ");
      else exit;
      end if;
   end loop;
   
   Put ("Momsprocent: ");
   loop
      Get (MomsIn);
      Skip_Line;
      if MomsIn<0.0 then
	 Put ("Error. Otillbörliga dadlar. Melon. Melon. Melon. Ny momsprocent tack: ");
      elsif MomsIn>100.0 then
	 Put ("Dyrt, dyrt, dyrt, vill inte! Ny momsprocent: ");
      else exit;
      end if;
   end loop;
   
   
   
   -- Om Pris1 > Pris2
   if Pris1>Pris2 then
      Put ("Felmeddelande: Första pris större än sista pris. Byter ordning.");
      Swap (Pris1,Pris2);
      New_Line;
   end if;

   New_Line;
   
   -- Tabellhuvud
   Put ("=== Momstabell ===");
   New_Line;
   Put ("Pris utan moms  ");
   Put ("Moms   ");
   Put ("  Pris med moms");
   New_Line;
   
   Antal := Integer(Float'Floor((Pris2-Pris1)/Steg));
   
   -- Momstabellen
   for I in 0..Antal loop
      Moms := MomsIn*0.01 * Pris1;
      Put (Pris1, Fore=>6, Aft=>2, Exp=>0);
      Put (Moms, Fore=>8, Aft=>2, Exp=>0);
      Put (Pris1 + Moms, Fore=>11, Aft=>2, Exp=>0);
      Pris1 := Pris1 + Steg;
      New_Line;
   end loop ;
   
end Lab_1;
