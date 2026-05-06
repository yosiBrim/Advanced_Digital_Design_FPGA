----------------------------------------------------------------------------------
-- Developer: Yossi Brim
-- 
-- Module Name: REAL_CLK - ARC_REAL_CLK
-- Project Name: Real-Time Digital Clock (Artix-7)
-- Description: 
--   Core timing engine generating a 1Hz timebase. Includes cascading counters 
--   for Seconds, Minutes, and Hours. Supports external data preset via LOAD.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.All;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity REAL_CLK is
port(
    CLK         : in std_logic;
    RESET       : in std_logic;
    TestMode    : in std_logic;
    SEL_HOURS   : in std_logic;
    SEL_MINUTES : in std_logic;
    SEL_SECONDS : in std_logic;
    DATA_IN     : in std_logic_VECTOR(5 downto 0);
    LOAD        : in std_logic;
    Seconds_Out : out std_logic_VECTOR(5 downto 0);
    Minutes_Out : out std_logic_VECTOR(5 downto 0);
    Hours_Out   : out std_logic_VECTOR(4 downto 0)
);
end REAL_CLK;

architecture ARC_REAL_CLK of REAL_CLK is
    signal Q_Seconds : std_logic_VECTOR(5 downto 0);
    signal Q_Minutes : std_logic_VECTOR(5 downto 0);
    signal Q_Hours   : std_logic_VECTOR(4 downto 0);
    signal Q         : std_logic_VECTOR(26 downto 0);
    signal TC_TimeBase: std_logic;
begin

    -- Timebase Generator (1Hz normal, rapid for TestMode)
    process
    begin
        wait until rising_edge(CLK);
        if (RESET = '1') then
            Q <= (others => '0');
            TC_TimeBase <= '0';
        elsif (TestMode = '1') then
            -- Rapid test mode
            if (Q < 9) then
                Q <= Q + 1;
                TC_TimeBase <= '0';
            else
                Q <= (others => '0');
                TC_TimeBase <= '1';
            end if;
        elsif (TestMode = '0') then
            -- Normal 1Hz operation (100MHz clock)
            if (Q < 99999999) then
                Q <= Q + 1;
                TC_TimeBase <= '0';
            else
                Q <= (others => '0');
                TC_TimeBase <= '1';
            end if;
        end if;
    end process;

    -- Seconds Counter
    The_Seconds: process
    begin
        wait until rising_edge(CLK);
        if (RESET = '1') then
            Q_Seconds <= (others => '0');
        else
            if ((LOAD = '1') and (SEL_SECONDS = '1')) then
                Q_Seconds <= DATA_IN;
            elsif (TC_TimeBase = '1') then
                if (Q_Seconds < 59) then
                    Q_Seconds <= Q_Seconds + 1;
                else
                    Q_Seconds <= (others => '0');
                end if;
            end if;
        end if;
    end process;
    Seconds_Out <= Q_Seconds;

    -- Minutes Counter
    The_Minutes: process
    begin
        wait until rising_edge(CLK);
        if (RESET = '1') then
            Q_Minutes <= (others => '0');
        else
            if ((LOAD = '1') and (SEL_MINUTES = '1')) then
                Q_Minutes <= DATA_IN;
            elsif ((TC_TimeBase = '1') and (Q_Seconds = 59)) then
                if (Q_Minutes < 59) then
                    Q_Minutes <= Q_Minutes + 1;
                else
                    Q_Minutes <= (others => '0');
                end if;
            end if;
        end if;
    end process;
    Minutes_Out <= Q_Minutes;

    -- Hours Counter
    The_Hours: process
    begin
        wait until rising_edge(CLK);
        if (RESET = '1') then
            Q_Hours <= (others => '0');
        else
            if ((LOAD = '1') and (SEL_HOURS = '1')) then
                Q_Hours <= DATA_IN(4 downto 0);
            elsif ((TC_TimeBase = '1') and (Q_Minutes = 59) and (Q_Seconds = 59)) then
                if (Q_Hours < 23) then
                    Q_Hours <= Q_Hours + 1;
                else
                    Q_Hours <= (others => '0');
                end if;
            end if;
        end if;
    end process;
    Hours_Out <= Q_Hours;

end ARC_REAL_CLK;
