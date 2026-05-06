----------------------------------------------------------------------------------
-- Developer: Yossi Brim
-- 
-- Module Name: Counters - Counters_ARC
-- Project Name: Traffic Light Controller (Artix-7)
-- Description: 
--   Contains two independent counters (10-second and 2-second) that run 
--   based on the 1Hz Clock Enable (CE). A combinational MUX routes the 
--   appropriate Terminal Count (TC) as the Advance (ADV) signal to the FSM.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.All;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Counters is 
port(
    CLK        : in  std_logic; -- System clock
    RESET      : in  std_logic; -- Asynchronous reset
    CE         : in  std_logic; -- 1Hz clock enable
    SEL        : in  std_logic; -- Counter selector from FSM
    ADV        : out std_logic  -- Output advance signal to FSM
);
end Counters;

architecture Counters_ARC of Counters is
    signal Q_2Seconds  : std_logic_vector(1 downto 0); -- 2-bit counter (0 to 1)
    signal Q_10Seconds : std_logic_vector(3 downto 0); -- 4-bit counter (0 to 9)
    signal TC2, TC10   : std_logic; -- Terminal count flags
begin

----------------------------------------------------------------------------------
-- Process: Seconds2
-- Description: 2-second interval counter. Runs only when SEL = '1'.
----------------------------------------------------------------------------------
Seconds2: process
begin
    wait until rising_edge(CLK);
    if (RESET = '1') then
        Q_2Seconds <= (others => '0');
        TC2        <= '0';
    else
        if (CE = '1') then
            if (SEL = '1') then
                if (Q_2Seconds < 1) then
                    Q_2Seconds <= Q_2Seconds + 1;
                    TC2 <= '0'; 
                else
                    Q_2Seconds <= (others => '0');
                    TC2 <= '1';	-- Generate Terminal Count pulse
                end if;
            else
                -- Clear counter when not selected
                Q_2Seconds <= (others => '0');
                TC2        <= '0';
            end if;
        end if;    		
    end if;
end process;

----------------------------------------------------------------------------------
-- Process: Seconds10
-- Description: 10-second interval counter. Runs only when SEL = '0'.
----------------------------------------------------------------------------------
Seconds10: process
begin
    wait until rising_edge(CLK);
    if (RESET = '1') then
        Q_10Seconds <= (others => '0');
        TC10        <= '0';
    else
        if (CE = '1') then
            if (SEL = '0') then
                if (Q_10Seconds < 9) then
                    Q_10Seconds <= Q_10Seconds + 1;
                    TC10 <= '0'; 
                else
                    Q_10Seconds <= (others => '0');
                    TC10 <= '1'; -- Generate Terminal Count pulse
                end if;
            else
                -- Clear counter when not selected
                Q_10Seconds <= (others => '0');
                TC10        <= '0';
            end if;
        end if;    		
    end if;
end process;

----------------------------------------------------------------------------------
-- Process: MUX
-- Description: Combinational multiplexer routing the appropriate TC to ADV.
----------------------------------------------------------------------------------
MUX: process (SEL, TC10, TC2)
begin
    case SEL is 
        when '0'    => ADV <= TC10; -- Route 10s timer
        when '1'    => ADV <= TC2;  -- Route 2s timer
        when others => ADV <= '0';  -- Default safe state
    end case;
end process;

end Counters_ARC;
