----------------------------------------------------------------------------------
-- Engineers: Yossi Brim, Elad Asbag
-- Module Name: TB_Top_level
-- Description: Testbench for the integrated Real-Time Clock and Display Multiplexer.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Top_level is
end TB_Top_level;

architecture Behavioral of TB_Top_level is

    -- Component Declaration for the DUT (Device Under Test)
    component Top_level
        Port ( 
            CLK                : in  STD_LOGIC;
            RESET              : in  STD_LOGIC;
            TestMode           : in  STD_LOGIC;
            BASYS_ANODE_OUT    : out STD_LOGIC_VECTOR (3 downto 0);
            BASYS_SEGMENTS_OUT : out STD_LOGIC_VECTOR (6 downto 0);
            SSD_CATHODE_OUT    : out STD_LOGIC;
            SSD_SEGMENTS_OUT   : out STD_LOGIC_VECTOR (6 downto 0)
        );
    end component;

    -- Stimulus Signals
    signal TB_CLK                : STD_LOGIC := '0';
    signal TB_RESET              : STD_LOGIC := '0';
    signal TB_TestMode           : STD_LOGIC := '0';
    
    -- Observation Signals
    signal TB_BASYS_ANODE_OUT    : STD_LOGIC_VECTOR (3 downto 0);
    signal TB_BASYS_SEGMENTS_OUT : STD_LOGIC_VECTOR (6 downto 0);
    signal TB_SSD_CATHODE_OUT    : STD_LOGIC;
    signal TB_SSD_SEGMENTS_OUT   : STD_LOGIC_VECTOR (6 downto 0);

begin

    -- Instantiate the Top Level Design
    DUT: Top_level port map (
        CLK                => TB_CLK,
        RESET              => TB_RESET,
        TestMode           => TB_TestMode,
        BASYS_ANODE_OUT    => TB_BASYS_ANODE_OUT,
        BASYS_SEGMENTS_OUT => TB_BASYS_SEGMENTS_OUT,
        SSD_CATHODE_OUT    => TB_SSD_CATHODE_OUT,
        SSD_SEGMENTS_OUT   => TB_SSD_SEGMENTS_OUT
    );

    -- 100MHz System Clock Generation (10ns period)
    TB_CLK <= not TB_CLK after 5 ns;

    -- Stimulus Process
    Stimulus: process
    begin
        -- Initial Reset & Set to Test Mode (Fast Forward)
        TB_RESET <= '1';
        TB_TestMode <= '1'; 
        wait for 40 ns;
        
        -- Release Reset and let the clock run
        TB_RESET <= '0';
        
        -- Run simulation long enough to observe multiplexing action 
        -- and cascaded counting across seconds, minutes, and hours.
        wait for 20 ms; 
        
        wait; -- Stop execution
    end process;

end Behavioral;
