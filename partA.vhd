----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:18:21 09/28/2015 
-- Design Name: 
-- Module Name:    partA - Behavioral 
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

entity partA is
    Port ( Clk : in STD_LOGIC;
			  swQuem : in  STD_LOGIC;
           swCru : in  STD_LOGIC;
			  errorA:out STD_LOGIC);
end partA;

architecture Behavioral of partA is
signal errorQuem: STD_LOGIC;
signal errorCru : STD_LOGIC ;	
begin
process(swQuem,Clk)
	begin
		if(swQuem'event and swQuem='1')then
			errorQuem<='1';
		else
			errorQuem<='0';
		end if;
end process;
process(swCru,Clk)
	begin
		if(swCru'event and swCru='1')then
			errorCru<='1';
		else
			errorCru<='0';
		end if;		
end process;
errorA<= errorCru OR errorQuem;
end Behavioral;
