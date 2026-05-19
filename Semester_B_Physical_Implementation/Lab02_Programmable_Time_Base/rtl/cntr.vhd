----------------------------------------------------------------------------------
-- Module Name: Programmable_Time_Base
-- Description: 16-bit programmable frequency divider with dynamic load register.
-- Target Device: Xilinx Artix-7 (Basys 3)
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Programmable_Time_Base is
    Port ( 
        CLK   : in  STD_LOGIC;
        RESET : in  STD_LOGIC;
        LOAD  : in  STD_LOGIC;
        DATA  : in  STD_LOGIC_VECTOR (15 downto 0);
        TC    : out STD_LOGIC
    );
end Programmable_Time_Base;

architecture Behavioral of Programmable_Time_Base is
    signal LOADED_DATA : STD_LOGIC_VECTOR(15 downto 0);
    signal Q           : STD_LOGIC_VECTOR(15 downto 0);
begin
    -- Register to hold the loaded limit value
    process
    begin
        wait until rising_edge(CLK);
        if (RESET = '1') then
            LOADED_DATA <= (others => '0');
        else
            if (LOAD = '1') then
                LOADED_DATA <= DATA;
            end if;
        end if;
    end process;

    -- Synchronous Counter and TC logic
    process
    begin
        wait until rising_edge(CLK);
        if (RESET = '1') then
            Q <= (others => '0');
            TC <= '0';
        else
            if (Q < LOADED_DATA) then
                Q <= Q + 1;
                TC <= '0';
            else
                Q <= (others => '0');
                TC <= '1';
            end if; 
        end if;
    end process;
end Behavioral;
