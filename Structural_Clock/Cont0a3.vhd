----------------------------------------------------------------------------------
-- Company: 			ITESM
-- Engineer: 			Luis Manuel Herrería Valdespino 
-- 
-- Create Date:    	17:30:54 10/03/2014 
-- Design Name: 
-- Module Name:    	Cont0a3 - Cont0a3_Arch 
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

entity Cont0a3 is
  port (
    Enable		: in  STD_LOGIC;
	 Rst        : in  STD_LOGIC;
	 Clk        : in  STD_LOGIC;
	 Cuenta	   : out STD_LOGIC_VECTOR (1 downto 0));
end Cont0a3;

architecture Cont0a3_Arch of Cont0a3 is
  signal Count : STD_LOGIC_VECTOR(1 downto 0);
begin

  process(Rst,Clk,Enable)
  begin
    if Rst = '1' then
	   Count <= (others => '0');
	 elsif rising_edge(Clk) and Enable = '1' then
	   if Count = "11" then
		  Count <= (others => '0');
		else
		  Count <= Count + 1;
		end if;
	 end if;
  end process;
  
  -- Take care of output signals
  Cuenta <= Count;

end Cont0a3_Arch;

