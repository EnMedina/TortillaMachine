
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity CounterSec is
    Port ( RstIn : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           counVector : out  STD_LOGIC_VECTOR (25 downto 0));
end CounterSec;

architecture Behavioral of CounterSec is
signal temp:STD_LOGIC_VECTOR (25 downto 0);

begin
	process(Clk,RstIn)
	begin
	if(Clk'event and Clk='1')then
		if(RstIn='1')
			then
			temp<=(others=>'0');
		else 
		temp<=temp+1;
		end if;
	end if;
	end process;
counVector<=temp;
end Behavioral;

