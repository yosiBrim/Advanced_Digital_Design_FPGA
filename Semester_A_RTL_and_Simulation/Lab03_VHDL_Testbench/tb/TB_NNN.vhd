----------------------------------------------------------------------------------
-- Developer: Yossi Brim
-- Module Name: TB_NNN
-- Description: Standard VHDL testbench for the nnn (Inverter) module.
--              Demonstrates stimulus generation using concurrent signal 
--              assignments with the 'after' keyword, replacing specific
--              ModelSim 'force' commands.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity TB_NNN is
-- A testbench entity is always empty because it has no external connections
end TB_NNN;

architecture YYY of TB_NNN is

    -- Component Declaration for the Device Under Test (DUT)
    component NNN
        port(
            A : in  std_logic;
            Y : out std_logic
        );
    end component;

    -- Internal signals to stimulate the DUT and observe its outputs
    signal A_in_the_tb : std_logic;
    signal Y_in_the_tb : std_logic;

begin

    -- Instantiate the DUT and map the ports
    DUT: NNN
        port map(
            A => A_in_the_tb,
            Y => Y_in_the_tb
        );

    -- Stimulus generation using concurrent delayed assignments
    A_in_the_tb <= '1',
                   '0' after 50 ns,
                   '1' after 100 ns,
                   '0' after 150 ns,
                   '1' after 200 ns;

end YYY;
