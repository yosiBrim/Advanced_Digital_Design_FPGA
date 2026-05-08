----------------------------------------------------------------------------------
-- Developer: Yossi Brim
-- Module Name: Address_Decoder
-- Description: 12-bit address decoder for memory-mapped I/O range detection.
-- Range: x"300" to x"310"
-- Reference: Final Exam 2007 (Moed B), Question 6
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Address_Decoder is
    Port (
        Address : in  std_logic_vector(11 downto 0); -- 12-bit input address bus
        Enable  : out std_logic                      -- Active-high enable signal
    );
end Address_Decoder;

architecture Behavioral of Address_Decoder is
begin
    process(Address)
    begin
        -- Logic to detect the specific memory range [x300 - x310]
        if (unsigned(Address) >= x"300" and unsigned(Address) <= x"310") then
            Enable <= '1';
        else
            Enable <= '0';
        end if;
    end process;
end Behavioral;
