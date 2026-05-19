----------------------------------------------------------------------------------
-- Engineers: Yossi Brim, Elad Asbag
-- Module Name: BINARY_TO_SEGMENT
-- Description: 4-bit BCD to 7-Segment Cathode Decoder (Active-Low).
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BINARY_TO_SEGMENT is
    Port ( 
        BCD_In   : in  STD_LOGIC_VECTOR (3 downto 0);
        Segments : out STD_LOGIC_VECTOR (6 downto 0) -- gfedcba
    );
end BINARY_TO_SEGMENT;

architecture Behavioral of BINARY_TO_SEGMENT is
begin
    process(BCD_In)
    begin
        case BCD_In is
            when "0000" => Segments <= "1000000"; -- 0
            when "0001" => Segments <= "1111001"; -- 1
            when "0010" => Segments <= "0100100"; -- 2
            when "0011" => Segments <= "0110000"; -- 3
            when "0100" => Segments <= "0011001"; -- 4
            when "0101" => Segments <= "0012010"; -- 5 (0010010)
            when "0110" => Segments <= "0000010"; -- 6
            when "0111" => Segments <= "1111000"; -- 7
            when "1000" => Segments <= "0000000"; -- 8
            when "1001" => Segments <= "0010000"; -- 9
            when others => Segments <= "1111111"; -- Blank
        end case;
    end process;
end Behavioral;
