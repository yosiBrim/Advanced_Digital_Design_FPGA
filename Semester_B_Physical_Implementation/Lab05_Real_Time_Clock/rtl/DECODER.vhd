----------------------------------------------------------------------------------
-- Developer: Yossi Brim
-- 
-- Module Name: DECODER - ARC_DECODER
-- Project Name: Real-Time Digital Clock (Artix-7)
-- Description: 
--   Address decoder directing the external load data to the appropriate counter.
--   00 -> Hours | 01 -> Minutes | 10 -> Seconds
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.All;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DECODER is
port(
    ADDRS       : in STD_LOGIC_VECTOR(1 downto 0);
    SEL_HOURS   : out STD_LOGIC;
    SEL_MINUTES : out STD_LOGIC;
    SEL_SECONDS : out STD_LOGIC
);
end DECODER;

architecture ARC_DECODER of DECODER is
begin
    SEL_HOURS   <= '1' when (ADDRS = "00") else '0';
    SEL_MINUTES <= '1' when (ADDRS = "01") else '0';
    SEL_SECONDS <= '1' when (ADDRS = "10") else '0';
end ARC_DECODER;
