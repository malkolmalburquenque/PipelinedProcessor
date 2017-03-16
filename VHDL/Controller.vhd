library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity controller is
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
	 
end controller;

architecture controller_arch of controller is

begin

process (opcode,funct)
begin
	
	case opcode is
	
	-- SLL   PADED BY SIGN EXTEND TO DO   OUTPUT 17
	when "000000" =>
	if funct = "000000" then 
	ALU1src <= '0';
	ALU2src <= '0';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '1';
	MemToReg <= '0';
	ALUOp <= "10001";
	
	-- DIVIDING OUTPUT 4
	elsif funct = "011010" then
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '1';
	MemToReg <= '0';
	ALUOp <= "00100";
	
	-- MULT	OUTPUT 3
	elsif funct = "011000" then
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '1';
	MemToReg <= '0';
	ALUOp <= "00011";
	
	--SRA OUTPUT 18
	elsif funct = "000011" then 
	ALU1src <= '0';
	ALU2src <= '0';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '1';
	MemToReg <= '0';
	ALUOp <= "10010";
	
	-- TO DO HIGH OUTPUT 14
	elsif funct = "001010" then
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '1';
	MemToReg <= '0';
	ALUOp <= "01110";
	
	--TO DO LOW  OUTPUT 15
	elsif funct = "001100" then 
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '1';
	MemToReg <= '0';
	ALUOp <= "01111";
	
	end if;
	
	--ADD	OUTPUT 0
	when "100000" => 
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '1';
	MemToReg <= '0';
	ALUOp <= "00000"; 
	
	--SUB OUTPUT 1
	when "100010" => 
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '1';
	MemToReg <= '0';
	ALUOp <= "00001"; 
	
	--ADDI OUTPUT 2
	when "001000" => 
	ALU1src <= '0';
	ALU2src <= '0';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '1';
	MemToReg <= '0';
	ALUOp <= "00010"; 
		
	--SLT OUTPUT 5
	when "101010" => 
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "00101"; 
	
	--SLTI OUTPUT 6
	when "001010" => 
	ALU1src <= '0';
	ALU2src <= '0';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "00110"; 
	
	--AND OUTPUT 7
	when "100100" => 
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "00111"; 
	
	--OR OUTPUT 8
	when "100101" => 
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "01000"; 
	
	--NOR OUTPUT 9
	when "100111" => 
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "01001"; 
	
	--XOR OUTPUT 10
	when "100110" => 
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "01010"; 
	
	--ANDI OUTPUT 11
	when "001100" => 
	ALU1src <= '0';
	ALU2src <= '0';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "01011"; 
	
	--ORI OUTPUT 12
	
	when "001101" => 
	ALU1src <= '0';
	ALU2src <= '0';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "01100"; 
	
	--XORI OUTPUT 13
	
	when "001110" => 
	ALU1src <= '0';
	ALU2src <= '0';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "01101"; 
	
	--LUI OUTPUT 16
	
	when "001111" => 
	ALU1src <= '0';
	ALU2src <= '0';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "10000"; 
	
	--SRL PADED BY SIGN EXTEND   OUTPUT 18
	when "000010" => 
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '1';
	MemToReg <= '0';
	ALUOp <= "10010";
	
	-- LW OUTPUT 20
	when "100011" => 
	ALU1src <= '0';
	ALU2src <= '0';
	MemRead <= '1';
	MemWrite <= '0';
	RegWrite <= '1';
	MemToReg <= '1';
	ALUOp <= "10100"; 
	
	-- Store  OUTPUT 21
	
	when "101011" => 
	ALU1src <= '0';
	ALU2src <= '0';
	MemRead <= '0';
	MemWrite <= '1';
	RegWrite <= '0';
	-- ?
	MemToReg <= '1';
	ALUOp <= "10101"; 
	
	-- BEQ	OUTPUT 22
	when "000100" => 
	ALU1src <= '1';
	ALU2src <= '0';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "10110"; 
	
	--BNE	OUTPUT 23
	
	when "000101" => 
	ALU1src <= '1';
	ALU2src <= '0';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "10111"; 
	
	-- JUMP OUTPUT 24 
	
	--when "000010" => 
	--ALU1src <= '0';
	--ALU2src <= '1';
	--MemRead <= '0';
	--MemWrite <= '0';
	--RegWrite <= '0';
	--MemToReg <= '0';
	--ALUOp <= "11000"; 
	
	--JUMP REGISTER OUTPUT 25
	--when "000011" => 
	--ALU1src <= '0';
	--ALU2src <= '1';
	--MemRead <= '0';
	--MemWrite <= '0';
	--RegWrite <= '0';
	--MemToReg <= '0';
	--ALUOp <= "11001"; 
	
	-- JUMP AND LINK  OUTPUT 26
	when "000011" => 
	ALU1src <= '0';
	ALU2src <= '1';
	MemRead <= '0';
	MemWrite <= '0';
	RegWrite <= '0';
	MemToReg <= '0';
	ALUOp <= "11010"; 
	
	when others =>
	
	end case;
	
end process;
	
end controller_arch;
