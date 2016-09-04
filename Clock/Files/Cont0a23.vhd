----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:07:57 10/06/2010 
-- Design Name: 
-- Module Name:    Cont0a23 - Behavioral 
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

entity Cont0a23 is
  port (
    Load      : in  STD_LOGIC;
    Enable    : in  STD_LOGIC;
	 Rst       : in  STD_LOGIC;
	 Clk       : in  STD_LOGIC;
	 ValorDec  : in  STD_LOGIC_VECTOR (3 downto 0);
	 ValorUni  : in  STD_LOGIC_VECTOR (3 downto 0);
	 Cuenta    : out STD_LOGIC_VECTOR (7 downto 0));
end Cont0a23;

architecture Behavioral of Cont0a23 is
  signal ContUni :  STD_LOGIC_VECTOR (3 downto 0);
  signal ContDec :  STD_LOGIC_VECTOR (3 downto 0);
begin
  --Contador de Unidades de Hora
  process (Rst,Clk)
  begin
    if (Rst = '1') then
	   ContUni <= (others => '0');
	 elsif (rising_edge(Clk)) then
	   if (Load = '1') then
		  ContUni <= ValorUni;
		elsif (Enable = '1') then
		  --El Contador de Unidades de Hora se reinicia a Cero cuando el 
		  --Contador de Unidades de Hora vale 9 o cuando las hora vale 23
		  if ((ContUni = "1001") or (ContDec = "0010" and ContUni = "0011")) then
		    ContUni <= (others => '0');
		  else
		    ContUni <= ContUni + 1;
		  end if;
		end if;
    end if;
  end process;
  
  --Contador de Decenas de Hora
  process (Rst,Clk)
  begin
    if (Rst = '1') then
	   ContDec <= (others => '0');
	 elsif (rising_edge(Clk)) then
	   if (Load = '1') then
		  ContDec <= ValorDec;
		elsif (Enable = '1') then
		  --Las decenas de hora se reinician a Cero cuando la hora es 23 (formato militar)
		  if (ContDec = "0010" and ContUni = "0011") then
		    ContDec <= (others => '0');
		  --Solo incrementear la decenas de hora cuando las unidades de hora sean 9
		  elsif (ContUni = "1001") then
		    ContDec <= ContDec + 1;
		  end if;
		end if;
    end if;
  end process;
  
  --Agrupar en un solo bus
  Cuenta <= ContDec & ContUni;
end Behavioral;

