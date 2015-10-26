
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity CounterCond is
    Port ( Clk : in  STD_LOGIC;
			  Cond:in STD_LOGIC;
           ctrlVect : in  STD_LOGIC_VECTOR (7 downto 0);
			  btnAlarma:in STD_LOGIC;
           minPass :buffer  STD_LOGIC);
end CounterCond;

architecture Behavioral of CounterCond is
signal temp: STD_LOGIC_VECTOR(7 downto 0);

begin
process(Clk,Cond)
  variable a : std_logic_vector(7 downto 0);
  variable tmpAlarm :STD_LOGIC;
	begin
	if(Cond='1')then
		if(Clk'event and Clk='1')then
			if(ctrlVect=temp)then
				tmpAlarm:='1';
				a:="00000000";
		--	temp <= (others=>'0')  when ctrlVect=temp 
			else 
				a:=a+"01";
			end if;
		end if;
	else
			if(btnAlarma='1')then
				tmpAlarm:='0';	
				a:="00000000";
			end if;	
	end if;
minPass<=tmpAlarm;	
temp<=a;	
	end process;
end Behavioral;

