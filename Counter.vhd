----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:50:20 09/25/2015 
-- Design Name: 
-- Module Name:    CounterSec - Behavioral 
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

