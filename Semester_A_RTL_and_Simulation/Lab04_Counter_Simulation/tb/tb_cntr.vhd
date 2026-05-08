----------------------------------------------------------------------------------
-- Developer: Yossi Brim
-- Module Name: tb_cntr
-- Description: Testbench for the 4-bit counter. Generates a 5MHz clock 
--              and tests the synchronous reset behavior.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_cntr is
-- Testbench has no ports
end tb_cntr;

architecture Behavioral of tb_cntr is

    component cntr
        Port ( 
            CLK   : in  STD_LOGIC;
            RESET : in  STD_LOGIC;
            Q     : out STD_LOGIC_VECTOR(3 downto 0);
            TC    : out STD_LOGIC
        );
    end component;

    -- Stimulus signals
    signal tbCLK   : STD_LOGIC := '0';
    signal tbRESET : STD_LOGIC := '1';
    
    -- Observation signals
    signal tbQ     : STD_LOGIC_VECTOR(3 downto 0);
    signal tbTC    : STD_LOGIC;

begin

    DUT: cntr port map (
        CLK   => tbCLK,
        RESET => tbRESET,
        Q     => tbQ,
        TC    => tbTC
    );

    -- Clock Generation: 5MHz -> 200ns period (100ns high, 100ns low)
    process
    begin
        wait for 100 ns;
        tbCLK <= not tbCLK;
    end process;

    -- Reset Sequence Stimulus
    process
    begin
        tbRESET <= '1';
        wait for 450 ns; -- Unaligned to clock to prove synchronous behavior
        tbRESET <= '0';
        wait;
    end process;

end Behavioral;
