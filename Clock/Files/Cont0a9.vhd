----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:52:23 10/06/2010 
-- Design Name: 
-- Module Name:    Cont0a9 - Behavioral 
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

entity Cont0a9 is
  port (
    Load   : in  STD_LOGIC;
    Enable : in  STD_LOGIC;
	 Rst    : in  STD_LOGIC;
	 Clk    : in  STD_LOGIC;
	 Valor  : in  STD_LOGIC_VECTOR (3 downto 0);
	 TCO    : out STD_LOGIC;
	 Cuenta : out STD_LOGIC_VECTOR (3 downto 0));
end Cont0a9;

architecture Behavioral of Cont0a9 is
  signal Cont : integer range 0 to 9;
begin
  process (Rst,Clk,Cont)
  begin
    if (Rst = '1') then
	   Cont <= 0;
	 elsif (rising_edge(Clk)) then
	   if (Load = '1') then
		  --Covertir de STD_LOGIC_VECTOR a Integer
		  Cont <= conv_integer(Valor);
		elsif (Enable = '1') then
		  if Cont = 9 then
		    Cont <= 0;
		  else
		    Cont <= Cont + 1;
		  end if;
		end if;
    end if;
	--Convertir de Integer a STD_LOGIC_VECTOR, dejar Cuenta en 4-bits
	Cuenta <= conv_std_logic_vector(Cont,4);	  
  end process;
  
  --Terminal Count Out
  TCO <= '1' when Cont = 9 else
         '0';

end Behavioral;

