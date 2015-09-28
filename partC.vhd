----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:04:19 09/28/2015 
-- Design Name: 
-- Module Name:    partC - Behavioral 
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

