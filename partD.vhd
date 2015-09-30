----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:11:59 09/28/2015 
-- Design Name: 
-- Module Name:    partD - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity partD is
    Port ( CLK : in  STD_LOGIC;
			  swLLeno:in STD_LOGIC;	
			  ctrlVect:in STD_LOGIC_VECTOR(7 downto 0);
           alarmaOn : out  STD_LOGIC);
end partD;

architecture Behavioral of partD is
signal temp: STD_LOGIC_VECTOR(7 downto 0);
begin
process(Clk,swLLeno)
	begin
	if(swLleno='1')then
	if(Clk'event and Clk='1')then
		if(ctrlVect=temp)then
			alarmaOn<='1';
			temp<=(others=>'0');
		else 
			alarmaOn<='0';
			temp<=temp+1;
		end if;
	end if;
	else
		temp<=(others=>'0');
		alarmaOn<='0';
	end if;	
	end process;

end Behavioral;

