----------------------------------------------------------------------------------
-- Company: 			ITESM
-- Engineer: 			Luis Manuel Herrería Valdespino
-- 
-- Create Date:    	22:54:26 10/02/2014 
-- Design Name: 		Structural Clock
-- Module Name:    	Clock - Clock_Arch 
-- Project Name: 		Structural Clock
-- Target Devices: 	Digilent Nexys3 Board
-- Tool versions:  	ISE Webpack
-- Description: 		Full Clock with Structural design 
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

entity Clock is
    Port ( HorEn 			: in  STD_LOGIC;
           DecEnt 		: in  STD_LOGIC_VECTOR (3 downto 0);
           MinEn 			: in  STD_LOGIC;
           UniEnt 		: in  STD_LOGIC_VECTOR (3 downto 0);
           Rst 			: in  STD_LOGIC;
           Clk100MHz 	: in  STD_LOGIC;
           Seg 			: out  STD_LOGIC_VECTOR (7 downto 0);
           Disp 			: out  STD_LOGIC_VECTOR (3 downto 0);
           SegOut 		: out  STD_LOGIC_VECTOR (7 downto 0));
end Clock;

architecture Clock_Arch of Clock is
-- Declaration of all component used in the structural design

  component Clk1Hz
  port (
	 Rst        : in  STD_LOGIC;
    Clk100MHz 	: in  STD_LOGIC;
	 ClkOut    	: out STD_LOGIC);
  end component;
  
  component Cont0a9
  port (
    Load 		: in  STD_LOGIC;
	 Enable		: in  STD_LOGIC;
	 Rst			: in  STD_LOGIC;
	 Clk			: in  STD_LOGIC;
	 Valor		: in  STD_LOGIC_VECTOR (3 downto 0);
	 TCO		   : out STD_LOGIC;
	 Cuenta	   : out STD_LOGIC_VECTOR (3 downto 0));
  end component;
  
  component Cont0a5
  port (
    Load 		: in  STD_LOGIC;
	 Enable		: in  STD_LOGIC;
	 Rst			: in  STD_LOGIC;
	 Clk			: in  STD_LOGIC;
	 Valor		: in  STD_LOGIC_VECTOR (3 downto 0);
	 TCO		   : out STD_LOGIC;
	 Cuenta	   : out STD_LOGIC_VECTOR (3 downto 0));
  end component;
  
  component Cont0a23
  port (
    Load 		: in  STD_LOGIC;
	 Enable		: in  STD_LOGIC;
	 Rst			: in  STD_LOGIC;
	 Clk			: in  STD_LOGIC;
	 ValorDec	: in  STD_LOGIC_VECTOR (3 downto 0);
	 ValorUni	: in  STD_LOGIC_VECTOR (3 downto 0);
	 Cuenta	   : out STD_LOGIC_VECTOR (7 downto 0));
  end component;
  
  component RefreshDisplay
  port (
	 Rst        : in  STD_LOGIC;
	 Clk        : in  STD_LOGIC;
	 ClkOut	   : out STD_LOGIC);
  end component;
  
  
  component Cont0a3
  port (
    Enable		: in  STD_LOGIC;
	 Rst        : in  STD_LOGIC;
	 Clk        : in  STD_LOGIC;
	 Cuenta	   : out STD_LOGIC_VECTOR (1 downto 0));
  end component;
  
  
  component Mux4to1
  port (
    DecHor		: in  STD_LOGIC_VECTOR (3 downto 0);
	 UnitHor    : in  STD_LOGIC_VECTOR (3 downto 0);
    DecMin		: in  STD_LOGIC_VECTOR (3 downto 0);
	 UnitMin    : in  STD_LOGIC_VECTOR (3 downto 0);
	 Sel        : in  STD_LOGIC_VECTOR (1 downto 0);
	 Tiempo	   : out STD_LOGIC_VECTOR (3 downto 0));
  end component;
  
  
  component SelAnodo
  port (
    Sel			: in  STD_LOGIC_VECTOR (1 downto 0);
	 Anodo	   : out STD_LOGIC_VECTOR (3 downto 0));
  end component;
  
  
  component DecBCD7Seg
  port (
    BCD			: in  STD_LOGIC_VECTOR (3 downto 0);
	 Seg		   : out STD_LOGIC_VECTOR (7 downto 0));
  end component;
  
  -- Section where embedded signals are declared (diagram green or blue signals)
  signal ClkRefresh_int : STD_LOGIC;
  signal Clk1Hz_int 		: STD_LOGIC;
  signal TCODecMin_int	: STD_LOGIC;
  signal TCOUniMin_int	: STD_LOGIC;
  signal TCODecSeg_int	: STD_LOGIC;
  signal TCOUniSeg_int	: STD_LOGIC;
  signal EnDecSeg_int 	: STD_LOGIC;
  signal EnSeg_int 		: STD_LOGIC;
  signal EnUniMin_int 	: STD_LOGIC; 
  signal EnDecMin_int 	: STD_LOGIC; 
  signal EnHoras_int 	: STD_LOGIC;
  signal Hor_int 			: STD_LOGIC_VECTOR (7 downto 0);
  signal DecMin_int 		: STD_LOGIC_VECTOR (3 downto 0);
  signal UniMin_int 		: STD_LOGIC_VECTOR (3 downto 0);
  signal Tiempo_int 		: STD_LOGIC_VECTOR (3 downto 0);
  signal Sel_int 			: STD_LOGIC_VECTOR (1 downto 0);
  signal SegOut_int 		: STD_LOGIC_VECTOR (7 downto 0);
  signal Tierra	 		: STD_LOGIC_VECTOR (3 downto 0) := "0000";
