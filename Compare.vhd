----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:12:21 09/25/2015 
-- Design Name: 
-- Module Name:    Compare - Behavioral 
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

