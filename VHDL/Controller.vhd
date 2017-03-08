library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity controller is
port(clk : in std_logic;
	 opcode : in std_logic_vector(5 downto 0);
	 ALU1src : out STD_LOGIC;
	 ALU2src : out STD_LOGIC;
	 MemRead : out STD_LOGIC;
	 MemWrite : out STD_LOGIC;
	 RegWrite : out STD_LOGIC;
	 MemToReg : out STD_LOGIC;
	 ALUOp : out STD_LOGIC_VECOTR(4 downto 0);
	 );
	 
end controller;

architecture controller_arch of controller is

begin

process (clk)
begin
	
	case opcode is
	
	-- SLL   PADED BY SIGN EXTEND TO DO
	when x"00" =>
	if(funct == x"00"){
	ALU1src <= '0';
	ALU2src <= '0';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '1';
	MemToReg <= '0';
	ALUOp <= "000017";
	}
	-- DIVIDING 
	else if (funct == x"1a"){
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '1';
	MemToReg <= '0';
	ALUOp <= "000017";
	}
	-- MULTI
	else if (funct == x"18"){
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '1';
	MemToReg <= '0';
	ALUOp <= "000017";
	}
	--SRA
	else if (funct == x"03"){
	ALU1src <= '0';
	ALU2src <= '0';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '1';
	MemToReg <= '0';
	ALUOp <= "000017";
	}
	-- TO DO HIGH
	else if (funct == x"10"){
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '1';
	MemToReg <= '0';
	ALUOp <= "000017";
	}
	--TO DO LOW 
	else if (funct == x"12"){
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '1';
	MemToReg <= '0';
	ALUOp <= "000017";
	}
	
	--ADD
	when x"20" => 
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "00000"; 
	
	--SUB
	when x"22" => 
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "00001"; 
	
	--ADDI
	when x"08" => 
	ALU1src <= '0';
	ALU2src <= '0';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "00002"; 
	
	--MULT  TO DO
	when x"08" => 
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "00003"; 
	
	--DIVIDE TO DO
	when x"08" => 
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "00004"; 
	
	--SLT
	when x"2A" => 
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "00005"; 
	
	--SLTI 
	when x"0A" => 
	ALU1src <= '0';
	ALU2src <= '0';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "00006"; 
	
	--AND
	when x"24" => 
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "00007"; 
	
	--OR 
	when x"25" => 
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "00008"; 
	
	--NOR
	when x"27" => 
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "00009"; 
	
	--XOR
	when x"26" => 
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "00010"; 
	
	--ANDI
	when x"0C" => 
	ALU1src <= '0';
	ALU2src <= '0';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "00011"; 
	
	--ORI
	
	when x"0D" => 
	ALU1src <= '0';
	ALU2src <= '0';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "00012"; 
	
	--XORI
	
	when x"0E" => 
	ALU1src <= '0';
	ALU2src <= '0';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "000013"; 
	
	--HIGH
	when x"08" => 
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "000014"; 
	
	--LOW
	
	
	when x"08" => 
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "000015"; 
	
	
	--LUI
	
	when x"0F" => 
	ALU1src <= '0';
	ALU2src <= '0';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "000016"; 
	
	--SRL PADED BY SIGN EXTEND
	when x"02" => 
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '1';
	MemToReg <= '0';
	ALUOp <= "000018";

	--ADDED AT TOP
	--SRA Paded by sign extend 
	when x"08" => 
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '1';
	MemToReg <= '0';
	ALUOp <= "000019"; 
		
	
	-- LW
	when x"23" => 
	ALU1src <= '0';
	ALU2src <= '0';
	MemRead <= '1';
	MemWrite <= '0';
	RegWrite <= '1';
	MemToReg <= '1';
	ALUOp <= "00020"; 
	
	-- Store 
	
	when x"2b" => 
	ALU1src <= '0';
	ALU2src <= '0';
	MemRead <= '0';
	MemWrite <= '1';
	RegWrite <= '0';
	-- ?
	MemToReg <= '1';
	ALUOp <= "00021"; 
	
	-- BEQ
	when x"04" => 
	ALU1src <= '1';
	ALU2src <= '0';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "000022"; 
	
	--BNE
	
	when x"05" => 
	ALU1src <= '1';
	ALU2src <= '0';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "000023"; 
	
	-- JUMP 
	
	when x"02" => 
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "000024"; 
	
	--JUMP REGISTER
	when x"08" => 
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "000025"; 
	
	
	-- JUMP AND LINK 
	when x"03" => 
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "000026"; 
	
end process;
	
	
end controller_arch;