begin

	EnDecSeg_int 	<= TCOUniSeg_int and Clk1Hz_int;
	EnSeg_int 		<= HorEn or MinEn;
	EnUniMin_int 	<= TCOUniSeg_int and TCODecSeg_int and Clk1Hz_int;
	EnDecMin_int 	<= EnUniMin_int and TCOUniMin_int and Clk1Hz_int;
	EnHoras_int 	<= EnDecMin_int and TCODecMin_int and Clk1Hz_int;

  U1 : Clk1Hz   
    port map (Rst,Clk100MHz,Clk1Hz_int);
  
  U2 : Cont0a9
    port map (EnSeg_int,Clk1Hz_int,Rst,Clk100MHz,Tierra,TCOUniSeg_int,SegOut (3 downto 0));
	 
  U3 : Cont0a5
    port map (EnSeg_int,EnDecSeg_int,Rst,Clk100MHz,Tierra,TCODecSeg_int,SegOut (7 downto 4));
	 
  U4 : Cont0a9
    port map (MinEn,EnUniMin_int,Rst,Clk100MHz,UniEnt,TCOUniMin_int,UniMin_int);
	 
  U5 : Cont0a5
    port map (MinEn,EnDecMin_int,Rst,Clk100MHz,DecEnt,TCODecMin_int,DecMin_Int);
	 
  U6 : Cont0a23
    port map (HorEn,EnHoras_int,Rst,Clk100MHz,DecEnt,UniEnt,Hor_int);
	 
  U7 : RefreshDisplay
    port map (Rst,Clk100MHz,ClkRefresh_int);
	 
  U8 : Cont0a3
    port map (ClkRefresh_int,Rst,Clk100MHz,Sel_int);
	 
  U9 : Mux4to1
    port map (Hor_int (7 downto 4),Hor_int (3 downto 0),DecMin_int,UniMin_int,Sel_int,Tiempo_int);
	 
  U10 : SelAnodo
    port map (Sel_int,Disp);	 

  U11 : DecBCD7Seg
    port map (Tiempo_int,Seg);	 

end Clock_Arch;

