LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;
ENTITY bin2seven_eco IS
PORT (bin : IN std_logic_vector (3 DOWNTO 0);
      marche : IN std_logic;
      a, b, c, d, e, f, g : OUT std_logic);
END bin2seven_eco;
ARCHITECTURE rtl OF bin2seven_eco IS
SIGNAL leds : std_logic_vector (6 DOWNTO 0);
SIGNAL leds2 : std_logic_vector (6 DOWNTO 0);
BEGIN



WITH bin SELECT
leds <= "0000001" WHEN "0000",
        "1001111" WHEN "0001",
        "0010010" WHEN "0010",
        "0000110" WHEN "0011",
        "1001100" WHEN "0100",
        "0100100" WHEN "0101",
        "0100000" WHEN "0110",
        "0001111" WHEN "0111",
        "0000000" WHEN "1000",
        "0000100" WHEN "1001",
        "0001000" WHEN "1010",
        "1100000" WHEN "1011",
        "1110010" WHEN "1100",
        "1000010" WHEN "1101",
        "0110000" WHEN "1110",
        "0111000" WHEN "1111";
        

WITH marche SELECT
leds2 <= leds WHEN '1',
         "1111111" WHEN OTHERS;
         
a <= leds2(6);
b <= leds2(5);
c <= leds2(4);
d <= leds2(3);
e <= leds2(2);
f <= leds2(1);
g <= leds2(0);

END rtl;