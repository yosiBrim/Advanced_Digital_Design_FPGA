----------------------------------------------------------------------------------
-- Developer: Yossi Brim
-- 
-- Module Name: Top_level - ARC_Top_level
-- Project Name: Traffic Light Controller (Artix-7)
-- Description: 
--   Structural top-level module that integrates the Time Base, Counters, 
--   and State Machine. It acts as the physical wrapper for the FPGA I/O pins.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.All;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Top_level is 
port(
    CLK            :  in  std_logic; -- 100MHz system clock from Basys 3
    RESET          :  in  std_logic; -- Asynchronous active-high reset
    LIGHT          :  out std_logic_VECTOR(4 downto 0) -- LED outputs for traffic lights
);
end Top_level;

architecture ARC_Top_level of Top_level is

    -- FSM Component Declaration
    component State_machine
        port(
            CLK      : in  std_logic;
            RESET    : in  std_logic;
            ADV      : in  std_logic;
            CE       : in  std_logic;
            SEL      : out std_logic;
            LIGHT    : out std_logic_vector(4 downto 0)
        );
    end component;

    -- Counters Component Declaration
    component Counters 
        port(
            CLK      : in  std_logic;
            RESET    : in  std_logic;
            CE       : in  std_logic;
            SEL      : in  std_logic;
            ADV      : out std_logic
        );
    end component;

    -- Time Base Component Declaration
    component Time_Base  
        port(
            CLK         : in  std_logic;
            RESET       : in  std_logic;
            TC_TimeBase : out std_logic
        );
    end component;
	 
    -- Internal signals for module interconnection
    signal SEL : std_logic; -- Selects between 10s and 2s counter
    signal ADV : std_logic; -- Advance signal from counter to FSM
    signal CE  : std_logic; -- 1Hz Clock Enable from Time Base

begin 

    -- Instantiate the Moore State Machine
    L0 : State_machine  
        port map(
            CLK   => CLK,
            RESET => RESET,
            ADV   => ADV,
            CE    => CE,
            SEL   => SEL,
            LIGHT => LIGHT
        );
	
    -- Instantiate the Timing Counters
    L1 : Counters  
        port map( 
            CLK   => CLK,
            RESET => RESET,
            CE    => CE,
            SEL   => SEL,
            ADV   => ADV
        );
		
    -- Instantiate the 100MHz to 1Hz Clock Divider
    L2 : Time_Base
        port map(
            CLK         => CLK,
            RESET       => RESET,
            TC_TimeBase => CE
        );
	 
end ARC_Top_level;
