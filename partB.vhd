----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:45:19 09/28/2015 
-- Design Name: 
-- Module Name:    partB - Behavioral 
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

entity partB is
    Port ( CLK : in  STD_LOGIC;
           swDispVacio : in  STD_LOGIC;
           errorB : out  STD_LOGIC);
end partB;

architecture Behavioral of partB is

begin
process(CLK,swDispVacio)
	begin
		if(swDispVacio'event and swDispVacio='1')then
			errorB<='1';
		else
			errorB<='0';
		end if;
end process;
end Behavioral;

