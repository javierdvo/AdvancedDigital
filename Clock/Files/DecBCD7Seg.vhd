----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:37:01 10/06/2010 
-- Design Name: 
-- Module Name:    DecBCD7Seg - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DecBCD7Seg is
  port (
	 BCD   : in  STD_LOGIC_VECTOR (3 downto 0);
	 Seg   : out STD_LOGIC_VECTOR (7 downto 0));
end DecBCD7Seg;

architecture Behavioral of DecBCD7Seg is

begin

  --Implementacion de un decodificador Binario a 7 segmentos que tambien sirve como
  --Decodificador BCD a 7 segmentos
  --Los segmentos encienden con un 0 logico, se apagan con un 1 logico
  with BCD select
        --  .gfedcba
    Seg <= X"C0" when X"0",
			  X"F9" when X"1",
			  X"A4" when X"2",
			  X"B0" when X"3",
			  X"99" when X"4",
			  X"92" when X"5",
			  X"82" when X"6",
			  X"F8" when X"7",
			  X"80" when X"8",
			  X"90" when X"9",
			  X"88" when X"A",
			  X"83" when X"B",
			  X"C6" when X"C",
			  X"A1" when X"D",
			  X"86" when X"E",
			  X"8E" when X"F",
			  X"FF" when others;

end Behavioral;

