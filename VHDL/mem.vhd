library ieee;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity mem is
port (ctrl_write : in std_logic;
	ctrl_read: in std_logic;
	ctrl_memtoreg_in: in std_logic;
	ctrl_memtoreg_out: out std_logic;
	ctrl_regwrite_in: in std_logic;
	ctrl_regwrite_out: out std_logic;
	alu_in : in std_logic_vector (31 downto 0);
	mem_data_in: in std_logic_vector (31 downto 0);
	mem_data_out: out std_logic (31 downto 0);
	write_addr_in: in std_logic_vector (7 downto 0);
	write_addr_out: out std_logic_vector (7 downto 0);
  );
end pipeline;

architecture behavioral of mem is

COMPONENT memory IS
        GENERIC(
            ram_size : INTEGER := 8192;
            mem_delay : time := 10 ns;
            clock_period : time := 1 ns
        );
        PORT (
            clock: IN STD_LOGIC;
            writedata: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            address: IN INTEGER RANGE 0 TO ram_size-1;
            memwrite: IN STD_LOGIC := '0';
            memread: IN STD_LOGIC := '0';
            readdata: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
            waitrequest: OUT STD_LOGIC
        );
    END COMPONENT;

signal mem_data_next: std_logic_vector (31 downto 0);
signal write_addr_next: std_logic_vector (7 downto 0);
signal ctrl_memtoreg_next, ctrl_regwrite_next: std_logic;
			
begin
process (clk)
begin
	if (clk'event and clk = '1') then
	write_addr_out <= write_addr_next;
	ctrl_regwrite_out <= ctrl_memtoreg_next;
	mem_data_out <= mem_data_next;
	ctrl_memtoreg_out <= ctrl_memtoreg_next;
	memwrite <= '0';
	memread <= '0';
	end if;
end process;

write_addr_next <= write_addr_in;
ctrl_memtoreg_next <= ctrl_memtoreg_in;
ctrl_regwrite_next <= ctrl_regwrite_in;
alu_next <= alu_in;

--Assume fast enough
address <= alu_in;
	
--IF STORE
if (ctrl_write == "1"){
	memwrite <= '1';
	writedata <= mem_data_in;
}
--IF LOAD
else if (ctrl_read == "1"){
	memread <= '1'
	mem_next <= readdata
}


end behavioral;