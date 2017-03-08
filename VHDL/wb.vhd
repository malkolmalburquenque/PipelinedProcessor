library ieee;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity wb is
port (alu_in : in std_logic_vector (31 downto 0);
	optype : in std_logic ;
	mem_in: in std_logic (31 downto 0);
	mux_out : out std_logic_vector (31 downto 0);
	write_addr_out: out std_logic_vector (7 downto 0);
	write_enabled: out std_logic;
  );
end pipeline;

architecture behavioral of wb is

begin

write_addr_out <= write_addr_in;

case optype is
	--ALU
	when "0" => 
		mux_out <= alu_in;
		write_enabled <= '1';
	--LOAD
	when "1" => 
		mux_out <= mem_in;
		write_enabled <= '1';
	when others => 
		mux_out <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
		write_enabled <= '0';
end case;

end behavioral;