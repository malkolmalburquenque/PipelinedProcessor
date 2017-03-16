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

component register_file is

PORT(
		
		clock: IN STD_LOGIC;
		rs: IN STD_LOGIC_VECTOR (4 downto 0);
		rt: IN STD_LOGIC_VECTOR (4 downto 0);
		write_enable: IN STD_LOGIC; 
		rd: IN STD_LOGIC_VECTOR (4 downto 0);
		rd_data: IN STD_LOGIC_VECTOR (31 downto 0); 

		ra_data: OUT STD_LOGIC_VECTOR (31 downto 0);
		rb_data: OUT STD_LOGIC_VECTOR (31 downto 0) 
	);

end component;


component signextender is 
	PORT (
        clock: IN STD_LOGIC;
        immediate_in: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        immediate_out: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
end component;
	
component mux is
port(
	 input0 : in std_logic_vector(31 downto 0);
	 input1 : in std_logic_vector(31 downto 0);
	 selectInput : in std_logic;
	 selectOutput : out std_logic_vector(31 downto 0)
	 );
	 	
	
end component;

component alu is
 Port ( input_a : in STD_LOGIC_VECTOR (31 downto 0);
 input_b : in STD_LOGIC_VECTOR (31 downto 0);
 SEL : in STD_LOGIC_VECTOR (4 downto 0);
 out_alu : out STD_LOGIC_VECTOR(31 downto 0));
end component;
 


-- TEST SIGNALS 
signal muxInput : STD_LOGIC_VECTOR(31 downto 0) := "00000000000000000000000000000000";
signal selectInput : std_logic := '1';
signal fourInt : INTEGER := 4;

-- PIPELINE IFID
--address goes to both IFID and IDEX
signal address : std_logic_vector(31 downto 0);
signal instruction : std_logic_vector(31 downto 0);
signal IFIDaddress : std_logic_vector(31 downto 0);
signal IFIDinstruction : std_logic_vector(31 downto 0);

--PIPELINE IDEX

signal IDEXaddress : std_logic_vector(31 downto 0);
signal IDEXra : std_logic_vector(31 downto 0);
signal IDEXrb : std_logic_vector(31 downto 0);
signal IDEXimmediate : std_logic_vector(31 downto 0);
signal IDEXrd : std_logic_vector (4 downto 0);


-- SIGNALS FOR CONTROLLER
signal opcodeInput,functInput : std_logic_vector(5 downto 0);
signal ALU1srcO,ALU2srcO,MemReadO,MemWriteO,RegWriteO,MemToRegO : std_logic;
signal ALUOp : std_logic_vector(4 downto 0);

-- SIGNALS FOR REGISTERS
signal rs,rt,rd : std_logic_vector (4 downto 0);
signal rd_data: std_logic_vector(31 downto 0);
signal write_enable : std_logic;
signal ra,rb : std_logic_vector(31 downto 0);
signal shamnt : std_logic_vector(4 downto 0);

signal immediate : std_logic_vector(15 downto 0); 
signal immediate_out : std_logic_vector(31 downto 0);

-- SIGNALS FOR EXECUTE STAGE MUXES 
signal muxOutput1 : std_logic_vector(31 downto 0);
signal muxOutput2 : std_logic_vector(31 downto 0);
signal aluOutput : std_logic_vector(31 downto 0);

-- SIGNALS FOR EXMEM
signal EXMEMBranch : std_logic; -- need the zero variable 
signal EXMEMaluOutput : std_logic_vector(31 downto 0);
signal EXMEMregisterOutput : std_logic_vector(31 downto 0);
signal EXMEMrd : std_logic_vector(4 downto 0);


begin

IFS : instructionFetchStage
port map(
	clk => clk,
	muxInput0 => EXMEMaluOutput,
	selectInputs => selectInput,
	four => fourInt,
	selectOutput => address,
	instructionMemoryOutput => instruction
);
-- DECODE STAGE 
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
	ALUOp => ALUOp 
);

RegisterFile : register_file
port map (
	clock => clk,
	rs => rs,
	rt => rt,
	write_enable => write_enable,
	rd => rd,
	rd_data => rd_data,
	ra_data => ra,
	rb_data => rb
);

se : signextender
port map(
clock => clk,
immediate_in => immediate,
immediate_out => immediate_out
);

-- EXECUTE STAGE 
exMux1 : mux 
port map (
input0 => IDEXra,
input1 => IDEXaddress,
selectInput => ALU1srcO,
selectOutput => muxOutput1
);

exMux2 : mux 
port map (
input0 => IDEXimmediate,
input1 => IDEXrb,
selectInput => ALU2srcO,
selectOutput => muxOutput2
);

operator : alu 
port map( 
input_a => muxOutput1,
input_b => muxOutput2,
SEL => ALUOp,
out_alu => aluOutput
);

process (clk)
begin

if (clk'event and clk = '1') then
--PIPELINED VALUE 
--IFID 
IFIDaddress <= address;
IFIDinstruction <= instruction;

-- IDEX
IDEXaddress <= IFIDaddress;
IDEXra <= ra;
IDEXrb <= rb;
IDEXimmediate <= immediate_out;



--EXMEM 
--EXMEMBranch <= 
EXMEMaluOutput <= aluOutput;
EXMEMregisterOutput <= IDEXrb;
EXMEMrd <= IDEXrd;

end if ;
end process;

-- controller values
opcodeInput <= IFIDinstruction(31 downto 26);
functInput <= IFIDinstruction(5 downto 0);
-- register values
rs <= IFIDinstruction(25 downto 21);
rt <= IFIDinstruction(20 downto 16);
rd <= IFIDinstruction(15 downto 11);
shamnt <= IFIDinstruction(10 downto 6);
-- EXTENDED
immediate <= IFIDinstruction(15 downto 0);
IDEXrd <= rd;
-- MIGHT NEED TO PUT WRITE ENABLE HERE LATER 
-- AND JUMP ADDRESS HERE 



end cpuPipeline_arch;