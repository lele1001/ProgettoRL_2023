library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity choose_reg_tb is
end choose_reg_tb;

architecture testbench of choose_reg_tb is
    component choose_reg is
        port (
            clk : in std_logic;
            rst : in std_logic;
            we : in std_logic;
            in_wr : in std_logic;
            reg_out : out std_logic_vector (1 downto 0)
        );
    end component;

    signal clk : std_logic := '1';
    signal rst : std_logic;
    signal we : std_logic;
    signal in_wr : std_logic;
    signal reg_out : std_logic_vector(1 downto 0);
    signal counter : std_logic_vector(1 downto 0) := (others => '0');
    signal all_zero : std_logic_vector(1 downto 0) := (others => '0');
    signal all_one : std_logic_vector(1 downto 0) := (others => '1');
    signal wait_time : time := 2 ns;
begin
    port_map : choose_reg port map (
        clk => clk,
        rst => rst,
        we => we,
        in_wr => in_wr,
        reg_out=> reg_out
    );
    
    clockpr : process is
    begin
        clk <= not clk after 4 ns;
    end process;

    test : process is
    begin
        rst <= '1';
        wait for wait_time;
        assert reg_out = all_zero report "reg_out non zero after reset" severity failure;
        assert counter = all_zero report "counter non zero after reset" severity failure;
        wait until falling_edge(clk);

        rst <= '0';
        wait for wait_time;
        assert reg_out = all_zero report "reg_out non zero with enable down" severity failure;
        assert counter = all_zero report "counter non zero with enable down" severity failure;
        wait until falling_edge(clk);

        we <= '1';
        in_wr <= '0';
        wait for wait_time;
        assert reg_out = "00" report "reg_out not correct" severity failure;
        assert counter = "10" report "counter not correct" severity failure;
        wait until falling_edge(clk);

        we <= '0';
        in_wr <= '1';
        wait for wait_time;
        assert reg_out = "00" report "reg_out not correct" severity failure;
        assert counter = "10" report "counter not correct" severity failure;
        wait until falling_edge(clk);

        rst <= '1';
        wait for wait_time;
        assert reg_out = all_zero report "reg_out non zero after reset" severity failure;
        assert counter = all_zero report "counter non zero after reset" severity failure;
        wait until falling_edge(clk);

        rst <= '0';
        wait for wait_time;
        assert reg_out = all_zero report "reg_out non zero with enable down" severity failure;
        assert counter = all_zero report "counter non zero with enable down" severity failure;
        wait until falling_edge(clk);

        we <= '1';
        in_wr <= '0';
        wait for wait_time;
        assert reg_out = "00" report "reg_out not correct" severity failure;
        assert counter = "10" report "counter not correct" severity failure;
        wait until falling_edge(clk);

        we <= '1';
        in_wr <= '1';
        wait for wait_time;
        assert reg_out = "01" report "reg_out not correct" severity failure;
        assert counter = "11" report "counter not correct" severity failure;
        wait until falling_edge(clk);

        we <= '1';
        in_wr <= '0';
        wait for wait_time;
        assert reg_out = "01" report "reg_out not correct" severity failure;
        assert counter = "11" report "counter not correct" severity failure;
        wait until falling_edge(clk);
    end process;
end testbench;