----------------------------------------------------------------------------------
-- Developer: Yossi Brim
-- 
-- Module Name: BIN_TO_BD - BIN_TO_BD_ARC
-- Project Name: Real-Time Digital Clock (Artix-7)
-- Description: 
--   Combinational logic converting a 6-bit binary value (0-59) into two 4-bit 
--   BCD digits (MS for tens, LS for units). Implemented functionally for optimal
--   synthesis into LUTs.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.All;
use ieee.numeric_std.all;

entity BIN_TO_BD is
port(
    VALUE_BIN : in STD_LOGIC_VECTOR(5 downto 0);
    MS        : out STD_LOGIC_VECTOR(3 downto 0);
    LS        : out STD_LOGIC_VECTOR(3 downto 0)
);
end BIN_TO_BD;

architecture BIN_TO_BD_ARC of BIN_TO_BD is
    signal int_val : integer range 0 to 63;
begin
    -- Convert binary input to integer for division and modulo operations
    int_val <= to_integer(unsigned(VALUE_BIN));
    
    -- Extract Tens (MS) and Units (LS)
    MS <= std_logic_vector(to_unsigned(int_val / 10, 4));
    LS <= std_logic_vector(to_unsigned(int_val mod 10, 4));

end BIN_TO_BD_ARC;
