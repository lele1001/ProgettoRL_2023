
-- TB EXAMPLE PFRL 2022-2023

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;
USE std.textio.ALL;

ENTITY tb_ex6 IS
END tb_ex6;

ARCHITECTURE tb_ex6 OF tb_ex6 IS
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

    CONSTANT SCENARIOLENGTH : INTEGER := 432; --
    SIGNAL scenario_rst : unsigned(0 TO SCENARIOLENGTH - 1)     := "00110" & "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    SIGNAL scenario_start : unsigned(0 TO SCENARIOLENGTH - 1)   := "00000" & "111111" & "00000000000000000000" & "111111" & "00000000000000000000" & "1111111" & "00000000000000000000" & "1111111" & "00000000000000000000" & "1111111" & "00000000000000000000" & "11111111" & "00000000000000000000" & "11111111" & "00000000000000000000" & "11111111" & "00000000000000000000" & "11111111" & "00000000000000000000" & "11111111" & "00000000000000000000" & "111111111" & "00000000000000000000" & "111111111" & "00000000000000000000" & "111111111" & "00000000000000000000" & "111111111" & "00000000000000000000" & "111111111" & "00000000000000000000" & "111111111";
    SIGNAL scenario_w : unsigned(0 TO SCENARIOLENGTH - 1)       := "00000" & "011010" & "00000000000000000000" & "101111" & "00000000000000000000" & "1110010" & "00000000000000000000" & "0010101" & "00000000000000000000" & "1011110" & "00000000000000000000" & "01100011" & "00000000000000000000" & "11100101" & "00000000000000000000" & "11101111" & "00000000000000000000" & "01110110" & "00000000000000000000" & "00111111" & "00000000000000000000" & "001000011" & "00000000000000000000" & "001001001" & "00000000000000000000" & "011010000" & "00000000000000000000" & "101011010" & "00000000000000000000" & "101011111" & "00000000000000000000" & "001101000" ;
    -- Channel 2 -> MEM[1] -> 162
    -- Channel 1 -> MEM[2] -> 75

    TYPE ram_type IS ARRAY (65535 DOWNTO 0) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL RAM : ram_type := (  
                                10 => STD_LOGIC_VECTOR(to_unsigned(32, 8)),
                                15 => STD_LOGIC_VECTOR(to_unsigned(7, 8)),
                                18 => STD_LOGIC_VECTOR(to_unsigned(29, 8)),
                                21 => STD_LOGIC_VECTOR(to_unsigned(247, 8)),
                                30 => STD_LOGIC_VECTOR(to_unsigned(38, 8)),
                                35 => STD_LOGIC_VECTOR(to_unsigned(109, 8)),
                                37 => STD_LOGIC_VECTOR(to_unsigned(198, 8)),
                                47 => STD_LOGIC_VECTOR(to_unsigned(202, 8)),
                                54 => STD_LOGIC_VECTOR(to_unsigned(53, 8)),
                                63 => STD_LOGIC_VECTOR(to_unsigned(3, 8)),
                                67 => STD_LOGIC_VECTOR(to_unsigned(233, 8)),
                                73 => STD_LOGIC_VECTOR(to_unsigned(101, 8)),
                                80 => STD_LOGIC_VECTOR(to_unsigned(64, 8)),
                                90 => STD_LOGIC_VECTOR(to_unsigned(110, 8)),
                                95 => STD_LOGIC_VECTOR(to_unsigned(246, 8)),
                                104 => STD_LOGIC_VECTOR(to_unsigned(38, 8)),
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
        WAIT UNTIL tb_done = '1';
        WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = "00000000" REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = STD_LOGIC_VECTOR(to_unsigned(32,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = "00000000" REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = "00000000" REPORT "TEST FALLITO" severity failure;

        WAIT UNTIL tb_start = '1';
        WAIT UNTIL tb_done = '1';
        WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = "00000000" REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = STD_LOGIC_VECTOR(to_unsigned(32,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = STD_LOGIC_VECTOR(to_unsigned(7,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = "00000000" REPORT "TEST FALLITO" severity failure;

        WAIT UNTIL tb_start = '1';
        WAIT UNTIL tb_done = '1';
        WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = "00000000" REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = STD_LOGIC_VECTOR(to_unsigned(32,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = STD_LOGIC_VECTOR(to_unsigned(7,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = STD_LOGIC_VECTOR(to_unsigned(29,8)) REPORT "TEST FALLITO" severity failure;

        WAIT UNTIL tb_start = '1';
        WAIT UNTIL tb_done = '1';
        WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = STD_LOGIC_VECTOR(to_unsigned(247,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = STD_LOGIC_VECTOR(to_unsigned(32,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = STD_LOGIC_VECTOR(to_unsigned(7,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = STD_LOGIC_VECTOR(to_unsigned(29,8)) REPORT "TEST FALLITO" severity failure;

        WAIT UNTIL tb_start = '1';
        WAIT UNTIL tb_done = '1';
        WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = STD_LOGIC_VECTOR(to_unsigned(247,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = STD_LOGIC_VECTOR(to_unsigned(32,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = STD_LOGIC_VECTOR(to_unsigned(38,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = STD_LOGIC_VECTOR(to_unsigned(29,8)) REPORT "TEST FALLITO" severity failure;

        WAIT UNTIL tb_start = '1';
        WAIT UNTIL tb_done = '1';
        WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = STD_LOGIC_VECTOR(to_unsigned(247,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = STD_LOGIC_VECTOR(to_unsigned(109,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = STD_LOGIC_VECTOR(to_unsigned(38,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = STD_LOGIC_VECTOR(to_unsigned(29,8)) REPORT "TEST FALLITO" severity failure;

        WAIT UNTIL tb_start = '1';
        WAIT UNTIL tb_done = '1';
        WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = STD_LOGIC_VECTOR(to_unsigned(247,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = STD_LOGIC_VECTOR(to_unsigned(109,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = STD_LOGIC_VECTOR(to_unsigned(38,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = STD_LOGIC_VECTOR(to_unsigned(198,8)) REPORT "TEST FALLITO" severity failure;

        WAIT UNTIL tb_start = '1';
        WAIT UNTIL tb_done = '1';
        WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = STD_LOGIC_VECTOR(to_unsigned(247,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = STD_LOGIC_VECTOR(to_unsigned(109,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = STD_LOGIC_VECTOR(to_unsigned(38,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = STD_LOGIC_VECTOR(to_unsigned(202,8)) REPORT "TEST FALLITO" severity failure;

        WAIT UNTIL tb_start = '1';
        WAIT UNTIL tb_done = '1';
        WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = STD_LOGIC_VECTOR(to_unsigned(247,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = STD_LOGIC_VECTOR(to_unsigned(53,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = STD_LOGIC_VECTOR(to_unsigned(38,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = STD_LOGIC_VECTOR(to_unsigned(202,8)) REPORT "TEST FALLITO" severity failure;

        WAIT UNTIL tb_start = '1';
        WAIT UNTIL tb_done = '1';
        WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = STD_LOGIC_VECTOR(to_unsigned(3,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = STD_LOGIC_VECTOR(to_unsigned(53,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = STD_LOGIC_VECTOR(to_unsigned(38,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = STD_LOGIC_VECTOR(to_unsigned(202,8)) REPORT "TEST FALLITO" severity failure;

        WAIT UNTIL tb_start = '1';
        WAIT UNTIL tb_done = '1';
        WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = STD_LOGIC_VECTOR(to_unsigned(233,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = STD_LOGIC_VECTOR(to_unsigned(53,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = STD_LOGIC_VECTOR(to_unsigned(38,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = STD_LOGIC_VECTOR(to_unsigned(202,8)) REPORT "TEST FALLITO" severity failure;
        
        WAIT UNTIL tb_start = '1';
        WAIT UNTIL tb_done = '1';
        WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = STD_LOGIC_VECTOR(to_unsigned(101,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = STD_LOGIC_VECTOR(to_unsigned(53,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = STD_LOGIC_VECTOR(to_unsigned(38,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = STD_LOGIC_VECTOR(to_unsigned(202,8)) REPORT "TEST FALLITO" severity failure;
        
        WAIT UNTIL tb_start = '1';
        WAIT UNTIL tb_done = '1';
        WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = STD_LOGIC_VECTOR(to_unsigned(101,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = STD_LOGIC_VECTOR(to_unsigned(64,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = STD_LOGIC_VECTOR(to_unsigned(38,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = STD_LOGIC_VECTOR(to_unsigned(202,8)) REPORT "TEST FALLITO" severity failure;
        
        WAIT UNTIL tb_start = '1';
        WAIT UNTIL tb_done = '1';
        WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = STD_LOGIC_VECTOR(to_unsigned(101,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = STD_LOGIC_VECTOR(to_unsigned(64,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = STD_LOGIC_VECTOR(to_unsigned(110,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = STD_LOGIC_VECTOR(to_unsigned(202,8)) REPORT "TEST FALLITO" severity failure;
        
        WAIT UNTIL tb_start = '1';
        WAIT UNTIL tb_done = '1';
        WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = STD_LOGIC_VECTOR(to_unsigned(101,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = STD_LOGIC_VECTOR(to_unsigned(64,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = STD_LOGIC_VECTOR(to_unsigned(246,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = STD_LOGIC_VECTOR(to_unsigned(202,8)) REPORT "TEST FALLITO" severity failure;
        
        WAIT UNTIL tb_start = '1';
        WAIT UNTIL tb_done = '1';
        WAIT FOR CLOCK_PERIOD/2;
        ASSERT tb_z0 = STD_LOGIC_VECTOR(to_unsigned(38,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z1 = STD_LOGIC_VECTOR(to_unsigned(64,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z2 = STD_LOGIC_VECTOR(to_unsigned(246,8)) REPORT "TEST FALLITO" severity failure; 
        ASSERT tb_z3 = STD_LOGIC_VECTOR(to_unsigned(202,8)) REPORT "TEST FALLITO" severity failure;
        
        ASSERT false REPORT "Test completato." severity failure;

    END PROCESS testRoutine;

END tb_ex6;
