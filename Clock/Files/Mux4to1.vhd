----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:18:24 10/06/2010 
-- Design Name: 
-- Module Name:    Mux4to1 - Behavioral 
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

entity Mux4to1 is
  port (
    DecHor : in  STD_LOGIC_VECTOR (3 downto 0);
	 UniHor : in  STD_LOGIC_VECTOR (3 downto 0);
	 DecMin : in  STD_LOGIC_VECTOR (3 downto 0);
	 UniMin : in  STD_LOGIC_VECTOR (3 downto 0);
	 Sel    : in  STD_LOGIC_VECTOR (1 downto 0);
	 Tiempo : out STD_LOGIC_VECTOR (3 downto 0));
end Mux4to1;

architecture Behavioral of Mux4to1 is

begin
    --Seleccion de unidad de tiempo  HH:MM
  with Sel select
    Tiempo <= UniMin when "00",
	           DecMin when "01",
				  UniHor when "10",
				  DecHor when others;

end Behavioral;

