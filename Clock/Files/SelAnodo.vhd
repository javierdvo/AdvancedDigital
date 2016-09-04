----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:34:41 10/06/2010 
-- Design Name: 
-- Module Name:    SelAnodo - Behavioral 
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

entity SelAnodo is
  port (
	 Sel   : in  STD_LOGIC_VECTOR (1 downto 0);
	 Anodo : out STD_LOGIC_VECTOR (3 downto 0));
end SelAnodo;

architecture Behavioral of SelAnodo is

begin
  --Seleccion de display
  with Sel select
    Anodo <= "1110" when "00",
	          "1101" when "01",
	  	 		 "1011" when "10",
				 "0111" when others;

end Behavioral;

