library IEEE;
use IEEE.std_logic_1164.all;

entity demux_tb is
end demux_tb;

architecture testbench of demux_tb is
    component demux is
        port (
            reg_out : in std_logic_vector (1 downto 0);
            in_mem : in std_logic_vector (7 downto 0);
            en : in std_logic;
            re : in std_logic;
            rst : in std_logic;
            done_c : in std_logic;
            reg_z0 : out std_logic_vector (7 downto 0);
            reg_z1 : out std_logic_vector (7 downto 0);
            reg_z2 : out std_logic_vector (7 downto 0);
            reg_z3 : out std_logic_vector (7 downto 0)
        );
    end component;
    
    signal reg_out : std_logic_vector (1 downto 0);
    signal i_mem_data : std_logic_vector (7 downto 0);
    signal o_done : std_logic;
    signal i_rst : std_logic;
    signal data_ready : std_logic := '0';
    signal reg_done : std_logic;
    signal o_z0 : std_logic_vector (7 downto 0);
    signal o_z1 : std_logic_vector (7 downto 0);
    signal o_z2 : std_logic_vector (7 downto 0);
    signal o_z3 : std_logic_vector (7 downto 0);
    signal all_zero : std_logic_vector (7 downto 0) := (others => '0');
    signal all_one : std_logic_vector (7 downto 0) := (others => '1');

begin
    port_map : demux port map (
        reg_out => reg_out,
        in_mem => i_mem_data,
        en => o_done,
        re => data_ready,
        rst => i_rst,
        done_c => reg_done,
        reg_z0 => o_z0,
        reg_z1 => o_z1,
        reg_z2 => o_z2,
        reg_z3 => o_z3
    );
    

    test : process is
    begin
        i_rst <= '1';
        o_done <= '0';
        wait for 2 ns;
        assert o_z0 = all_zero report "R0 non zero after reset" severity failure;
        assert o_z1 = all_zero report "R1 non zero after reset" severity failure;
        assert o_z2 = all_zero report "R2 non zero after reset" severity failure;
        assert o_z3 = all_zero report "R3 non zero after reset" severity failure;
        wait for 10 ns; 


        i_rst <= '0';
        reg_done <= '1';
        reg_out <= "00";
        i_mem_data <= (others => '1');
        wait for 10 ns;
        assert o_z0 = all_zero report "R0 non zero with enable down" severity failure;
        wait for 10 ns;

        reg_done <= '0';
        data_ready <= '1';
        wait for 10 ns; 
        o_done <= '1';
        data_ready <= '0';
        wait for 10 ns;
        assert o_z0 = all_one report "R0 non one with enable up" severity failure;
        wait for 10 ns; 
        
        o_done <= '0';
        reg_done <= '1';
        reg_out <= "01";
        wait for 10 ns; 

        reg_done <= '0'; 
        data_ready <= '1';
        wait for 10 ns;
        o_done <= '1';
        data_ready <= '0';
        wait for 10 ns;        
        assert o_z0 = all_one report "R0 non one with enable up" severity failure;
        assert o_z1 = all_one report "R1 non one with enable up" severity failure;
        wait for 10 ns;
        
        i_mem_data <= (others => '0');
        reg_done <= '0';
        data_ready <= '1';
        wait for 10 ns; 
        assert o_z0 = all_one report "R0 non one with enable up" severity failure;
        assert o_z1 = all_one report "R1 non one with enable up" severity failure;
        
        o_done <= '0';
        i_mem_data <= "10000000";
        reg_done <= '1';
        reg_out <= "01";
        wait for 10 ns;
         
        reg_done <= '0';
        data_ready <= '1';
        wait for 10 ns; 
        
        o_done <= '1';
        data_ready <= '0';
        wait for 10 ns;
        assert o_z1 = "10000000" report "R0 non one with enable up" severity failure;
        wait for 10 ns; 

        ASSERT false REPORT "Simulation Ended! TEST PASSATO (EXAMPLE)" SEVERITY failure;

    end process;
end testbench;
