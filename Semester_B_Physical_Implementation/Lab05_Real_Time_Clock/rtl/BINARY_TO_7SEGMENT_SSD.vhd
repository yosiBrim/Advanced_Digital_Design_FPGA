----------------------------------------------------------------------------------
-- Developer: Yossi Brim
-- 
-- Module Name: BINARY_TO_7SEGMENT_SSD
-- Project Name: Real-Time Digital Clock (Artix-7)
-- Description: 
--   Converts a 4-bit BCD digit into a 7-segment display pattern.
--   Targeted specifically for the external Digilent PmodSSD peripheral.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.All;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BINARY_TO_7SEGMENT_SSD is
port(
    B_IN          : in STD_LOGIC_VECTOR(3 downto 0);
    seven_segment : out STD_LOGIC_VECTOR(6 downto 0)
);
end BINARY_TO_7SEGMENT_SSD;

architecture BINARY_TO_7SEGMENT_SSD_ARC of BINARY_TO_7SEGMENT_SSD is
begin
    process(B_IN)
    begin
        case B_IN is
            when "0000" => seven_segment <= "0111111"; -- 0
            when "0001" => seven_segment <= "0000110"; -- 1
            when "0010" => seven_segment <= "1011011"; -- 2
            when "0011" => seven_segment <= "1001111"; -- 3
            when "0100" => seven_segment <= "1100110"; -- 4
            when "0101" => seven_segment <= "1101101"; -- 5
            when "0110" => seven_segment <= "1111101"; -- 6
            when "0111" => seven_segment <= "0000111"; -- 7
            when "1000" => seven_segment <= "1111111"; -- 8
            when "1001" => seven_segment <= "1101111"; -- 9
            when others => seven_segment <= "0000000"; -- OFF
        end case;
    end process;
end BINARY_TO_7SEGMENT_SSD_ARC;
