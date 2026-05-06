----------------------------------------------------------------------------------
-- Developer: Yossi Brim
-- 
-- Module Name: State_machine - State_machine_ARC
-- Project Name: Traffic Light Controller (Artix-7)
-- Description: 
--   Moore Finite State Machine (FSM) that controls the traffic light sequence.
--   It changes states based on the Advance (ADV) signal and Clock Enable (CE).
--   Outputs depend ONLY on the current state to prevent combinational glitches.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.All;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity State_machine is 
port(
    CLK      : in  std_logic; -- System clock
    RESET    : in  std_logic; -- Asynchronous reset
    ADV      : in  std_logic; -- Advance signal from the selected counter
    CE       : in  std_logic; -- 1Hz clock enable pulse
    SEL      : out std_logic; -- Selects active counter (0 for 10s, 1 for 2s)
    LIGHT    : out std_logic_vector(4 downto 0) -- Traffic light LED sequence
);
end State_machine;

architecture State_machine_ARC of State_machine is
    
    -- State encoding declaration
    type StateType is (S0, S1, S2, S3);
    signal STATE: StateType;

begin
    -- Synchronous state transition and output logic process
    p0: process
    begin
        wait until rising_edge(CLK);
        
        if (RESET = '1') then
            -- Reset to default initial state
            STATE <= S0;
            LIGHT <= "01100";
            SEL   <= '0';
            
        elsif (CE = '1') then
            -- Evaluate state transitions only on the 1Hz enable pulse
            case STATE is
                
                when S0 => 
                    if (ADV = '1') then
                        STATE <= S1;
                        LIGHT <= "10110";
                        SEL   <= '1'; -- Switch to 2-second counter for transition
                    else 
                        STATE <= S0;
                        LIGHT <= "01100";
                        SEL   <= '0';
                    end if;
					
                when S1 => 
                    if (ADV = '1') then
                        STATE <= S2;
                        LIGHT <= "10001";
                        SEL   <= '0'; -- Switch to 10-second counter for main state
                    else 
                        STATE <= S1;
                        LIGHT <= "10110";
                        SEL   <= '1';
                    end if;
					
                when S2 => 
                    if (ADV = '1') then
                        STATE <= S3;
                        LIGHT <= "10010";
                        SEL   <= '1'; -- Switch to 2-second counter for transition
                    else 
                        STATE <= S2;
                        LIGHT <= "10001";
                        SEL   <= '0';
                    end if;
					
                when S3 => 
                    if (ADV = '1') then
                        STATE <= S0;
                        LIGHT <= "01100";
                        SEL   <= '0'; -- Switch to 10-second counter for main state
                    else 
                        STATE <= S3;
                        LIGHT <= "10010";
                        SEL   <= '1';
                    end if;	
                    
            end case;
        end if;
    end process;
end State_machine_ARC;
