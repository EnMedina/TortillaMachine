
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity partC is
    Port ( CLK : in  STD_LOGIC;
           swDispLleno : in  STD_LOGIC;
           errorC : out  STD_LOGIC);
end partC;

architecture Behavioral of partC is

begin
process(CLK,swDispLLeno)
	begin
		if(CLK'event and CLK='1')then
			if(swDispLleno='1')then
				errorC<='1';
			else
				errorC<='0';
			end if;
		end if;
end process;			

end Behavioral;

