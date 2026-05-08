----------------------------------------------------------------------------------
-- Developer: Yossi Brim
-- Module Name: cntr
-- Description: 4-bit free-running up-counter with an active-high 
--              synchronous reset and Terminal Count (TC) output.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cntr is
    Port ( 
        CLK   : in  STD_LOGIC;
        RESET : in  STD_LOGIC;
        Q     : out STD_LOGIC_VECTOR (3 downto 0);
        TC    : out STD_LOGIC
    );
end cntr;

architecture Behavioral of cntr is
    signal count : STD_LOGIC_VECTOR(3 downto 0) := "0000";
begin

    -- P1: Counter Process (Synchronous Logic)
    -- Counts from 0000 to 1111. Resets synchronously when RESET = '1'.
    P1: process(CLK)
    begin
        if rising_edge(CLK) then
            if RESET = '1' then
                count <= "0000";
            else
                count <= count + 1;
            end if;
        end if;
    end process;

    -- P2: Terminal Count (TC) Logic
    -- Asserts TC when the counter reaches its maximum value (15).
    P2: TC <= '1' when count = "1111" else '0';

    -- P3: Output Assignment
    -- Routes the internal signal to the output port.
    P3: Q <= count;

end Behavioral;
