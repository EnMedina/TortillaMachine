
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


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

