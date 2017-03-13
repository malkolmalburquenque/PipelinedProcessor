library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity cpuPipeline_tb is
end cpuPipeline_tb;

architecture cpuPipeline_tb_arch of cpuPipeline_tb is

component cpuPipeline is
port 
(
clk : in std_logic;
reset : in std_logic;
four : INTEGER

);
end component;

constant clk_period : time := 1 ns;
signal clk : std_logic := '0';
signal rst : std_logic := '0';
signal fourInt : INTEGER := 4;

begin 

pipeline : cpuPipeline

port map(
clk => clk,
reset => rst,
four => fourInt
);

		
clk_process : process
    BEGIN
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

test_process : process
    BEGIN
        wait for clk_period;
        report "STARTING SIMULATION \n";
		wait for clk_period;
		wait for clk_period;
		wait for clk_period;
		wait for clk_period;
		wait for clk_period;
		wait for clk_period;
		wait for clk_period;
		wait for clk_period;
		wait;
		
end process;






end cpuPipeline_tb_arch;