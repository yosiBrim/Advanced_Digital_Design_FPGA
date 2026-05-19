----------------------------------------------------------------------------------
-- Engineers: Yossi Brim, Elad Asbag
-- Module Name: Q3 (Modulo-100 Counter / Time Base Generator)
-- Description: Hard-Coded Time Base Generator dividing clock frequency.
-- Target Device: Xilinx Artix-7
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.All;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Q3 is 
    port(
        CLK   : in  std_logic;
        RESET : in  std_logic;
        TC    : out std_logic
    );
end Q3;

architecture AAA of Q3 is
    signal Q : std_logic_VECTOR(6 downto 0);
begin
    process
    begin
        wait until rising_edge(CLK);
        if (RESET = '1') then
            Q <= (others => '0');
        else
            if (Q < 99) then
                Q <= Q + 1;
            else
                Q <= (others => '0');
            end if;
        end if;
    end process;
    
    TC <= '1' when (Q = 0) else '0';
end AAA;
