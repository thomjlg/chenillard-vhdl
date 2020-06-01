LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;
ENTITY bin2seven_key_final IS
PORT (key : IN std_logic_vector (3 DOWNTO 0);
      a, b, c, d, e, f, g : OUT std_logic);
END bin2seven_key_final;
ARCHITECTURE rtl OF bin2seven_key_final IS

SIGNAL leds : std_logic_vector (6 DOWNTO 0);
SIGNAL bin_int : std_logic_vector (3 DOWNTO 0);
SIGNAL eco_int : std_logic;

COMPONENT bin2seven_eco
PORT(
     bin                 : IN std_logic_vector (3 DOWNTO 0);
     marche                 : IN std_logic;
     a, b, c, d, e, f, g : OUT std_logic
     );
END COMPONENT;

BEGIN

--WITH key SELECT
--bin_int <= "1110" WHEN "0000",--E--
--          "1110" WHEN "0001",--E--
--           "1110" WHEN "0010",--E--
--           "1110" WHEN "0011",--E--
--           "1110" WHEN "0100",--E--
--           "1110" WHEN "0101",--E--
--           "1110" WHEN "0110",--E--
--           "0011" WHEN "0111",--3--
--           "1110" WHEN "1000",--E--
--           "1110" WHEN "1001",--E--
--           "1110" WHEN "1010",--E--
--           "0010" WHEN "1011",--2--
--           "1110" WHEN "1100",--E--
--           "0001" WHEN "1101",--1--
--          "0000" WHEN "1110",--0--
--           "1111" WHEN "1111";
           
WITH key SELECT
	bin_int <= "0000" WHEN "1110",--0--
				 "0001" WHEN "1101",--1--
				 "0010" WHEN "1011",--2--
				 "0011" WHEN "0111",--3--
				 "1110" WHEN OTHERS;

WITH key SELECT 
eco_int <= '0' WHEN "1111",
           '1' WHEN OTHERS;

U1 : bin2seven_eco PORT MAP( bin => bin_int,
                             marche => eco_int,
                             a => a,
                             b => b,
                             c => c,
                             d => d,
                             e => e,
                             f => f,
                             g => g);


END rtl;