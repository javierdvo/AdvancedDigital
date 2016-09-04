----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:13:00 11/15/2013 
-- Design Name: 
-- Module Name:    Ultrasonico - Behavioral 
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Ultrasonico is
    Port ( Sensor : inout  STD_LOGIC;
			  Clk1: in STD_LOGIC;
			  Sound: out STD_LOGIC;
			  Rst: in STD_LOGIC;
           Led : out  STD_LOGIC_VECTOR (7 downto 0));
end Ultrasonico;

architecture Behavioral of Ultrasonico is

Signal Tiempo: natural range 0 to 18000:=0;-- AGREGAR CLOCK A MENOS DE 18000 MS
signal CuentaEn: STD_LOGIC;
signal count2 : integer range 0 to 30000 :=1;
signal Distancia: natural range 0 to 300;

constant BoardFreq: natural:=16666;
constant MaxCount: natural:=BoardFreq;
signal FreqCounter: natural range 0 to MaxCount;
signal Clk: STD_LOGIC;
  CONSTANT timeMAX  : NATURAL := 1800000; -- Largest count
signal time       : natural range 0 TO timeMAX;

  TYPE state IS (MP,Ts1,RP,Ts2);
  SIGNAL pr_state, nx_state: state;

begin


FreqDiv: process(Clk1,rst)
begin
if Rst= '1' then
	FreqCounter<=0;
	Clk<='0';
elsif rising_edge(Clk1) then
if(FreqCounter=(MaxCount-1)) then
	FreqCounter<=0;
	Clk<='1';
else
	FreqCounter<=FreqCounter+1;
	Clk<='0';
end if;
end if;
end process FreqDiv;


  
  PROCESS (Clk1, Clk)
  VARIABLE count : NATURAL RANGE 0 TO timeMAX;
  BEGIN
	 if (rising_edge(Clk1)) THEN
      count := count + 1;
		if (count = time) THEN
        pr_state <= nx_state;
        count := 0;
		end if;
		if (pr_state=Ts1 ) THEN
			tiempo<=0;
			Sensor<='0';
		elsif (pr_state=RP ) THEN
			if(Sensor='1') then
				if rising_edge(clk) then
				tiempo<=tiempo+1;
				end if;
			else
				pr_state <= nx_state;
				count := 0;
			end if;
		elsif (pr_state=MP) THEN
				Sensor<='1';
		elsif( pr_state=Ts2)THEN
			if(Tiempo<50) then
				Sound<='1';
			else
				Sound<='0';
			end if;
		end if;
    END IF;
  END PROCESS;  
  
  PROCESS (pr_state)
  BEGIN
    CASE pr_state IS
	 
      WHEN MP =>
        nx_state <= Ts1;
		    time <= 500;
		  
      WHEN Ts1 =>    
        nx_state <= RP;

		    time <= 15200;
				
      WHEN Rp =>
        nx_state <= Ts2;
		    time <=timeMax;
			 
		  
      WHEN Ts2 =>
        nx_state <= Mp;
		    time <= 20000;
			 
		  
		  WHEN others =>null;
			 
    END CASE;
  END PROCESS;
   
 
  
--Cuenta: process(Sensor,Clk,CuentaEn,Tiempo)
--begin
--
--if rising_edge(clk) then
--	if(CuentaEn='1') then
--		Tiempo<=Tiempo+1;
--	end if;
--end if;
--
--if rising_edge(Sensor) then
--	CuentaEn<='1';
--	Tiempo<=0;
--elsif falling_edge(Sensor) then
--	CuentaEn<='0';
--	Tiempo<=Tiempo;
--else
--	CuentaEn<=CuentaEn;
--	Tiempo<=Tiempo;
--end if;
--
--end process Cuenta;

--Visual

      Led <= 	 "00000000" when Tiempo<0 else
                "00000001" when Tiempo<33 else
					 "00000011" when Tiempo<66 else
					 "00000111" when Tiempo<99 else
					 "00001111" when Tiempo<132 else
					 "00011111" when Tiempo<165 else
					 "00111111" when Tiempo<198 else
					 "01111111" when Tiempo<231 else
					 "01111111" when Tiempo<264 else
					 "11111111";
			
end Behavioral;



