----------------------------------------------------------------------------------
-- Engineers: Yossi Brim, Elad Asbag
-- Module Name: Top_level - Structural Architecture
-- Description: Top level connecting RTC core to internal and external SSDs.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Top_level is
    Port ( 
        CLK                : in  STD_LOGIC;
        RESET              : in  STD_LOGIC;
        TestMode           : in  STD_LOGIC;
        BASYS_ANODE_OUT    : out STD_LOGIC_VECTOR (3 downto 0);
        BASYS_SEGMENTS_OUT : out STD_LOGIC_VECTOR (6 downto 0);
        SSD_CATHODE_OUT    : out STD_LOGIC;
        SSD_SEGMENTS_OUT   : out STD_LOGIC_VECTOR (6 downto 0)
    );
end Top_level;

architecture ARC_Top_level of Top_level is

    -- Component Declarations
    component REAL_CLK
        port(
            CLK : in std_logic; RESET : in std_logic; TestMode : in std_logic;
            Seconds_Out, Minutes_Out : out std_logic_VECTOR(5 downto 0);
            Hours_Out : out std_logic_VECTOR(4 downto 0)
        );
    end component;

    component BIN_TO_BCD
        port(Binary_In : in STD_LOGIC_VECTOR(5 downto 0); Tens, Units : out STD_LOGIC_VECTOR(3 downto 0));
    end component;

    component BINARY_TO_SEGMENT
        port(BCD_In : in STD_LOGIC_VECTOR(3 downto 0); Segments : out STD_LOGIC_VECTOR(6 downto 0));
    end component;

    -- Internal Signals
    signal Sec_bin, Min_bin : STD_LOGIC_VECTOR(5 downto 0);
    signal Hour_bin         : STD_LOGIC_VECTOR(4 downto 0);
    signal Hour_bin_ext     : STD_LOGIC_VECTOR(5 downto 0);
    
    signal Sec_T, Sec_U, Min_T, Min_U, Hour_T, Hour_U : STD_LOGIC_VECTOR(3 downto 0);
    signal Seg_Sec_T, Seg_Sec_U, Seg_Min_T, Seg_Min_U, Seg_Hour_T, Seg_Hour_U : STD_LOGIC_VECTOR(6 downto 0);
    
    signal Mux_Clk_Div : STD_LOGIC_VECTOR(17 downto 0) := (others => '0');
    signal Display_Mux : STD_LOGIC_VECTOR(1 downto 0);

begin
    Hour_bin_ext <= '0' & Hour_bin;

    -- Instantiations
    U_CLK : REAL_CLK port map (CLK => CLK, RESET => RESET, TestMode => TestMode, Seconds_Out => Sec_bin, Minutes_Out => Min_bin, Hours_Out => Hour_bin);
    
    BCD_SEC : BIN_TO_BCD port map (Binary_In => Sec_bin, Tens => Sec_T, Units => Sec_U);
    BCD_MIN : BIN_TO_BCD port map (Binary_In => Min_bin, Tens => Min_T, Units => Min_U);
    BCD_HR  : BIN_TO_BCD port map (Binary_In => Hour_bin_ext, Tens => Hour_T, Units => Hour_U);
    
    DEC_SEC_T : BINARY_TO_SEGMENT port map (BCD_In => Sec_T, Segments => Seg_Sec_T);
    DEC_SEC_U : BINARY_TO_SEGMENT port map (BCD_In => Sec_U, Segments => Seg_Sec_U);
    DEC_MIN_T : BINARY_TO_SEGMENT port map (BCD_In => Min_T, Segments => Seg_Min_T);
    DEC_MIN_U : BINARY_TO_SEGMENT port map (BCD_In => Min_U, Segments => Seg_Min_U);
    DEC_HR_T  : BINARY_TO_SEGMENT port map (BCD_In => Hour_T, Segments => Seg_Hour_T);
    DEC_HR_U  : BINARY_TO_SEGMENT port map (BCD_In => Hour_U, Segments => Seg_Hour_U);

    -- Clock Divider for Display Scanning (approx. 400Hz)
    process(CLK)
    begin
        if rising_edge(CLK) then
            Mux_Clk_Div <= Mux_Clk_Div + 1;
        end if;
    end process;
    Display_Mux <= Mux_Clk_Div(17 downto 16);

    -- Onboard Display Multiplexing (Hours and Minutes)
    process(Display_Mux, Seg_Hour_T, Seg_Hour_U, Seg_Min_T, Seg_Min_U)
    begin
        case Display_Mux is
            when "00" => 
                BASYS_ANODE_OUT    <= "0111"; 
                BASYS_SEGMENTS_OUT <= Seg_Hour_T;
            when "01" => 
                BASYS_ANODE_OUT    <= "1011"; 
                BASYS_SEGMENTS_OUT <= Seg_Hour_U;
            when "10" => 
                BASYS_ANODE_OUT    <= "1101"; 
                BASYS_SEGMENTS_OUT <= Seg_Min_T;
            when "11" => 
                BASYS_ANODE_OUT    <= "1110"; 
                BASYS_SEGMENTS_OUT <= Seg_Min_U;
            when others => 
                BASYS_ANODE_OUT    <= "1111";
                BASYS_SEGMENTS_OUT <= "1111111";
        end case;
    end process;

    -- External PMOD Display Multiplexing (Seconds)
    process(Mux_Clk_Div(15), Seg_Sec_T, Seg_Sec_U)
    begin
        if Mux_Clk_Div(15) = '0' then
            SSD_CATHODE_OUT  <= '0'; -- Select Left Digit (Tens)
            SSD_SEGMENTS_OUT <= Seg_Sec_T;
        else
            SSD_CATHODE_OUT  <= '1'; -- Select Right Digit (Units)
            SSD_SEGMENTS_OUT <= Seg_Sec_U;
        end if;
    end process;

end ARC_Top_level;
