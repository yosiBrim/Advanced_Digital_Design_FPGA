----------------------------------------------------------------------------------
-- Developer: Yossi Brim [cite: 4]
-- Module Name: Comparator
-- Description: 4-bit magnitude comparator with Active-Low outputs.
-- Reference: Final Exam 2007 (Moed C), Question 6 [cite: 1, 5]
----------------------------------------------------------------------------------
library IEEE; [cite: 6]
use IEEE.STD_LOGIC_1164.ALL; [cite: 7]
use IEEE.NUMERIC_STD.ALL; [cite: 8]

entity Comparator is [cite: 9]
    Port ( [cite: 10]
        A    : in  std_logic_vector(3 downto 0); -- 4-bit input A [cite: 11]
        B    : in  std_logic_vector(3 downto 0); -- 4-bit input B [cite: 12]
        EQ   : out std_logic;  -- Active Low for equality (A = B) [cite: 13, 23]
        GT   : out std_logic;  -- Active Low for greater (A > B) [cite: 14, 28]
        LT   : out std_logic   -- Active Low for less (A < B) [cite: 15, 33]
    ); [cite: 16]
end Comparator; [cite: 17]

architecture Behavioral of Comparator is [cite: 18]
begin
    process(A, B) [cite: 20]
    begin
        if unsigned(A) = unsigned(B) then [cite: 22]
            EQ <= '0';  -- Active Low for equality [cite: 23]
            GT <= '1';  -- Not greater [cite: 24]
            LT <= '1';  -- Not less [cite: 25]
        elsif unsigned(A) > unsigned(B) then [cite: 26]
            EQ <= '1';  -- Not equal [cite: 27]
            GT <= '0';  -- Active Low for greater [cite: 28]
            LT <= '1';  -- Not less [cite: 29]
        else [cite: 30]
            EQ <= '1';  -- Not equal [cite: 31]
            GT <= '1';  -- Not greater [cite: 32]
            LT <= '0';  -- Active Low for less [cite: 33]
        end if; [cite: 34]
    end process; [cite: 35]
end Behavioral; [cite: 36]
