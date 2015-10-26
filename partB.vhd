
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity partB is
    Port ( CLK : in  STD_LOGIC;
           swDispVacio : in  STD_LOGIC;
           errorB : out  STD_LOGIC);
end partB;

architecture Behavioral of partB is

begin
process(CLK,swDispVacio)
	begin
		if(CLK'event and CLK='1')then
			if(swDispVacio='1')then
			errorB<='1';
		else
			errorB<='0';
			end if;
		end if;
end process;
end Behavioral;

