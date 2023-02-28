library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity sipo_tb is
end sipo_tb;

architecture testbench of sipo_tb is
    component sipo is
        port (
            clk : in std_logic;
            rst : in std_logic;
            in_wr : in std_logic;
            we : in std_logic;
            data_out : out std_logic_vector (15 downto 0)
        );
    end component;

    signal clk : std_logic := '1';
    signal rst : std_logic;
    signal in_wr : std_logic;
    signal we : std_logic := '0';
    signal data_out : std_logic_vector(15 downto 0);
    signal all_zero : std_logic_vector(15 downto 0) := (others => '0');
    signal all_one : std_logic_vector(15 downto 0) := (others => '1');
begin
    port_map : sipo port map (
        clk => clk,
        rst => rst,
        in_wr => in_wr,
        we => we,
        data_out => data_out
    );

    clk <= not clk after 20 ns;

    test : process is
    begin
        rst <= '1';
        wait for 2 ns;
        
        rst <= '0';    
        assert data_out = all_zero report "data_out non zero with enable down" severity failure;

        we <= '1';
        in_wr <= '0';
        wait until rising_edge(clk);
        wait until falling_edge(clk);

        we <= '0';
        in_wr <= '1';
        wait until falling_edge(clk);
        assert data_out = all_zero report "data_out not correct with enable down" severity failure;

        we <= '1';
        in_wr <= '1';
        wait until falling_edge(clk);

        we <= '0';
        in_wr <= '1';
        wait until falling_edge(clk);
        assert data_out = "0000000000000001" report "data_out not correct with enable down" severity failure;

        we <= '1';
        in_wr <= '1';
        wait until falling_edge(clk);

        we <= '0';
        in_wr <= '1';
        wait until falling_edge(clk);
        assert data_out = "0000000000000011" report "data_out not correct with enable down" severity failure;

        we <= '1';
        in_wr <= '0';
        wait until falling_edge(clk);

        we <= '0';
        in_wr <= '1';
        wait until falling_edge(clk);
        assert data_out = "0000000000000110" report "data_out not correct with enable down" severity failure;

        rst <= '1';
        wait for 2 ns;
        assert data_out = all_zero report "data_out non zero after reset" severity failure;

        rst <= '0';
        we <= '1';
        in_wr <= '1';
        wait until falling_edge(clk);
        
        we <= '0';
        wait until falling_edge(clk);
        assert data_out = "0000000000000001" report "data_out not correct" severity failure;
    end process;
end testbench;