library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testN2 is
end testN2;

architecture testN2Ar of testN2 is
    component project_reti_logiche is
        port (
            i_clk : in std_logic;
            i_rst : in std_logic;
            i_start : in std_logic;
            i_w : in std_logic;
            o_z0 : out std_logic_vector(7 downto 0);
            o_z1 : out std_logic_vector(7 downto 0);
            o_z2 : out std_logic_vector(7 downto 0);
            o_z3 : out std_logic_vector(7 downto 0);
            o_done : out std_logic;
            o_mem_addr : out std_logic_vector(15 downto 0);
            i_mem_data : in std_logic_vector(7 downto 0);
            o_mem_we : out std_logic;
            o_mem_en : out std_logic
        );
    end component;
    
    signal i_clk : std_logic := '1';
    signal i_rst : std_logic;
    signal i_start : std_logic;
    signal i_w : std_logic;
    signal o_z0 : std_logic_vector(7 downto 0);
    signal o_z1 : std_logic_vector(7 downto 0);
    signal o_z2 : std_logic_vector(7 downto 0);
    signal o_z3 : std_logic_vector(7 downto 0);
    signal o_done : std_logic;
    signal o_mem_addr : std_logic_vector(15 downto 0);
    signal i_mem_data : std_logic_vector(7 downto 0) := (others => '0');
    signal o_mem_we : std_logic;
    signal o_mem_en : std_logic;
    
    signal all_zero : std_logic_vector(7 downto 0) := (others => '0');
    signal all_one : std_logic_vector(7 downto 0) := (others => '1');
    signal all_zero_15 : std_logic_vector(15 downto 0) := (others => '0');
    signal all_one_15 : std_logic_vector(15 downto 0) := (others => '1');
begin
    port_map : project_reti_logiche port map (
        i_clk => i_clk,
        i_rst => i_rst,
        i_start => i_start,
        i_w => i_w,
        o_z0 => o_z0,  
        o_z1 => o_z1,
        o_z2 => o_z2,
        o_z3 => o_z3,
        o_done => o_done,
        o_mem_addr => o_mem_addr,
        i_mem_data => i_mem_data,
        o_mem_we => o_mem_we,
        o_mem_en => o_mem_en
    );
    
    i_clk <= not i_clk after 20 ns;

    test : process is
    begin
        -- scelgo i_mem_data = 1 perchè non ho voglia di pensare ad altro
        i_mem_data <= (others => '1');

        i_rst <= '1';
        wait until falling_edge(i_clk);
        
        i_rst <= '0';    
        assert o_done = '0' report "o_done non zero after reset" severity failure;
        assert o_mem_addr = all_zero_15 report "o_mem_addr non zero after reset" severity failure;
        assert o_z0 = all_zero report "o_z0 non zero after reset" severity failure;
        assert o_z1 = all_zero report "o_z1 non zero after reset" severity failure;
        assert o_z2 = all_zero report "o_z2 non zero after reset" severity failure;
        assert o_z3 = all_zero report "o_z3 non zero after reset" severity failure;
        assert o_mem_we = '0' report "o_mem_we non zero after reset" severity failure;
        assert o_mem_en = '0' report "o_mem_en non zero after reset" severity failure;
        wait until falling_edge(i_clk);

        i_start <= '1';
        i_w <= '1';
        wait until falling_edge(i_clk);
        i_w <= '0';
        wait until falling_edge(i_clk);
        i_start <= '0';
        wait until falling_edge(i_clk);

        assert o_mem_we = '0' report "o_mem_we active during writing" severity failure;
        assert o_mem_en = '1' report "o_mem_en not active during writing" severity failure;
        assert o_mem_addr = all_zero_15 report "o_mem_addr not correct with enable down" severity failure;
        wait until falling_edge(i_clk);

        assert o_mem_we = '0' report "o_mem_we active during reading" severity failure;
        assert o_mem_en = '0' report "o_mem_en not active during reading" severity failure;
        wait until falling_edge(i_clk);

        assert o_z0 = all_zero report "o_z0 not correct" severity failure;
        assert o_z1 = all_zero report "o_z1 not correct" severity failure;
        assert o_z2 = all_one report "o_z2 not correct" severity failure;
        assert o_z3 = all_zero report "o_z3 not correct" severity failure;
        assert o_mem_en = '0' report "o_mem_en active after reading" severity failure;
        assert o_done = '1' report "o_done not active during output writing" severity failure;
        wait until falling_edge(i_clk);

        i_start <= '1';
        i_w <= '1';
        wait until falling_edge(i_clk);
        i_w <= '0';
        wait until falling_edge(i_clk);
        i_start <= '0';
        wait until falling_edge(i_clk);
        
        assert o_mem_we = '0' report "o_mem_we active during writing" severity failure;
        assert o_mem_en = '1' report "o_mem_en not active during writing" severity failure;
        assert o_mem_addr = all_zero_15 report "o_mem_addr not correct with enable down" severity failure;
        wait until falling_edge(i_clk);

        assert o_mem_we = '0' report "o_mem_we active during reading" severity failure;
        assert o_mem_en = '0' report "o_mem_en not active during reading" severity failure;
        wait until falling_edge(i_clk);

        assert o_z0 = all_zero report "o_z0 not correct" severity failure;
        assert o_z1 = all_zero report "o_z1 not correct" severity failure;
        assert o_z2 = all_one report "o_z2 not correct" severity failure;
        assert o_z3 = all_zero report "o_z3 not correct" severity failure;
        assert o_mem_en = '0' report "o_mem_en active after reading" severity failure;
        assert o_done = '1' report "o_done not active during output writing" severity failure;
        
        ASSERT false REPORT "Simulation Ended! TEST PASSATO (EXAMPLE)" SEVERITY failure;
    end process;    

end testN2Ar;