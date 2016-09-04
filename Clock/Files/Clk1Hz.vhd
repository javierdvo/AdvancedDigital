----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:27:52 10/06/2010 
-- Design Name: 
-- Module Name:    Clk1Hz - Behavioral 
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

entity Clk1Hz is
  port (
    Rst    : in  STD_LOGIC;
    Clk    : in  STD_LOGIC;
	 ClkOut : out STD_LOGIC);
end Clk1Hz;

architecture Behavioral of Clk1Hz is
  --Declaraciones de constantes
  constant Fosc    : integer := 50000000;    --Frecuencia del oscilador de tabletas NEXYS 2 y BASYS2
  constant Fdiv    : integer := 1;           --Frecuencia deseada del divisor
  constant CtaMax  : integer := Fosc / Fdiv; --Cuenta maxima a la que hay que llegar
  --Declaracion de signals
  signal Cont      : integer range 0 to CtaMax;
begin
  --Proceso que Divide la Frecuencia de entrada para obtener una Frecuencia de 1 Hz
  process (Rst, Clk)
  begin
    if Rst = '1' then
	   Cont <= 0;
	 elsif (rising_edge(Clk)) then
	   if Cont = CtaMax then
        Cont <= 0;
        ClkOut <= '1';
      else		  
	     Cont <= Cont + 1;
		  ClkOut<= '0';
		end if;
	end if;
  end process;

end Behavioral;

