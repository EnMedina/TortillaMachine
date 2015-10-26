
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity main is
 Port ( 		
				
				Clk,swGrill,swDispVacio,swDispLleno,btnAlarma : in  STD_LOGIC;
				ldQuema,ldCrud,ldFaltaMat,ldNoCort,ldAlarma,ldSeg,error : out  STD_LOGIC);
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
           swGrill : in  STD_LOGIC;
			  errorQuem:out STD_LOGIC;
			  errorCru:out STD_LOGIC;
			  errorA:out STD_LOGIC);
end component;
component partB is
    Port ( CLK : in  STD_LOGIC;
           swDispVacio : in  STD_LOGIC;
           errorB : out  STD_LOGIC);
end component;
component partC is
    Port ( CLK : in  STD_LOGIC;
           swDispLleno : in  STD_LOGIC;
           errorC : out  STD_LOGIC);
end component;
component CounterCond is
    Port ( Clk : in  STD_LOGIC;
			  Cond:in STD_LOGIC;
			  btnAlarma:in STD_LOGIC;
           ctrlVect : in  STD_LOGIC_VECTOR (7 downto 0);
           minPass :buffer  STD_LOGIC);
end component ;


signal salidaCounter : 	STD_LOGIC_VECTOR (25 downto 0); 
signal rstConteoSec: 	STD_LOGIC;
signal controlSec: 		STD_LOGIC;
signal rstConteoCic: 	STD_LOGIC;
signal ctrlAlarma:		STD_LOGIC;
signal errorA: 			STD_LOGIC;
signal errorB: 			STD_LOGIC;
signal errorC:				STD_LOGIC;
signal errorCru:			STD_LOGIC;
signal errorQuem	:		STD_LOGIC;
constant limiteSec: 		STD_LOGIC_VECTOR(25 downto 0) :="10111110101111000010000000";
constant custTimeLimit: STD_LOGIC_VECTOR(7  downto 0) :="00000101" ;--Put the custom time limit in secons, in binary here.
constant limitAlarm:		STD_LOGIC_VECTOR(7  downto 0) :="00001000";

begin
c1:CounterSec 	port map(rstConteoSec,Clk,salidaCounter);
c2:Compare 		port map (limiteSec,salidaCounter,Clk,rstConteoSec);
c3:CounterMin 	port map(rstConteoSec,custTimeLimit,rstConteoCic);
c4:partA 		port map(rstConteoSec,swGrill,errorQuem,errorCru,errorA);
c5:partB 		port map(rstConteoSec,swDispVacio,errorB);
c6:partC			port map(rstConteoCic,swDispLLeno,errorC);
c7:CounterCond 	port map(rstConteoSec,swDispLleno,btnAlarma,limitAlarm,ctrlAlarma);

process(rstConteoSec)
	begin
	if(rstConteoSec'event and rstConteoSec='1')then
		controlSec<=not controlSec;
	end if;
end process;
ldAlarma<=ctrlAlarma;
ldSeg<=controlSec;
error<= errorA OR errorB OR errorC;
ldFaltaMat<=errorB;
ldCrud<=errorCru;
ldQuema<=errorQuem;
ldNoCort<=errorC;		
end Behavioral;
