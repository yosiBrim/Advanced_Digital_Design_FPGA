----------------------------------------------------------------------------------
-- Developer: Yossi Brim
-- 
-- Module Name: Top_level - ARC_Top_level
-- Project Name: Real-Time Digital Clock (Artix-7)
-- Description: 
--   Structural top-level integrating the clock engine, decoders, and display drivers.
--   Implements a fast refresh-rate multiplexer using a 2-bit counter to drive 
--   the onboard 4-digit 7-segment display and the external 2-digit PmodSSD.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.All;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Top_level is
port(
    CLK                : in std_logic;
    RESET              : in std_logic;
    TestMode           : in std_logic;
    DATA_IN            : in std_logic_VECTOR(5 downto 0);
    LOAD               : in std_logic;
    ADDRS              : in STD_LOGIC_VECTOR(1 downto 0);
    BASYS_ANODE_OUT    : out std_logic_VECTOR(3 downto 0);
    BASYS_SEGMENTS_OUT : out std_logic_VECTOR(6 downto 0);
    SSD_CATHODE_OUT    : out std_logic;
    SSD_SEGMENTS_OUT   : out std_logic_VECTOR(6 downto 0)
);
end Top_level;

architecture ARC_Top_level of Top_level is

    -- Component Declarations
    component REAL_CLK
        port(
            CLK         : in std_logic;
            RESET       : in std_logic;
            TestMode    : in std_logic;
            SEL_HOURS   : in std_logic;
            SEL_MINUTES : in std_logic;
            SEL_SECONDS : in std_logic;
            DATA_IN     : in std_logic_VECTOR(5 downto 0);
            LOAD        : in std_logic;
            Seconds_Out : out std_logic_VECTOR(5 downto 0);
            Minutes_Out : out std_logic_VECTOR(5 downto 0);
            Hours_Out   : out std_logic_VECTOR(4 downto 0)
        );
    end component;

    component BIN_TO_BD
        port(
            VALUE_BIN : in STD_LOGIC_VECTOR(5 downto 0);
            MS        : out STD_LOGIC_VECTOR(3 downto 0);
            LS        : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    component BINARY_TO_7SEGMENT
        port(
            BIN           : in STD_LOGIC_VECTOR(3 downto 0);
            seven_segment : out STD_LOGIC_VECTOR(6 downto 0)
        );
    end component;

    component BINARY_TO_7SEGMENT_SSD
        port(
            B_IN          : in STD_LOGIC_VECTOR(3 downto 0);
            seven_segment : out STD_LOGIC_VECTOR(6 downto 0)
        );
    end component;

    component DECODER
        port(
            ADDRS       : in STD_LOGIC_VECTOR(1 downto 0);
            SEL_HOURS   : out STD_LOGIC;
            SEL_MINUTES : out STD_LOGIC;
            SEL_SECONDS : out STD_LOGIC
        );
    end component;

    -- Internal Signals
    signal SEL_HOURS, SEL_MINUTES, SEL_SECONDS : std_logic;
    signal Seconds_Out, Minutes_Out : std_logic_VECTOR(5 downto 0);
    signal Hours_Out : std_logic_VECTOR(4 downto 0);
    signal Hours_Out_with0 : std_logic_VECTOR(5 downto 0);
    
    signal MS_Seconds, LS_Seconds : STD_LOGIC_VECTOR(3 downto 0);
    signal MS_Minutes, LS_Minutes : STD_LOGIC_VECTOR(3 downto 0);
    signal MS_Hours, LS_Hours     : STD_LOGIC_VECTOR(3 downto 0);
    
    signal Sec_7segment_MS, Sec_7segment_LS : STD_LOGIC_VECTOR(6 downto 0);
    signal Min_7segment_MS, Min_7segment_LS : STD_LOGIC_VECTOR(6 downto 0);
    signal Hours_7segment_MS, Hours_7segment_LS : STD_LOGIC_VECTOR(6 downto 0);
    
    signal frequency : STD_LOGIC_VECTOR(1 downto 0);

begin
    -- Pad hours to 6 bits for generic BCD converter
    Hours_Out_with0 <= '0' & Hours_Out;

    -- Instantiations
    L0: REAL_CLK port map (CLK, RESET, TestMode, SEL_HOURS, SEL_MINUTES, SEL_SECONDS, DATA_IN, LOAD, Seconds_Out, Minutes_Out, Hours_Out);
    L1: BIN_TO_BD port map (Seconds_Out, MS_Seconds, LS_Seconds);
    L2: BIN_TO_BD port map (Minutes_Out, MS_Minutes, LS_Minutes);
    L3: BIN_TO_BD port map (Hours_Out_with0, MS_Hours, LS_Hours);
    
    L4: BINARY_TO_7SEGMENT port map (MS_Seconds, Sec_7segment_MS);
    L5: BINARY_TO_7SEGMENT port map (LS_Seconds, Sec_7segment_LS);
    L6: BINARY_TO_7SEGMENT port map (MS_Minutes, Min_7segment_MS);
    L7: BINARY_TO_7SEGMENT port map (LS_Minutes, Min_7segment_LS);
    
    L8: BINARY_TO_7SEGMENT_SSD port map (MS_Hours, Hours_7segment_MS);
    L9: BINARY_TO_7SEGMENT_SSD port map (LS_Hours, Hours_7segment_LS);
    
    L10: DECODER port map (ADDRS, SEL_HOURS, SEL_MINUTES, SEL_SECONDS);

    -- Multiplexer frequency generator
    process
    begin
        wait until rising_edge(CLK);
        if (RESET = '1') then
            frequency <= (others => '0');
        else
            frequency <= frequency + 1;
        end if;
    end process;

    -- Display Multiplexer for Minutes and Seconds (Basys 3 Onboard Display)
    process(frequency, Sec_7segment_MS, Sec_7segment_LS, Min_7segment_MS, Min_7segment_LS)
    begin
        case frequency is
            when "00" =>
                BASYS_ANODE_OUT <= "0111";
                BASYS_SEGMENTS_OUT <= Min_7segment_MS;
            when "01" =>
                BASYS_ANODE_OUT <= "1011";
                BASYS_SEGMENTS_OUT <= Min_7segment_LS;
            when "10" =>
                BASYS_ANODE_OUT <= "1101";
                BASYS_SEGMENTS_OUT <= Sec_7segment_MS;
            when "11" =>
                BASYS_ANODE_OUT <= "1110";
                BASYS_SEGMENTS_OUT <= Sec_7segment_LS;
            when others =>
                BASYS_ANODE_OUT <= "1111";
                BASYS_SEGMENTS_OUT <= "1111111";
        end case;
    end process;

    -- Display Multiplexer for Hours (External PmodSSD)
    process(frequency(0), Hours_7segment_MS, Hours_7segment_LS)
    begin
        case frequency(0) is
            when '0' =>
                SSD_CATHODE_OUT <= '0';
                SSD_SEGMENTS_OUT <= Hours_7segment_MS;
            when '1' =>
                SSD_CATHODE_OUT <= '1';
                SSD_SEGMENTS_OUT <= Hours_7segment_LS;
            when others =>
                SSD_CATHODE_OUT <= '1';
                SSD_SEGMENTS_OUT <= "1111111";
        end case;
    end process;

end ARC_Top_level;
