----------------------------------------------------------------------------------
-- Developer: Yossi Brim
-- Module Name: CNTR (Synthesizable Version)
-- Project: Lab 05 - Synthesis Exercise
----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity CNTR is
port (
  CLK:    in  std_logic;
  RESET:  in  std_logic;
  Q:      out std_logic_vector(3 downto 0);
  TC:     out std_logic
);
end CNTR;

architecture CNTR_ARC of CNTR is
  signal Q_I: std_logic_vector(3 downto 0);
begin

  -- Synchronous Process: Inferred as 4 Flip-Flops during synthesis
  P1: process
  begin
    wait until rising_edge(CLK);
    if (RESET = '1') then
      Q_I <= "0000";
    else
      Q_I <= Q_I + 1;
    end if;
  end process;

  -- Combinational Logic: Inferred as a LUT (Look-Up Table)
  P2: TC <= '1' when (Q_I = "1111") else '0';

  P3: Q <= Q_I;

end CNTR_ARC;
