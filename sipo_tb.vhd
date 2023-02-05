library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity sipo_tb is
end sipo_tb;

architecture testbench of sipo is
    component sipo is
        port (
            clk : in std_logic;
            rst : in std_logic;
            in_wr : in std_logic;
            we : in std_logic
        );
    end component;

    signal clk : std_logic;
    signal rst : std_logic;
    signal in_wr : std_logic;
    signal we : std_logic
    signal temp : std_logic_vector(15 downto 0);
    signal all_zero : std_logic_vector(15 downto 0) := (others => '0');
    signal all_one : std_logic_vector(15 downto 0) := (others => '1');
    signal wait_time : time := 2 ns;
begin
    port_map : sipo port map (
        clk => clk,
        rst => rst,
        in_wr => in_wr,
        we => we
    );

    clockpr : process is
    begin
        clk <= not clk after 4 ns;
    end process;

    test : process is
    begin
        rst <= '1';
        wait for wait_time;
        assert temp = all_zero report "temp non zero after reset" severity failure;
        wait until falling_edge(clk);

        rst <= '0';
        wait for wait_time;
        assert temp = all_zero report "temp non zero with enable down" severity failure;
        wait until falling_edge(clk);

        we <= '1';
        in_wr <= '0';
        wait for wait_time;
        assert temp = all_zero report "temp not correct with enable up" severity failure;
        wait until falling_edge(clk);

        we <= '0';
        in_wr <= '1';
        wait for wait_time;
        assert temp = all_zero report "temp not correct with enable down" severity failure;
        wait until falling_edge(clk);

        we <= '1';
        in_wr <= '1';
        wait for wait_time;
        assert temp = "0000000000000001" report "temp not correct with enable up" severity failure;
        wait until falling_edge(clk);

        we <= '0';
        in_wr <= '1';
        wait for wait_time;
        assert temp = "0000000000000001" report "temp not correct with enable down" severity failure;
        wait until falling_edge(clk);

        we <= '1';
        in_wr <= '1';
        wait for wait_time;
        assert temp = "0000000000000011" report "temp not correct with enable up" severity failure;
        wait until falling_edge(clk);

        we <= '0';
        in_wr <= '1';
        wait for wait_time;
        assert temp = "0000000000000011" report "temp not correct with enable down" severity failure;
        wait until falling_edge(clk);

        we <= '1';
        in_wr <= '0';
        wait for wait_time;
        assert temp = "0000000000000110" report "temp not correct with enable up" severity failure;
        wait until falling_edge(clk);

        we <= '0';
        in_wr <= '1';
        wait for wait_time;
        assert temp = "0000000000000110" report "temp not correct with enable down" severity failure;
        wait until falling_edge(clk);

        rst <= '1';
        wait for wait_time;
        assert temp = all_zero report "temp non zero after reset" severity failure;
        wait until falling_edge(clk);

        rst <= '0';
        we <= '1';
        in_wr <= '1';
        wait for wait_time;
        assert temp = "0000000000000001" report "temp not correct" severity failure;
        wait until falling_edge(clk);
    end process;
end testbench;