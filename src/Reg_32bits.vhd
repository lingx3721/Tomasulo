----------------------------------------------------------------------------------
-- Company/University:        Technical University of Crete (TUC) - GR
-- Engineer:                  Spyridakis Christos 
--                            Bellonias Panagiotis
-- 
-- Create Date:                
-- Design Name: 	 
-- Module Name:               Reg_32bits - Behavioral 
-- Project Name:              Tomasulo
-- Target Devices:            NONE
-- Tool versions:             Xilinx ISE 14.7 --TODO: VIVADO
-- Description:               Introduction in Dynamic Instruction Scheduling (Advanced Computer Architecture)
--                            implementing Tomasulo's Algorithm 	 
--
-- Dependencies:              NONE
--
-- Revision:                  2.1
-- Revision                   2.1 - ROB
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_32bits is
    Port ( CLK  : in  STD_LOGIC;
           RST  : in  STD_LOGIC;
           EN   : in  STD_LOGIC;
           INN  : in  STD_LOGIC_VECTOR (31 downto 0);
           OUTT : out  STD_LOGIC_VECTOR (31 downto 0));
end Reg_32bits;

architecture Behavioral of Reg_32bits is

begin
   process(CLK, RST)
	begin
		if (rising_edge(CLK)) then
			--RST
			if (RST='1') then                 
				OUTT<="00000000000000000000000000000000";
				
			--Write Enable
			elsif (EN='1') then               
				OUTT<=INN;
			end if;
		end if;
   end process;
end Behavioral;

