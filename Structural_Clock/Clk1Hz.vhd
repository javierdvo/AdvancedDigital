----------------------------------------------------------------------------------
-- Company: 			ITESM
-- Engineer: 			Luis Manuel Herrería Valdespino
-- 
-- Create Date:    	16:34:38 10/03/2014 
-- Design Name: 
-- Module Name:    	Clk1Hz - Clk1Hz_Arch 
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

entity Clk1Hz is
  port (
	 Rst        : in  STD_LOGIC;
    Clk100MHz 	: in  STD_LOGIC;
	 ClkOut    	: out STD_LOGIC);
end Clk1Hz;

architecture Clk1Hz_Arch of Clk1Hz is
	constant BoardFrequency : natural := 100_000_000;
	signal 	Count 			: natural range 0 to BoardFrequency -1;
begin
	--Derive one Hz signal from the board sequency
	process(Rst,Clk100MHz)
	begin
		if Rst = '1' then 
			Count 	<= 0;
			ClkOut 	<= '0';
		elsif rising_edge(Clk100MHz) then
			if Count = BoardFrequency - 1 then
				Count <= 0;
				ClkOut <= '1';
			else
				Count <= Count + 1;
				ClkOut <= '0';
			end if;
		end if;
	end process;

end Clk1Hz_Arch;

