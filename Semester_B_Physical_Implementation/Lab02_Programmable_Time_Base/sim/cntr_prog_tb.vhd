----------------------------------------------------------------------------------
-- Engineers: Yossi Brim, Elad Asbag (Team 1)
-- Module Name: TB_Programmable_Time_Base
-- Description: Dynamic stimulus changing the LOAD data during runtime.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TB_Programmable_Time_Base is
end TB_Programmable_Time_Base;

architecture Behavioral of TB_Programmable_Time_Base is
    component Programmable_Time_Base
        Port ( 
            CLK   : in  STD_LOGIC;
            RESET : in  STD_LOGIC;
            LOAD  : in  STD_LOGIC;
            DATA  : in  STD_LOGIC_VECTOR (15 downto 0);
            TC    : out STD_LOGIC
        );
    end component;

    signal TB_CLK   : STD_LOGIC := '1';
    signal TB_RESET : STD_LOGIC;
    signal TB_LOAD  : STD_LOGIC;
    signal TB_DATA  : STD_LOGIC_VECTOR(15 downto 0);
    signal TB_TC    : STD_LOGIC;

begin
    DUT: Programmable_Time_Base port map(
        CLK => TB_CLK, RESET => TB_RESET, LOAD => TB_LOAD, DATA => TB_DATA, TC => TB_TC
    );

    -- 100MHz Clock
    TB_CLK <= not TB_CLK after 5 ns;

    -- Stimulus Process
    process
    begin
        -- Initial Reset
        TB_RESET <= '1';
        TB_LOAD  <= '0';
        TB_DATA  <= x"0000";
        wait for 20 ns;
        TB_RESET <= '0';
        
        -- Phase 1: Load 10 (0x000A)
        TB_DATA <= x"000A";
        TB_LOAD <= '1';
        wait for 10 ns;
        TB_LOAD <= '0';
        
        -- Wait for 4 TC pulses (roughly 4 * 10 * 10ns = 400ns)
        wait for 500 ns;
        
        -- Phase 2: Load 100 (0x0064)
        TB_DATA <= x"0064";
        TB_LOAD <= '1';
        wait for 10 ns;
        TB_LOAD <= '0';
        
        -- Wait for 4 TC pulses (roughly 4 * 100 * 10ns = 4000ns)
        wait for 4500 ns;
        
        wait; -- End simulation
    end process;
end Behavioral;
