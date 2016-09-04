----------------------------------------------------------------------------------
-- Company: 			ITESM
-- Engineer: 			Luis Manuel Herrería Valdespino
-- 
-- Create Date:    	17:49:39 10/03/2014 
-- Design Name: 
-- Module Name:    	SelAnodo - SelAnodo_Arch 
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

entity SelAnodo is
  port (
    Sel			: in  STD_LOGIC_VECTOR (1 downto 0);
	 Anodo	   : out STD_LOGIC_VECTOR (3 downto 0));
end SelAnodo;

architecture SelAnodo_Arch of SelAnodo is

begin

  Anodo <= "1110" when Sel = "00" else
			  "1101" when Sel = "01" else
			  "1011" when Sel = "10" else
           "0111";

end SelAnodo_Arch;

