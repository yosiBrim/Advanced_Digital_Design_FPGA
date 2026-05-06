----------------------------------------------------------------------------------
-- Developer: Yossi Brim
-- 
-- Module Name: Time_Base - Time_Base_ARC
-- Project Name: Traffic Light Controller (Artix-7)
-- Description: 
--   Clock divider module. Converts the Basys 3 native 100MHz system clock 
--   into a 1Hz clock enable pulse (TC_TimeBase) to drive downstream logic.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.All;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Time_Base is 
port(
    CLK         : in  std_logic; -- 100MHz input clock
    RESET       : in  std_logic; -- Asynchronous reset
    TC_TimeBase : out std_logic  -- 1Hz output enable pulse
);
end Time_Base;

architecture Time_Base_ARC of Time_Base is
    -- 27-bit counter required to count up to 99,999,999
    signal Q : std_logic_VECTOR(26 downto 0);
begin

----------------------------------------------------------------------------------
-- Process: Clock Divider
-- Description: Increments every clock cycle. Asserts TC_TimeBase for one 
--              clock cycle every 100,000,000 cycles (1 second at 100MHz).
----------------------------------------------------------------------------------
process
begin
    wait until rising_edge(CLK);
    if (RESET = '1') then
        Q <= (others => '0');
        TC_TimeBase <= '0';
    else
        -- 100MHz = 100,000,000 cycles per second (0 to 99,999,999)
        if (Q < 99999999) then
            Q <= Q + 1;
            TC_TimeBase <= '0';
        else 
            Q <= (others => '0');
            TC_TimeBase <= '1'; -- 1Hz pulse generation
        end if;
    end if;
end process;

end Time_Base_ARC;
