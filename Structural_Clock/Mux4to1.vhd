----------------------------------------------------------------------------------
-- Company: 			ITESM
-- Engineer: 			Luis Manuel Herrería Valdespino
-- 
-- Create Date:    	17:21:57 10/03/2014 
-- Design Name: 
-- Module Name:    	Mux4to1 - Mux4to1_Arch 
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

entity Mux4to1 is
  port (
    DecHor		: in  STD_LOGIC_VECTOR (3 downto 0);
	 UnitHor    : in  STD_LOGIC_VECTOR (3 downto 0);
    DecMin		: in  STD_LOGIC_VECTOR (3 downto 0);
	 UnitMin    : in  STD_LOGIC_VECTOR (3 downto 0);
	 Sel        : in  STD_LOGIC_VECTOR (1 downto 0);
	 Tiempo	   : out STD_LOGIC_VECTOR (3 downto 0));
end Mux4to1;

architecture Mux4to1_Arch of Mux4to1 is

begin
   with Sel select
      Tiempo <= DecHor 		when "00",
                UnitHor 	when "01",
                DecMin 		when "10",
                UnitMin 	when others;

end Mux4to1_Arch;

