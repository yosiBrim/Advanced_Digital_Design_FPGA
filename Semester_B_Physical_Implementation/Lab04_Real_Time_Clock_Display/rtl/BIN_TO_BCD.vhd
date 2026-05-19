----------------------------------------------------------------------------------
-- Engineers: Yossi Brim, Elad Asbag
-- Module Name: BIN_TO_BCD
-- Description: Converts a 6-bit binary time value (0-59) into Tens and Units BCD.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BIN_TO_BCD is
    Port ( 
        Binary_In : in  STD_LOGIC_VECTOR (5 downto 0);
        Tens      : out STD_LOGIC_VECTOR (3 downto 0);
        Units     : out STD_LOGIC_VECTOR (3 downto 0)
    );
end BIN_TO_BCD;

architecture Behavioral of BIN_TO_BCD is
begin
    process(Binary_In)
        variable total_val : integer;
    begin
        total_val := to_integer(unsigned(Binary_In));
        Tens  <= std_logic_vector(to_unsigned(total_val / 10, 4));
        Units <= std_logic_vector(to_unsigned(total_val rem 10, 4));
    end process;
end Behavioral;
