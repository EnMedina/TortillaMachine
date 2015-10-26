
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Compare is
    Port ( vectControl : in  STD_LOGIC_VECTOR (25 downto 0);
           vectChange : in  STD_LOGIC_VECTOR (25 downto 0);
			  Clk: in STD_LOGIC;
           Change : out  STD_LOGIC);
end Compare;
architecture Behavioral of Compare is

begin
	process(Clk)
		begin
		if(Clk'event and Clk='1')then
			if(vectControl=vectChange)then
				Change<='1';
			else
				Change<='0';
			end if;
		end if;	
	end process;
end Behavioral;

