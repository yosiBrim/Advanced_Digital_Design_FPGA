----------------------------------------------------------------------------------
-- Developer: Yossi Brim
-- Module Name: Pattern_Detector
-- Description: 4-bit address pattern detector (detects "0101" or "1010").
-- Reference: Final Exam 2007 (Moed D), Question 6
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Pattern_Detector is
    Port (
        Address : in  std_logic_vector(3 downto 0); -- 4-bit input bus
        Detect  : out std_logic                     -- Active High detection flag
    );
end Pattern_Detector;

architecture Behavioral of Pattern_Detector is
begin
    process(Address)
    begin
        -- Assert Detect if the address matches specific alternating patterns
        if (Address = "0101" or Address = "1010") then
            Detect <= '1';
        else
            Detect <= '0';
        end if;
    end process;
end Behavioral;
