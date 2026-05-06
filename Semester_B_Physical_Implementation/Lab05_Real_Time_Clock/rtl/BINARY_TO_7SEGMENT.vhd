----------------------------------------------------------------------------------
-- Developer: Yossi Brim
-- 
-- Module Name: BINARY_TO_7SEGMENT
-- Project Name: Real-Time Digital Clock (Artix-7)
-- Description: 
--   Converts a 4-bit BCD digit into a 7-segment display pattern (Active Low).
--   Targeted for the onboard Basys 3 displays.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.All;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BINARY_TO_7SEGMENT is
port(
    BIN           : in STD_LOGIC_VECTOR(3 downto 0);
    seven_segment : out STD_LOGIC_VECTOR(6 downto 0)
);
end BINARY_TO_7SEGMENT;

architecture BINARY_TO_7SEGMENT_ARC of BINARY_TO_7SEGMENT is
begin
    process(BIN)
    begin
        case BIN is
            when "0000" => seven_segment <= "1000000"; -- 0
            when "0001" => seven_segment <= "1111001"; -- 1
            when "0010" => seven_segment <= "0100100"; -- 2
            when "0011" => seven_segment <= "0110000"; -- 3
            when "0100" => seven_segment <= "0011001"; -- 4
            when "0101" => seven_segment <= "0010010"; -- 5
            when "0110" => seven_segment <= "0000010"; -- 6
            when "0111" => seven_segment <= "1111000"; -- 7
            when "1000" => seven_segment <= "0000000"; -- 8
            when "1001" => seven_segment <= "0010000"; -- 9
            when others => seven_segment <= "1111111"; -- OFF
        end case;
    end process;
end BINARY_TO_7SEGMENT_ARC;
