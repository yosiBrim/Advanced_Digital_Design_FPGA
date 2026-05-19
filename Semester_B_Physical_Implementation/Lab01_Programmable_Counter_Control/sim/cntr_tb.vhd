----------------------------------------------------------------------------------
-- Engineers: Yossi Brim, Elad Asbag
-- Module Name: TB_Q3 (Testbench for Modulo-100 Counter)
-- Description: Functional verification using clock stimulus and reset sequence.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.All;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TB_Q3 is 
end TB_Q3;

architecture TB_AAA of TB_Q3 is
    component Q3 
        port(
            CLK   : in  std_logic;
            RESET : in  std_logic;
            TC    : out std_logic
        );
    end component;

    signal TB_RESET : std_logic;
    signal TB_CLK   : std_logic := '1';
    signal TB_TC    : std_logic;
begin

    -- Instantiate the Device Under Test (DUT)
    DUT : Q3
    port map(
        CLK   => TB_CLK,
        RESET => TB_RESET,
        TC    => TB_TC 
    );

    -- Reset Sequence
    L1: TB_RESET <= '1',
                    '0' after 7 MS;
                    
    -- Clock Generation (10ms Period / 100Hz for simulation clarity)
    L2: TB_CLK <= not(TB_CLK) after 5 MS;
    
end TB_AAA;
