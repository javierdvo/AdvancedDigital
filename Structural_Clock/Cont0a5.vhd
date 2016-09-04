----------------------------------------------------------------------------------
-- Company: 			ITESM
-- Engineer: 			Luis Manuel Herrería Valdespino 
-- 
-- Create Date:    	16:58:05 10/03/2014 
-- Design Name: 
-- Module Name:    	Cont0a5 - Cont0a5 
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

entity Cont0a5 is
  port (
    Load 		: in  STD_LOGIC;
	 Enable		: in  STD_LOGIC;
	 Rst			: in  STD_LOGIC;
	 Clk			: in  STD_LOGIC;
	 Valor		: in  STD_LOGIC_VECTOR (3 downto 0);
	 TCO		   : out STD_LOGIC;
	 Cuenta	   : out STD_LOGIC_VECTOR (3 downto 0));
end Cont0a5;

architecture Cont0a5 of Cont0a5 is
  signal Count : STD_LOGIC_VECTOR(3 downto 0);
begin

  process(Rst,Clk,Enable,Load,Valor)
  begin
    if Rst = '1' then
	   Count <= (others => '0');
	 elsif rising_edge(Clk) and Enable = '1' then
	   if Count >= "0101" then
		  Count <= (others => '0');
		else
		  Count <= Count + 1;
		end if;
	 end if;
	 
	 if Load = '1' then
		Count <= Valor;
	 end if;
	 
  end process;
  
  -- Take care of output signals
  Cuenta <= Count;
  TCO    <= '1' 		when Count >= "0101" 	else
            '0';


end Cont0a5;

