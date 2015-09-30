----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:37:47 09/25/2015 
-- Design Name: 
-- Module Name:    CounterMin - Behavioral 
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

entity CounterMin is
    Port ( Clk : in  STD_LOGIC;
           ctrlVect : in  STD_LOGIC_VECTOR (7 downto 0);
           minPass :buffer  STD_LOGIC);
end CounterMin;

architecture Behavioral of CounterMin is
signal temp: STD_LOGIC_VECTOR(7 downto 0);
begin
process(Clk)
	begin
	if(Clk'event and Clk='1')then
		if(ctrlVect=temp)then
			minPass<='1';
			temp<=(others=>'0');
		else 
			minPass<='0';
			temp<=temp+1;
		end if;
	end if;
	end process;
end Behavioral;

