library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
 
entity alu is
 Port ( input_a : in signed(3 downto 0);
 input_b : in signed(3 downto 0);
 SEL : in STD_LOGIC_VECTOR (2 downto 0);
 out_alu : out signed(3 downto 0));
end alu;
 
architecture Behavioral of alu is
begin
process(input_a, input_b, SEL) 
begin
case SEL is
 when "000" => 
 out_alu<= input_a + input_b; --addition 
 when "001" => 
 out_alu<= input_a - input_b; --subtraction 
 when "010" => 
 out_alu<= input_a - 1; --sub 1 
 when "011" => 
 out_alu<= input_a + 1; --add 1 
 when "100" => 
 out_alu<= input_a and input_b; --AND gate 
 when "101" => 
 out_alu<= input_a or input_b; --OR gate 
 when "110" => 
 out_alu<= not input_a ; --NOT gate 
 when "111" => 
 out_alu<= input_a xor input_b; --XOR gate 
 when others =>
 NULL;
end case; 
  
end process; 
 
end Behavioral;