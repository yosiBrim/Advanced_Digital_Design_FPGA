----------------------------------------------------------------------------------
-- Engineers: Yossi Brim, Elad Asbag
-- Module Name: REAL_CLK - Architecture: ARC_REAL_CLK
-- Description: שעון זמן אמת היררכי מסונכרן בעל מנגנון האצה לסימולציה
-- Target Device: Xilinx Artix-7 (Basys 3)
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.All;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- הגדרת הישות של השעון הראשי כולל ממשקי קלט ובקרת קצב
entity REAL_CLK is 
port(
    CLK         : in  std_logic;                    -- שעון מערכת ראשי בתדר 100MHz
    RESET       : in  std_logic;                    -- אות איפוס סינכרוני פעיל בגבוה
    TestMode    : in  std_logic;                    -- אות ברירה למעבר לקצב סימולציה מואץ
    Seconds_Out : out std_logic_VECTOR(5 downto 0); -- מוצא השניות (טווח 0 עד 59)
    Minutes_Out : out std_logic_VECTOR(5 downto 0); -- מוצא הדקות (טווח 0 עד 59)
    Hours_Out   : out std_logic_VECTOR(4 downto 0)  -- מוצא השעות (טווח 0 עד 23)
);
end REAL_CLK;

architecture ARC_REAL_CLK of REAL_CLK is
    -- הגדרת אוגרים פנימיים לשמירת ערכי הזמן
    signal Q_Seconds   : std_logic_VECTOR(5 downto 0); -- אוגר שניות פנימי
    signal Q_Minutes   : std_logic_VECTOR(5 downto 0); -- אוגר דקות פנימי
    signal Q_Hours     : std_logic_VECTOR(4 downto 0); -- אוגר שעות פנימי
    
    -- אוגר חלוקת תדר רחב (27 ביט) להפקת פולס של שנייה אחת
    signal Q           : std_logic_VECTOR(26 downto 0); 
    
    -- אות בקרת תזמון פנימי המשמש כ-Clock Enable למוני הזמן
    signal TC_TimeBase : std_logic; 
begin

----------------------------------------------------------------------------------
-- תהליך 1: מחולל בסיס הזמן ומנגנון ה-Mux עבור מצב בדיקה
-- תפקיד: חלוקת שעון ה-100MHz והפקת דופק ברוחב מחזור שעון יחיד
----------------------------------------------------------------------------------
TimeBase_Proc: process
begin
    wait until rising_edge(CLK); -- עבודה מסונכרנת לחלוטין לחזית השעון
    
    if (RESET = '1') then -- איפוס סינכרוני של אוגר חלוקת הזמן
        Q <= (others => '0');
        TC_TimeBase <= '0';
        
    elsif (TestMode = '1') then -- מצב סימולציה מואץ (Modulo-10)
        if (Q < 9) then
            Q <= Q + 1;
            TC_TimeBase <= '0';
        else 
            Q <= (others => '0');
            TC_TimeBase <= '1'; -- הפקת דופק בקרה בכל 10 מחזורי שעון
        end if;
        
    else -- מצב עבודה אמיתי בשטח (Modulo-100,000,000)
        if (Q < 99999999) then
            Q <= Q + 1;
            TC_TimeBase <= '0';
        else 
            Q <= (others => '0');
            TC_TimeBase <= '1'; -- הפקת דופק של 1 הרץ (פעם בשנייה אחת)
        end if;
    end if;
end process;

----------------------------------------------------------------------------------
-- תהליך 2: מונה השניות (Modulo-60)
-- תפקיד: קידום ערך השניות בכל פעם שבסיס הזמן מפיק דופק חיובי
----------------------------------------------------------------------------------
The_Seconds: process
begin
    wait until rising_edge(CLK);
    
    if (RESET = '1') then -- איפוס שניות
        Q_Seconds <= (others => '0');
    else
        -- הקידום מותנה בקבלת פולס בסיס הזמן
        if (TC_TimeBase = '1') then 
            if (Q_Seconds < 59) then
                Q_Seconds <= Q_Seconds + 1;
            else
                Q_Seconds <= (others => '0'); -- חזרה ל-0 לאחר 59 שניות
            end if;
        end if;
    end if;
end process;

-- חיבור רציף של האוגר הפנימי לפיני המוצא הפיזיים
Seconds_Out <= Q_Seconds;

----------------------------------------------------------------------------------
-- תהליך 3: מונה הדקות (Modulo-60)
-- תפקיד: קידום הדקות רק כאשר חלפה דקה שלמה (שניות = 59 ובסיס זמן פעיל)
----------------------------------------------------------------------------------
The_Minutes: process
begin
    wait until rising_edge(CLK);
    
    if (RESET = '1') then -- איפוס דקות
        Q_Minutes <= (others => '0');
    else
        -- תנאי קידום משולב סינכרוני למניעת תקלות תזמון
        if ((TC_TimeBase = '1') and (Q_Seconds = 59)) then
            if (Q_Minutes < 59) then
                Q_Minutes <= Q_Minutes + 1;
            else
                Q_Minutes <= (others => '0'); -- חזרה ל-0 לאחר 59 דקות
            end if;
        end if;
    end if;
end process;

-- חיבור רציף של אוגר הדקות למוצא
Minutes_Out <= Q_Minutes;

----------------------------------------------------------------------------------
-- תהליך 4: מונה השעות (Modulo-24)
-- תפקיד: קידום השעות רק בנקודת המעבר של שעה שלמה (שניות=59, דקות=59 ובסיס זמן פעיל)
----------------------------------------------------------------------------------
The_Hours: process
begin
    wait until rising_edge(CLK);
    
    if (RESET = '1') then -- איפוס שעות
        Q_Hours <= (others => '0');
    else
        -- תנאי פתיחה היררכי מלא המוודא הגעה לסוף השעה
        if ((TC_TimeBase = '1') and (Q_Seconds = 59) and (Q_Minutes = 59)) then
            if (Q_Hours < 23) then
                Q_Hours <= Q_Hours + 1;
            else
                Q_Hours <= (others => '0'); -- איפוס המערכת כולה ומעבר יום ב-23:59:59
            end if;
        end if;
    end if;
end process;

-- חיבור רציף של אוגר השעות למוצא המערכת
Hours_Out <= Q_Hours;

end ARC_REAL_CLK;
