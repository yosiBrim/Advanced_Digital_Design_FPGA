----------------------------------------------------------------------------------
-- Developer: Yossi Brim
-- 
-- Module Name: TB_Top_level - TB_ARC_Top_level
-- Project Name: Traffic Light Controller (Artix-7)
-- Description: 
--   Self-contained testbench for the Top_level module. Generates a 100MHz 
--   clock stimulus and initializes the system via an asynchronous reset sequence.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.All;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TB_Top_level is 
-- Testbench entity has no ports
end TB_Top_level;

architecture TB_ARC_Top_level of TB_Top_level is

    -- Device Under Test (DUT) Declaration
    component Top_level 
        port(
            CLK   : in  std_logic;
            RESET : in  std_logic;
            LIGHT : out std_logic_VECTOR(4 downto 0)
        );
    end component;

    -- Stimulus signals
    signal TB_CLK   : std_logic := '0';
    signal TB_RESET : std_logic := '0';
    
    -- Observation signals
    signal TB_LIGHT : std_logic_VECTOR(4 downto 0);

begin

    -- Instantiate the DUT
    DUT : Top_level
        port map(
            CLK   => TB_CLK,
            RESET => TB_RESET,
            LIGHT => TB_LIGHT
        );

    ----------------------------------------------------------------------------------
    -- Process: stim_proc
    -- Description: Generates a 100MHz continuous clock (10ns period -> 5ns half-period)
    ----------------------------------------------------------------------------------
    stim_proc: process
    begin
        wait for 5 ns;
        TB_CLK <= not(TB_CLK);
    end process;

    ----------------------------------------------------------------------------------
    -- Reset Sequence: Assert reset high initially, then de-assert after 117ns
    -- (unaligned to clock edge to test asynchronous behavior).
    ----------------------------------------------------------------------------------
    TB_RESET <= '1', '0' after 117 ns;
			
end TB_ARC_Top_level;
