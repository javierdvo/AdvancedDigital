----------------------------------------------------------------------------------
-- Company: 			ITESM
-- Engineer: 			Luis Manuel Herrería Valdespino
-- 
-- Create Date:    	17:59:54 10/03/2014 
-- Design Name: 
-- Module Name:    	DecBCD7Seg - DecBCD7Seg_Arch 
-- Project Name: 		Structural Clock
-- Target Devices: 	Digilent Nexys3 Board
-- Tool versions:  	ISE Webpack
-- Description: 
--
-- Dependencies: 
--
-- Revision: 			V 1.0
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity DecBCD7Seg is
  port (
    BCD			: in  STD_LOGIC_VECTOR (3 downto 0);
	 Seg		   : out STD_LOGIC_VECTOR (7 downto 0));
end DecBCD7Seg;

architecture DecBCD7Seg_Arch of DecBCD7Seg is

begin
   with 	BCD select
		-- Segments .ABCDEFG
		Seg <=  "10000001" when "0000", -- 0
				  "11001111" when "0001", -- 1
				  "10010010" when "0010", -- 2
				  "10000110" when "0011", -- 3
				  "11001100" when "0100", -- 4
				  "10100100" when "0101", -- 5
				  "10100000" when "0110", -- 6
				  "10001111" when "0111", -- 7
				  "10000000" when "1000", -- 8
				  "10001100" when "1001", -- 9
				  "10001000" when "1010", -- A
				  "11100000" when "1011", -- B
				  "10110010" when "1100", -- C
				  "10110001" when "1101", -- D
				  "11000011" when "1110", -- F
				  "10111000" when others;

end DecBCD7Seg_Arch;

