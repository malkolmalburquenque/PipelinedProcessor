library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY alu_tb IS
END alu_tb;

ARCHITECTURE behav of alu_tb IS
	COMPONENT alu IS
		PORT(
			input_a : in STD_LOGIC_VECTOR (31 downto 0);
			input_b : in STD_LOGIC_VECTOR (31 downto 0);
			SEL : in STD_LOGIC_VECTOR (4 downto 0);
			clock : in STD_LOGIC;
			out_alu : out signed(31 downto 0)
		);
	END COMPONENT;

	SIGNAL clock: STD_LOGIC := '0';
	CONSTANT clock_period : time := 1 ns;
	SIGNAL input_a : STD_LOGIC_VECTOR(31 downto 0);
	SIGNAL input_b : STD_LOGIC_VECTOR(31 downto 0);
	SIGNAL sel : STD_LOGIC_VECTOR(4 downto 0);
	SIGNAL out_alu : SIGNED (31 downto 0);

BEGIN
	alutest : alu
	PORT MAP(
		input_a => input_a,
		input_b => input_b,
		SEL => sel,
		out_alu => out_alu,
		clock => clock
	);

	clock_process : PROCESS
	BEGIN
		clock <= '1';
		wait for clock_period/2;
		clock <= '0';
		wait for clock_period/2;
	END PROCESS;

	test_process : PROCESS
	BEGIN
		wait for clock_period;

		-- ADD
		input_a <= "00000000000000000000000000000000";
		input_b <= "00000000000000000000000000000001";
		sel <= "00000";
		wait for clock_period;

		--SUBTRACT
		input_a <= "00000000000000000000000000000001";
		input_b <= "00000000000000000000000000000001";
		sel <= "00001";
		wait for clock_period;



		WAIT;
	END PROCESS;
END behav;
