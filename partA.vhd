
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity partA is
    Port ( Clk : in STD_LOGIC;
			  swGrill : in  STD_LOGIC;
			  errorQuem:out STD_LOGIC;
			  errorCru:out STD_LOGIC;
			  errorA:out STD_LOGIC);
end partA;

architecture Behavioral of partA is
signal temp: STD_LOGIC_VECTOR(7 downto 0):="00001010";
signal eCr: STD_LOGIC;
signal eQu: STD_LOGIC;
begin
process(Clk,swGrill)
	begin
	if(Clk'event and Clk='1')then
		if(swGrill='1' and temp<"00010100")then
			temp<=temp+1;
		end if;
		if(swGrill='0' and temp>"00000000")then
			temp<=temp-1;
		end if;
	end if;
	end process;
process(temp)
	begin
	if(temp<"00000101" )then
		eCr<='1';
		eQu<='0';
	end if;
	if(temp<"00001111" and temp>"00000101"	)then
		eCr<='0';
		eQu<='0';
	end if;
	if(temp>"00001111")then
		eCr<='0';
		eQu<='1';
	end if;	
end process;	
errorA<=eQu OR eCr;
errorQuem<=eQu;
errorCru<=Ecr;	
end Behavioral;
