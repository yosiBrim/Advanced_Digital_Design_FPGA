----------------------------------------------------------------------------------
-- Engineers: Yossi Brim, Elad Asbag
-- Module Name: TB_REAL_CLK - Architecture: TB_ART_CLK
-- Description: סביבת בדיקה (Testbench) לאימות פונקציונלי ותנאי קצה בשעון
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.All;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- ישות בדיקה עצמאית ללא פורטים חיצוניים
entity TB_REAL_CLK is 
end TB_REAL_CLK;

architecture TB_ART_CLK of TB_REAL_CLK is
    -- הצהרה על רכיב השעון כיחידה נבדקת (DUT)
    component REAL_CLK 
    port(
        CLK         : in  std_logic;
        RESET       : in  std_logic;
        TestMode    : in  std_logic;
        Seconds_Out : out std_logic_VECTOR(5 downto 0);
        Minutes_Out : out std_logic_VECTOR(5 downto 0);
        Hours_Out   : out std_logic_VECTOR(4 downto 0)
    );
    end component;

    -- קווי אותות פנימיים לחיווט הסימולציה
    signal TB_CLK         : std_logic := '0'; -- אתחול אות השעון לקביעת מצב התחלתי
    signal TB_RESET       : std_logic;        -- אות איפוס לבדיקה
    signal TB_TestMode    : std_logic;        -- קו שליטה במצב מואץ
    signal TB_Seconds_Out : std_logic_VECTOR(5 downto 0);
    signal TB_Minutes_Out : std_logic_VECTOR(5 downto 0);
    signal TB_Hours_Out   : std_logic_VECTOR(4 downto 0);

begin

    ------------------------------------------------------------------------------
    -- חיווט ומיפוי הרכיב הנבדק (DUT Port Mapping)
    ------------------------------------------------------------------------------
    DUT : REAL_CLK
    port map(
        CLK         => TB_CLK,
        RESET       => TB_RESET,
        TestMode    => TB_TestMode,
        Seconds_Out => TB_Seconds_Out,
        Minutes_Out => TB_Minutes_Out,
        Hours_Out   => TB_Hours_Out
    );

    ------------------------------------------------------------------------------
    -- תהליך מחולל שעון: יצירת שעון מערכת ריאלי של 100MHz
    -- זמן מחזור כולל: 10ns (5ns במצב נמוך, 5ns במצב גבוה)
    ------------------------------------------------------------------------------
    Clock_Gen: process
    begin
        wait for 5 ns;
        TB_CLK <= not TB_CLK;
    end process;

    ------------------------------------------------------------------------------
    -- תהליך גירויים (Stimulus Process)
    -- תפקיד: ניהול זמני האיפוס, הפעלת ה-TestMode ומעקב אחר מעברי גבול
    ------------------------------------------------------------------------------
    Stimulus_Proc: process
    begin
        -- שלב א': הפעלת אות איפוס סינכרוני יציב בתחילת הריצה להבטחת תנאי התחלה נקיים
        TB_RESET    <= '1';
        TB_TestMode <= '1'; -- הפעלה קבועה של מצב בדיקה מואץ לקיצור זמני ריצה בסימולטור
        wait for 25 ns;     -- המתנה למספר מחזורי שעון מלאים
        
        -- שלב ב': שחרור אות האיפוס ותחילת ספירה חופשית של השעון
        TB_RESET    <= '0';
        
        -- בשלב זה, מוני הזמן יתחילו להתקדם במהירות. בסביבת הסימולציה בשלב זה (כפי שמתועד בדוח),
        -- נעשה שימוש משלים בפקודות Force ידניות בתוך ModelSim כדי לבדוק ישירות את מעברי הגבול:
        -- 1. מעבר דקה (Seconds = 59 -> 0)
        -- 2. מעבר שעה (Minutes & Seconds = 59 -> 0)
        -- 3. איפוס יום שלם (23:59:59 -> 00:00:00)
        
        wait; -- עצירת תהליך הגירויים ומניעת לולאה אינסופית של אותות האיפוס
    end process;

end TB_ART_CLK;
