----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:12:06 10/06/2010 
-- Design Name: 
-- Module Name:    Cont0a3 - Behavioral 
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

entity Cont0a3 is
  port (
    Enable : in  STD_LOGIC;
	 Rst    : in  STD_LOGIC;
    Clk    : in  STD_LOGIC;
	 Cuenta : out STD_LOGIC_VECTOR (1 downto 0));
end Cont0a3;

architecture Behavioral of Cont0a3 is
  signal Cont : STD_LOGIC_VECTOR (1 downto 0);
begin
  --Contador de 0 a 3 para seleccionar Display y sigito de Tiempo
  process (Rst, Clk, Enable,Cont)
  begin
    if Rst = '1' then
	   Cont <= (others => '0');
	 elsif (rising_edge(Clk) and Enable = '1') then
	   Cont <= Cont + 1;
	 end if;
	 Cuenta <= Cont;
  end process;

end Behavioral;

