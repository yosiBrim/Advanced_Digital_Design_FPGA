----------------------------------------------------------------------------------
-- Developer: Yossi Brim
-- 
-- Project Name: VHDL Entities Exercise (Lab 01)
-- Description: 
--   VHDL Entity declarations for various industrial logic gates and 
--   cryptographic cores, demonstrating proper syntax, vector usage, 
--   and library inclusions.
----------------------------------------------------------------------------------

-- 1. SN74AUC2G00
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SN74AUC2G00 is
    Port (
        A, B : in  std_logic_vector(2 downto 1);
        Y    : out std_logic_vector(2 downto 1)
    );
end SN74AUC2G00;

----------------------------------------------------------------------------------

-- 2. CD74AC174
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CD74AC174 is
    Port (
        CLK, CLR : in  std_logic;
        D        : in  std_logic_vector(6 downto 1);
        Q        : out std_logic_vector(6 downto 1)
    );
end CD74AC174;

----------------------------------------------------------------------------------

-- 3. 74HC74 (Identifier prefixed with 'IC_' as VHDL names cannot start with numbers)
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IC_74HC74 is
    Port (
        D, RD_n, CP, SD_n : in  std_logic_vector(2 downto 1); -- '_n' indicates Active-Low
        Q, Q_n            : out std_logic_vector(2 downto 1)
    );
end IC_74HC74;

----------------------------------------------------------------------------------

-- 4. DES HELION CORE
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DES_HELION_CORE is
    Port (
        Plaintext, key  : in  std_logic_vector(63 downto 0);
        encrypt_request : in  std_logic;
        encrypt_mode    : in  std_logic;
        asynch_reset    : in  std_logic;
        synch_reset     : in  std_logic;
        master_clock    : in  std_logic;
        Ciphertext      : out std_logic_vector(63 downto 0);
        encrypt_status  : out std_logic;
        key_select      : out std_logic
    );
end DES_HELION_CORE;

----------------------------------------------------------------------------------

-- 5. Ocean Logic AES Core
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OL_AES is
    Port (
        DIN, KIN, KEY   : in  std_logic_vector(31 downto 0);
        KSIZE           : in  std_logic_vector(1 downto 0);
        E_D, GO, EN     : in  std_logic;
        RSTN, CLK       : in  std_logic;
        KEY_OUT, DOUT   : out std_logic_vector(31 downto 0);
        ADDR            : out std_logic_vector(5 downto 0);
        KEY_LAST        : out std_logic;
        DIN_REQ         : out std_logic;
        DOUT_VLD        : out std_logic
    );
end OL_AES;
