LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY signextender IS
    PORT (
        clock: IN STD_LOGIC;
        immediate_in: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        immediate_out: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
END signextender;

ARCHITECTURE Behavioral OF signextender IS

BEGIN

    PROCESS (clock)
        BEGIN
        IF (clock'event AND clock = '1') THEN
            immediate_out(31 downto 16) <= "0000000000000000";
            immediate_out(15 downto 0) <= immediate_in;
        END IF
    END PROCESS

END Behavioral;
