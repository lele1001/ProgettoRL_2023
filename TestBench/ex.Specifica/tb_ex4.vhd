
-- TB EXAMPLE PFRL 2022-2023

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;
USE std.textio.ALL;

ENTITY tb_ex4 IS
END tb_ex4;

ARCHITECTURE tb_ex4 OF tb_ex4 IS
    CONSTANT CLOCK_PERIOD : TIME := 100 ns;
    SIGNAL tb_done : STD_LOGIC;
    SIGNAL mem_address : STD_LOGIC_VECTOR (15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL tb_rst : STD_LOGIC := '0';
    SIGNAL tb_start : STD_LOGIC := '0';
    SIGNAL tb_clk : STD_LOGIC := '0';
    SIGNAL mem_o_data, mem_i_data : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL enable_wire : STD_LOGIC;
    SIGNAL mem_we : STD_LOGIC;
    SIGNAL tb_z0, tb_z1, tb_z2, tb_z3 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL tb_w : STD_LOGIC;

    CONSTANT SCENARIOLENGTH : INTEGER := 568; 
    SIGNAL scenario_rst : unsigned(0 TO SCENARIOLENGTH - 1)     := "00110" & "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    SIGNAL scenario_start : unsigned(0 TO SCENARIOLENGTH - 1)   := "00000" & "111111111111" & "00000000000000000000" & "111111111111111111" & "00000000000000000000" & "11111111111111111" & "00000000000000000000" & "111111111111111111" & "00000000000000000000" & "11111111111111111" & "00000000000000000000" & "111111111111111111" & "00000000000000000000" & "11111111111111111" & "00000000000000000000" & "11111111111111111" & "00000000000000000000" & "111111111111111" & "00000000000000000000" & "111111111111111111" & "00000000000000000000" & "1111111111111111" & "00000000000000000000" & "111111111111111" & "00000000000000000000" & "111111111111111111" & "00000000000000000000" & "1111111111111111" & "00000000000000000000" & "11111111111111" & "00000000000000000000" & "11111111111111111";
    SIGNAL scenario_w : unsigned(0 TO SCENARIOLENGTH - 1)       := "00000" & "111111101000" & "00000000000000000000" & "011010001011100101" & "00000000000000000000" & "00101110010100100" & "00000000000000000000" & "111000111011101101" & "00000000000000000000" & "10110011000010110" & "00000000000000000000" & "011111000101110111" & "00000000000000000000" & "11101011010000000" & "00000000000000000000" & "10111111000001001" & "00000000000000000000" & "101010110000101" & "00000000000000000000" & "111100110001000010" & "00000000000000000000" & "1011101011001101" & "00000000000000000000" & "101011100001111" & "00000000000000000000" & "001011011100111110" & "00000000000000000000" & "1111101110001001" & "00000000000000000000" & "10100111111101" & "00000000000000000000" & "01100011000110000" ;
    -- Channel 2 -> MEM[1] -> 162
    -- Channel 1 -> MEM[2] -> 75

    TYPE ram_type IS ARRAY (65535 DOWNTO 0) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL RAM : ram_type := (  
                                1000 => STD_LOGIC_VECTOR(to_unsigned(41, 8)),
                                41701 => STD_LOGIC_VECTOR(to_unsigned(29, 8)),
                                23716 => STD_LOGIC_VECTOR(to_unsigned(57, 8)),
                                36589 => STD_LOGIC_VECTOR(to_unsigned(26, 8)),
                                26134 => STD_LOGIC_VECTOR(to_unsigned(21, 8)),
                                61815 => STD_LOGIC_VECTOR(to_unsigned(7, 8)),
                                22144 => STD_LOGIC_VECTOR(to_unsigned(39, 8)),
                                32265 => STD_LOGIC_VECTOR(to_unsigned(233, 8)),
                                5509 => STD_LOGIC_VECTOR(to_unsigned(124, 8)),
                                52290 => STD_LOGIC_VECTOR(to_unsigned(5, 8)),
                                15053 => STD_LOGIC_VECTOR(to_unsigned(143, 8)),
                                5903 => STD_LOGIC_VECTOR(to_unsigned(188, 8)),
                                46910 => STD_LOGIC_VECTOR(to_unsigned(202, 8)),
                                15241 => STD_LOGIC_VECTOR(to_unsigned(254, 8)),
                                2557 => STD_LOGIC_VECTOR(to_unsigned(251, 8)),
                                17968 => STD_LOGIC_VECTOR(to_unsigned(130, 8)),
                                OTHERS => "00000000"-- (OTHERS => '0')
                            );
                    
    COMPONENT project_reti_logiche IS
        PORT (
            i_clk : IN STD_LOGIC;
            i_rst : IN STD_LOGIC;
            i_start : IN STD_LOGIC;
            i_w : IN STD_LOGIC;

            o_z0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            o_z1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            o_z2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            o_z3 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            o_done : OUT STD_LOGIC;

            o_mem_addr : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            i_mem_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            o_mem_we : OUT STD_LOGIC;
            o_mem_en : OUT STD_LOGIC
        );
    END COMPONENT project_reti_logiche;

BEGIN
    UUT : project_reti_logiche
    PORT MAP(
        i_clk => tb_clk,
        i_start => tb_start,
        i_rst => tb_rst,
        i_w => tb_w,

        o_z0 => tb_z0,
        o_z1 => tb_z1,
        o_z2 => tb_z2,
        o_z3 => tb_z3,
        o_done => tb_done,

        o_mem_addr => mem_address,
        o_mem_en => enable_wire,
        o_mem_we => mem_we,
        i_mem_data => mem_o_data
    );


    -- Process for the clock generation
    CLK_GEN : PROCESS IS
    BEGIN
        WAIT FOR CLOCK_PERIOD/2;
        tb_clk <= NOT tb_clk;
    END PROCESS CLK_GEN;


    -- Process related to the memory
    MEM : PROCESS (tb_clk)
    BEGIN
        IF tb_clk'event AND tb_clk = '1' THEN
            IF enable_wire = '1' THEN
                IF mem_we = '1' THEN
                    RAM(conv_integer(mem_address)) <= mem_i_data;
                    mem_o_data <= mem_i_data AFTER 1 ns;
                ELSE
                    mem_o_data <= RAM(conv_integer(mem_address)) AFTER 1 ns; 
                END IF;
            END IF;
        END IF;
    END PROCESS;
    
    -- This process provides the correct scenario on the signal controlled by the TB
    createScenario : PROCESS (tb_clk)
    BEGIN
        IF tb_clk'event AND tb_clk = '0' THEN
            tb_rst <= scenario_rst(0);
            tb_w <= scenario_w(0);
            tb_start <= scenario_start(0);
            scenario_rst <= scenario_rst(1 TO SCENARIOLENGTH - 1) & '0';
            scenario_w <= scenario_w(1 TO SCENARIOLENGTH - 1) & '0';
            scenario_start <= scenario_start(1 TO SCENARIOLENGTH - 1) & '0';
        END IF;
    END PROCESS;

    -- Process without sensitivity list designed to test the actual component.
    testRoutine : PROCESS IS
    BEGIN
        mem_i_data <= "00000000";


        WAIT UNTIL tb_start = '1';
        WAIT UNTIL tb_done = '1'; WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = "00000000" REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = "00000000" REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = "00000000" REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = STD_LOGIC_VECTOR(to_unsigned(41,8)) REPORT "TEST FALLITO" severity failure;

        WAIT UNTIL tb_start = '1';
        WAIT UNTIL tb_done = '1'; WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = "00000000" REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = STD_LOGIC_VECTOR(to_unsigned(29,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = "00000000" REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = STD_LOGIC_VECTOR(to_unsigned(41,8)) REPORT "TEST FALLITO" severity failure;

        WAIT UNTIL tb_start = '1';
        WAIT UNTIL tb_done = '1'; WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = STD_LOGIC_VECTOR(to_unsigned(57,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = STD_LOGIC_VECTOR(to_unsigned(29,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = "00000000" REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = STD_LOGIC_VECTOR(to_unsigned(41,8)) REPORT "TEST FALLITO" severity failure;

        WAIT UNTIL tb_start = '1';
        WAIT UNTIL tb_done = '1'; WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = STD_LOGIC_VECTOR(to_unsigned(57,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = STD_LOGIC_VECTOR(to_unsigned(29,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = "00000000" REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = STD_LOGIC_VECTOR(to_unsigned(26,8)) REPORT "TEST FALLITO" severity failure;

        WAIT UNTIL tb_start = '1';
        WAIT UNTIL tb_done = '1'; WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = STD_LOGIC_VECTOR(to_unsigned(57,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = STD_LOGIC_VECTOR(to_unsigned(29,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = STD_LOGIC_VECTOR(to_unsigned(21,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = STD_LOGIC_VECTOR(to_unsigned(26,8)) REPORT "TEST FALLITO" severity failure;

        WAIT UNTIL tb_start = '1';
        WAIT UNTIL tb_done = '1'; WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = STD_LOGIC_VECTOR(to_unsigned(57,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = STD_LOGIC_VECTOR(to_unsigned(7,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = STD_LOGIC_VECTOR(to_unsigned(21,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = STD_LOGIC_VECTOR(to_unsigned(26,8)) REPORT "TEST FALLITO" severity failure;

        WAIT UNTIL tb_start = '1';
        WAIT UNTIL tb_done = '1'; WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = STD_LOGIC_VECTOR(to_unsigned(57,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = STD_LOGIC_VECTOR(to_unsigned(7,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = STD_LOGIC_VECTOR(to_unsigned(21,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = STD_LOGIC_VECTOR(to_unsigned(39,8)) REPORT "TEST FALLITO" severity failure;

        WAIT UNTIL tb_start = '1';
        WAIT UNTIL tb_done = '1'; WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = STD_LOGIC_VECTOR(to_unsigned(57,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = STD_LOGIC_VECTOR(to_unsigned(7,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = STD_LOGIC_VECTOR(to_unsigned(233,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = STD_LOGIC_VECTOR(to_unsigned(39,8)) REPORT "TEST FALLITO" severity failure;

        WAIT UNTIL tb_start = '1';
        WAIT UNTIL tb_done = '1'; WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = STD_LOGIC_VECTOR(to_unsigned(57,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = STD_LOGIC_VECTOR(to_unsigned(7,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = STD_LOGIC_VECTOR(to_unsigned(124,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = STD_LOGIC_VECTOR(to_unsigned(39,8)) REPORT "TEST FALLITO" severity failure;

        WAIT UNTIL tb_start = '1';
        WAIT UNTIL tb_done = '1'; WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = STD_LOGIC_VECTOR(to_unsigned(57,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = STD_LOGIC_VECTOR(to_unsigned(7,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = STD_LOGIC_VECTOR(to_unsigned(124,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = STD_LOGIC_VECTOR(to_unsigned(5,8)) REPORT "TEST FALLITO" severity failure;

        WAIT UNTIL tb_start = '1';
        WAIT UNTIL tb_done = '1'; WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = STD_LOGIC_VECTOR(to_unsigned(57,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = STD_LOGIC_VECTOR(to_unsigned(7,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = STD_LOGIC_VECTOR(to_unsigned(143,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = STD_LOGIC_VECTOR(to_unsigned(5,8)) REPORT "TEST FALLITO" severity failure;
        
        WAIT UNTIL tb_start = '1';
        WAIT UNTIL tb_done = '1'; WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = STD_LOGIC_VECTOR(to_unsigned(57,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = STD_LOGIC_VECTOR(to_unsigned(7,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = STD_LOGIC_VECTOR(to_unsigned(188,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = STD_LOGIC_VECTOR(to_unsigned(5,8)) REPORT "TEST FALLITO" severity failure;
        
        WAIT UNTIL tb_start = '1';
        WAIT UNTIL tb_done = '1'; WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = STD_LOGIC_VECTOR(to_unsigned(202,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = STD_LOGIC_VECTOR(to_unsigned(7,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = STD_LOGIC_VECTOR(to_unsigned(188,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = STD_LOGIC_VECTOR(to_unsigned(5,8)) REPORT "TEST FALLITO" severity failure;
        
        WAIT UNTIL tb_start = '1';
        WAIT UNTIL tb_done = '1'; WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = STD_LOGIC_VECTOR(to_unsigned(202,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = STD_LOGIC_VECTOR(to_unsigned(7,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = STD_LOGIC_VECTOR(to_unsigned(188,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = STD_LOGIC_VECTOR(to_unsigned(254,8)) REPORT "TEST FALLITO" severity failure;
        
        WAIT UNTIL tb_start = '1';
        WAIT UNTIL tb_done = '1'; WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = STD_LOGIC_VECTOR(to_unsigned(202,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = STD_LOGIC_VECTOR(to_unsigned(7,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = STD_LOGIC_VECTOR(to_unsigned(251,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = STD_LOGIC_VECTOR(to_unsigned(254,8)) REPORT "TEST FALLITO" severity failure;
        
        WAIT UNTIL tb_start = '1';
        WAIT UNTIL tb_done = '1'; WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = STD_LOGIC_VECTOR(to_unsigned(202,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = STD_LOGIC_VECTOR(to_unsigned(130,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = STD_LOGIC_VECTOR(to_unsigned(251,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = STD_LOGIC_VECTOR(to_unsigned(254,8)) REPORT "TEST FALLITO" severity failure;
        
        ASSERT false REPORT "Test completato." severity failure;

    END PROCESS testRoutine;

END tb_ex4;
