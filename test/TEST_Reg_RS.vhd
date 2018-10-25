----------------------------------------------------------------------------------
-- Company/University:        Technical University of Crete (TUC) - GR
-- Engineer:                  Spyridakis Christos 
--                            Bellonias Panagiotis
--
-- Create Date:   				01:30:07 10/25/2018
-- Design Name:   
-- Module Name:   				Tomasulo/TEST_Reg_RS.vhd
-- Project Name:  				Tomasulo
-- Target Device:  				NONE
-- Tool versions:  				Xilinx ISE 14.7 --TODO: VIVADO
-- Description:               Introduction in Dynamic Instruction Scheduling (Advanced Computer Architecture)
--                            implementing Tomasulo's Algorithm 	 
--
-- VHDL Test Bench Created by ISE for module: Reg_RS
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TEST_Reg_RS IS
END TEST_Reg_RS;
 
ARCHITECTURE behavior OF TEST_Reg_RS IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Reg_RS
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         ID : IN  std_logic_vector(4 downto 0);
         Available : OUT  std_logic;
         ISSUE : IN  std_logic;
         Op_ISSUE : IN  std_logic_vector(1 downto 0);
         Vj_ISSUE : IN  std_logic_vector(31 downto 0);
         Qj : IN  std_logic_vector(4 downto 0);
         Vk_ISSUE : IN  std_logic_vector(31 downto 0);
         Qk : IN  std_logic_vector(4 downto 0);
         CDB_V : IN  std_logic_vector(31 downto 0);
         CDB_Q : IN  std_logic_vector(4 downto 0);
         Ready : OUT  std_logic;
         Op : OUT  std_logic_vector(1 downto 0);
         Tag : OUT  std_logic_vector(4 downto 0);
         Vj : OUT  std_logic_vector(31 downto 0);
         Vk : OUT  std_logic_vector(31 downto 0);
         Accepted : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal ID : std_logic_vector(4 downto 0) := (others => '0');
   signal ISSUE : std_logic := '0';
   signal Op_ISSUE : std_logic_vector(1 downto 0) := (others => '0');
   signal Vj_ISSUE : std_logic_vector(31 downto 0) := (others => '0');
   signal Qj : std_logic_vector(4 downto 0) := (others => '0');
   signal Vk_ISSUE : std_logic_vector(31 downto 0) := (others => '0');
   signal Qk : std_logic_vector(4 downto 0) := (others => '0');
   signal CDB_V : std_logic_vector(31 downto 0) := (others => '0');
   signal CDB_Q : std_logic_vector(4 downto 0) := (others => '0');
   signal Accepted : std_logic := '0';

 	--Outputs
   signal Available : std_logic;
   signal Ready : std_logic;
   signal Op : std_logic_vector(1 downto 0);
   signal Tag : std_logic_vector(4 downto 0);
   signal Vj : std_logic_vector(31 downto 0);
   signal Vk : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Reg_RS PORT MAP (
          CLK => CLK,
          RST => RST,
          ID => ID,
          Available => Available,
          ISSUE => ISSUE,
          Op_ISSUE => Op_ISSUE,
          Vj_ISSUE => Vj_ISSUE,
          Qj => Qj,
          Vk_ISSUE => Vk_ISSUE,
          Qk => Qk,
          CDB_V => CDB_V,
          CDB_Q => CDB_Q,
          Ready => Ready,
          Op => Op,
          Tag => Tag,
          Vj => Vj,
          Vk => Vk,
          Accepted => Accepted
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		ID       <="11011";
		
		---------------------------------------------------------CC:1
		RST      <= '1';
		ISSUE    <= '0';
		Op_ISSUE <= "01";
		Vj_ISSUE <= "00000000000000000000000000001110";
		Vk_ISSUE <= "00000000000000000000000000100111";
		Qj       <= "01000";
		Qk       <= "01010";
		CDB_V    <= "11000000000000000010000000000011";
		CDB_Q    <= "00101";
		wait for CLK_period*1;
		---------------------------------------------------------CC:2
		RST      <= '0';
		ISSUE    <= '1';
		Op_ISSUE <= "01";
		Vj_ISSUE <= "00000000000000000000010000000110";
		Vk_ISSUE <= "00000000000000000010000000000111";
		Qj       <= "00100";
		Qk       <= "01010";
		CDB_V    <= "11000000100100010000000000000011";
		CDB_Q    <= "10101";
		wait for CLK_period*2;
		---------------------------------------------------------CC:3
		RST      <= '0';
		ISSUE    <= '0';
		Op_ISSUE <= "01";
		Vj_ISSUE <= "00010001000100010000000000000110";
		Vk_ISSUE <= "01001000010000010001000000000111";
		Qj       <= "01001";
		Qk       <= "01010";
		CDB_V    <= "11000000000000000000000000000011";
		CDB_Q    <= "00100";
		wait for CLK_period*1;
		---------------------------------------------------------CC:4
		RST      <= '0';
		ISSUE    <= '1';
		Op_ISSUE <= "00";
		Vj_ISSUE <= "00000000000000000000000000000001";
		Vk_ISSUE <= "00000000000000000000000000000011";
		Qj       <= "00000";
		Qk       <= "00000";
		CDB_V    <= "11000000000000000000000000000011";
		CDB_Q    <= "00100";
		wait for CLK_period*1;
		---------------------------------------------------------CC:5
		RST      <= '0';
		ISSUE    <= '0';
		Op_ISSUE <= "01";
		Vj_ISSUE <= "00110100000000000000000000000110";
		Vk_ISSUE <= "00100100000000000000000000000111";
		Qj       <= "00100";
		Qk       <= "00110";
		CDB_V    <= "11000010001000000000000000000011";
		CDB_Q    <= "00111";
		wait for CLK_period*1;

		
      wait for CLK_period*1;

      -- insert stimulus here 

      wait;
   end process;

END;
