library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity cpuPipeline is
port 
(
clk : in std_logic;
reset : in std_logic;
four : INTEGER

);

end cpuPipeline;

architecture cpuPipeline_arch of cpuPipeline is

component instructionFetchStage IS
	port(
		clk : in std_logic;
		muxInput0 : in std_logic_vector(31 downto 0);
		selectInputs : in std_logic;
		four : in INTEGER;
		
		selectOutput : out std_logic_vector(31 downto 0);
		instructionMemoryOutput : out std_logic_vector(31 downto 0)
		);
		
	end component;
		
component controller is
	port(clk : in std_logic;
		 opcode : in std_logic_vector(5 downto 0);
		 funct : in std_logic_vector(5 downto 0);
		 ALU1src : out STD_LOGIC;
		 ALU2src : out STD_LOGIC;
		 MemRead : out STD_LOGIC;
		 MemWrite : out STD_LOGIC;
		 RegWrite : out STD_LOGIC;
		 MemToReg : out STD_LOGIC;
		 ALUOp : out STD_LOGIC_VECTOR(4 downto 0)
		 );
end component;

-- TEST SIGNALS 
signal muxInput : STD_LOGIC_VECTOR(31 downto 0) := "00000000000000000000000000000000";
signal selectInput : std_logic := '1';
signal fourInt : INTEGER := 4;

signal IFIDaddress : std_logic_vector(31 downto 0);
signal IFIDinstruction : std_logic_vector(31 downto 0);

signal address : std_logic_vector(31 downto 0);
signal instruction : std_logic_vector(31 downto 0);


signal opcodeInput,functInput : std_logic_vector(5 downto 0);
signal ALU1srcO,ALU2srcO,MemReadO,MemWriteO,RegWriteO,MemToRegO : std_logic;
signal output : std_logic_vector(4 downto 0);

begin

IFS : instructionFetchStage
port map(
	clk => clk,
	muxInput0 => muxInput,
	selectInputs => selectInput,
	four => fourInt,
	selectOutput => address,
	instructionMemoryOutput => instruction
);

CT : controller 
port map(
	clk => clk,
	opcode => opcodeInput, 
	funct => functInput,
	ALU1src => ALU1srcO,
	ALU2src => ALU2srcO,
	MemRead => MemReadO,
	MemWrite => MemWriteO,
	RegWrite => RegWriteO,
	MemToReg => MemToRegO,
	ALUOp => output 
);

process (clk)
begin

if (clk'event and clk = '1') then
IFIDaddress <= address;
IFIDinstruction <= instruction;
end if;

end process;

opcodeInput <= IFIDinstruction(31 downto 26);
functInput <= IFIDinstruction(5 downto 0);





end cpuPipeline_arch;