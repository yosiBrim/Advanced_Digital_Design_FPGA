----------------------------------------------------------------------------------
-- Developer: Yossi Brim
-- Module Name: nnn (Inverter)
-- Description: Simple NOT gate used as the Device Under Test (DUT).
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nnn is
    Port ( 
        A : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end nnn;

architecture Behavioral of nnn is
begin
    Y <= not A;
end Behavioral;
