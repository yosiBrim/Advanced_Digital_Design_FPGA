----------------------------------------------------------------------------------
-- Developer: Yossi Brim
-- Module Name: ALU
-- Description: 4-bit Arithmetic Logic Unit supporting ADD, AND, OR, XOR.
-- Reference: Final Exam 2007 (Moed A), Question 6
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    Port (
        A       : in  unsigned(3 downto 0);
        B       : in  unsigned(3 downto 0);
        Opcode  : in  std_logic_vector(1 downto 0);
        Y       : out unsigned(3 downto 0)
    );
end ALU;

architecture Behavioral of ALU is
begin
    process(A, B, Opcode)
    begin
        case Opcode is
            when "00" => -- A + B
                Y <= resize(A + B, 4);
            when "01" => -- A and B
                Y <= A and B;
            when "10" => -- A or B
                Y <= A or B;
            when "11" => -- A xor B
                Y <= A xor B;
            when others =>
                Y <= (others => '0');
        end case;
    end process;
end Behavioral;
