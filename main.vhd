----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:12:11 09/28/2015 
-- Design Name: 
-- Module Name:    main - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
 Port ( 		
				
				Clk,swQuema,swCrud,swDispVacio,swDispLleno,swReset : in  STD_LOGIC;
				ldQuema,ldCrud,ldFaltaMat,ldNoCort,ldNoBanda,ldAlarma,ldSeg : out  STD_LOGIC);
end main;

architecture Behavioral of main is
component CounterSec is
    Port ( RstIn : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           counVector : out  STD_LOGIC_VECTOR (25 downto 0));
end component;

component Compare is
    Port ( vectControl : in  STD_LOGIC_VECTOR (25 downto 0);
           vectChange : in  STD_LOGIC_VECTOR (25 downto 0);
			  Clk: in STD_LOGIC;
           Change : out  STD_LOGIC);
end component;
component CounterMin is
    Port ( Clk : in  STD_LOGIC;
           ctrlVect : in  STD_LOGIC_VECTOR (7 downto 0);
           minPass :out  STD_LOGIC);
end component;

component partA is
    Port ( Clk : in STD_LOGIC;
			  swQuem : in  STD_LOGIC;
           swCru : in  STD_LOGIC;
			  errorA:out STD_LOGIC);
end component;
component partB is
    Port ( CLK : in  STD_LOGIC;
           swDisp : in  STD_LOGIC;
           errorB : out  STD_LOGIC);
end component;
component partC is
    Port ( CLK : in  STD_LOGIC;
           swDispVacio : in  STD_LOGIC;
           errorB : out  STD_LOGIC);
end component;


signal salidaCompare: 	STD_LOGIC;
signal salidaCounter : 	STD_LOGIC_VECTOR (25 downto 0); 
signal rstConteoSec: 	STD_LOGIC;
signal controlSec: 		STD_LOGIC;
signal rstConteoCic: 	STD_LOGIC;
signal controlCic: 		STD_LOGIC;
signal alarmOn: 			STD_LOGIC;
signal errorA: 			STD_LOGIC;
signal errorB: 			STD_LOGIC;
signal errorC:				STD_LOGIC;
constant limiteSec: 		STD_LOGIC_VECTOR(25 downto 0) :="10111110101111000010000000";
constant custTimeLimit: STD_LOGIC_VECTOR(7  downto 0) :="00000101" ;--Put the custom time limit in secons, in binary here.
constant limitAlarm:		STD_LOGIC_VECTOR(7  downto 0) :="01111000";
begin
c1:CounterSec 	port map(rstConteoSec,Clk,salidaCounter);
c2:Compare 		port map (limiteSec,salidaCounter,Clk,rstConteoSec);
c3:CounterMin 	port map(rstConteoSec,custTimeLimit,rstConteoCic);
c4:partA 		port map(rstConteoCic,swQuema,swCrud,errorA);
c5:partB 		port map(rstConteoCic,swDispVacio,errorB);
c6:partC			port map(rstConteoCic,swDispLLeno,errorC);

process(rstConteoSec,alarmOn)
	begin
	if(rstConteoSec'event and rstConteoSec='1' )then
		if(alarmOn='1') then
			controlSec<=not controlSec;
		else
			controlSec<='0';
		end if;	
	end if;
end process;
process(rstConteoCic)
	begin
	if(rstConteoCic'event and rstConteoCic='1')then
		controlCic<=not controlCic;
	end if;
end process;
ldAlarma<=controlSec;
ldSeg<=controlCic;		
end Behavioral;
