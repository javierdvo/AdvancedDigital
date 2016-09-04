----------------------------------------------------------------------------------
-- Company: 			ITESM
-- Engineer: 			Luis Manuel Herrería Valdespino
-- 
-- Create Date:    	18:20:13 10/03/2014 
-- Design Name: 
-- Module Name:    	Cont0a23 - Cont0a23_Arch 
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

entity Cont0a23 is
  port (
    Load 		: in  STD_LOGIC;
	 Enable		: in  STD_LOGIC;
	 Rst			: in  STD_LOGIC;
	 Clk			: in  STD_LOGIC;
	 ValorDec	: in  STD_LOGIC_VECTOR (3 downto 0);
	 ValorUni	: in  STD_LOGIC_VECTOR (3 downto 0);
	 Cuenta	   : out STD_LOGIC_VECTOR (7 downto 0));
end Cont0a23;

architecture Cont0a23_Arch of Cont0a23 is
  signal CountUni : STD_LOGIC_VECTOR(3 downto 0);
  signal CountDec : STD_LOGIC_VECTOR(3 downto 0);
begin

  process(Rst,Clk,Enable,ValorDec,ValorUni,CountUni,CountDec,Load)
  begin
    if Rst = '1' then
	   CountUni <= (others => '0');
		CountDec <= (others => '0');		
	 elsif rising_edge(Clk) and Enable = '1' then
	   if CountUni = "1001" then
		  CountUni <= (others => '0');
		  CountDec <= CountDec + 1;
		else
		  CountUni <= CountUni + 1;
		end if;
	 end if;
	 if Load = '1' then
		CountUni <= ValorUni;
		CountDec <= ValorDec;
	 end if;
	 
	 if CountDec > "0010" then
		  CountDec <= (others => '0');		
	 end if;
	 
	 if CountUni >= "0100" and CountDec >= "0010" then
		  CountUni <= (others => '0');
		  CountDec <= (others => '0');		
	 end if;
	 
  end process;
  
  -- Take care of output signals
  Cuenta (3 downto 0) <= CountUni;
  Cuenta (7 downto 4) <= CountDec;

end Cont0a23_Arch;

