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
			  errorQuem:out STD_LOGIC;
			  errorCru:out STD_LOGIC;
			  errorA:out STD_LOGIC);
end partA;

architecture Behavioral of partA is
signal tmperrorQuem: STD_LOGIC;
signal tmperrorCru : STD_LOGIC ;	
begin
process(swQuem,Clk)
	begin
		if(Clk'event and Clk='1')then
			if(swQuem='1')then
			tmperrorQuem<='1';
		else
			tmperrorQuem<='0';
			end if;
		end if;
end process;
process(swCru,Clk)
	begin
		if(Clk'event and Clk='1')then
			if(swCru='1')then
			tmperrorCru<='1';
		else
			tmperrorCru<='0';
			end if;
		end if;		
end process;
errorA<= tmperrorCru OR tmperrorQuem;
errorQuem<=tmperrorQuem;
errorCru<=tmperrorCru;
end Behavioral;
