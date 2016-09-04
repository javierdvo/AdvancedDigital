----------------------------------------------------------------------------------
-- Company: 			ITESM
-- Engineer: 			Luis Manuel Herrería Valdespino
-- 
-- Create Date:    	18:08:06 10/03/2014 
-- Design Name: 
-- Module Name:    	RefreshDisplay - RefreshDisplay_Arch 
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

entity RefreshDisplay is
  port (
	 Rst        : in  STD_LOGIC;
	 Clk        : in  STD_LOGIC;
	 ClkOut	   : out STD_LOGIC);
end RefreshDisplay;

architecture RefreshDisplay_Arch of RefreshDisplay is
	constant Frequency : natural := 1000;
	signal Count : natural range 0 to Frequency -1;
begin

	--Derive one Hz signal from the board sequency
	process(Rst,Clk)
	begin
		if Rst = '1' then 
			Count <= 0;
			ClkOut <= '0';
		elsif rising_edge(Clk) then
			if Count = Frequency - 1 then
				Count <= 0;
				ClkOut <= '1';
			else
				Count <= Count + 1;
				ClkOut <= '0';
			end if;
		end if;
	end process;

end RefreshDisplay_Arch;

