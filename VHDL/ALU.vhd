library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
 
entity alu is
 Port ( input_a : in STD_LOGIC_VECTOR (31 downto 0);
 input_b : in STD_LOGIC_VECTOR (31 downto 0);
 SEL : in STD_LOGIC_VECTOR (4 downto 0);
 out_alu : out signed(31 downto 0));
end alu;
 
architecture Behavioral of alu is
begin
process(input_a, input_b, SEL) 
begin
case SEL is
 when "00000" => 
 out_alu<= input_a + input_b; --addition 
 when "00001" => 
 out_alu<= input_a - input_b; --subtraction 
 when "00010" => 
 out_alu<= input_a - 1; --sub 1 
 when "00011" => 
 out_alu<= input_a + 1; --add 1 
 when "00100" => 
 out_alu<= input_a and input_b; --AND gate 
 when "00101" => 
 out_alu<= input_a or input_b; --OR gate 
 when "00110" => 
 out_alu<= not input_a ; --NOT gate 
 when "00111" => 
 out_alu<= input_a xor input_b; --XOR gate 
 when "01000" =>
 when "01001" => 
 when "01010" =>
 when "01011" =>
 when "01100" =>
 when "01101" =>
 when "01110" =>
 when "01111" =>
 when "10000" =>
 when "10001" =>
 when "10010" =>
 when "10011" =>
 when "10100" =>
 when "10101" =>
 when "10110" =>
 when "10111" =>
 when "11000" =>
 when "11001" =>
 when "11010" =>
 when others =>
 NULL;
end case; 
  
end process; 
 
end Behavioral;