library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
 
entity alu is
 Port ( input_a : in STD_LOGIC_VECTOR (31 downto 0);
 input_b : in STD_LOGIC_VECTOR (31 downto 0);
 SEL : in STD_LOGIC_VECTOR (4 downto 0);
 out_alu : out STD_LOGIC_VECTOR(31 downto 0));
end alu;
 
architecture Behavioral of alu is

signal shift : std_logic_vector (31 downto 0);

begin
process(input_a, input_b, SEL) 	
begin
case SEL is
 
 when "00000" =>
 out_alu<= std_logic_vector(to_unsigned(to_integer (unsigned(input_a)) +   to_integer (unsigned(input_b)), out_alu'length)) ; --ADD
 
 when "00001" => 
 out_alu<= std_logic_vector(to_unsigned(to_integer (unsigned(input_a)) -   to_integer (unsigned(input_b)), out_alu'length)); --SUB 
 
 when "00010" => 
 
 when "00011" => 
 out_alu<= std_logic_vector(to_unsigned(to_integer (unsigned(input_a)) *   to_integer (unsigned(input_b)), out_alu'length)); --MULT
 
 when "00100" =>  
 out_alu<= std_logic_vector(to_unsigned(to_integer (unsigned(input_a)) /   to_integer (unsigned(input_b)), out_alu'length));   --DIV

 when "00101" =>  
 if (input_a < input_b) then  --SLT
	out_alu <= x"00000001";
	else
	out_alu <= x"00000001";
 end if;
 
 when "00110" => 

 when "00111" => 
 out_alu<= input_a and input_b; --AND

 when "01000" =>
 out_alu<= input_a or input_b; --OR

 when "01001" => 
 out_alu<= input_a nor input_b; --NOR
 
 when "01010" =>
 out_alu<= input_a xor input_b; --XOR 

 when "01011" =>
 
 when "01100" =>

 when "01101" =>
 
 when "01110" =>

 when "01111" =>
 
 when "10000" =>
 
 when "10001" =>
	out_alu <= input_a ((31 - to_integer(unsigned(input_b(10 downto 6)))) downto 0)  & std_logic_vector(to_unsigned(0, to_integer(unsigned(input_b(10 downto 6)))));

 
 when "10010" =>
	out_alu <= std_logic_vector(to_unsigned(0, to_integer(unsigned(input_b(10 downto 6))))) & input_a (31 downto (0 + to_integer(unsigned(input_b(10 downto 6)))));
	
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