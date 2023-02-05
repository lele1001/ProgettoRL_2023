library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity demux_tb is
end demux_tb;

architecture testbench of demux_tb is
    component demux is
        port (
            reg_out : in std_logic_vector (1 downto 0);
            in_mem : in std_logic_vector (7 downto 0);
            en : in std_logic;
            rst : in std_logic;
            clk : in std_logic;
            reg_z0 : out std_logic_vector (7 downto 0);
            reg_z1 : out std_logic_vector (7 downto 0);
            reg_z2 : out std_logic_vector (7 downto 0);
            reg_z3 : out std_logic_vector (7 downto 0)
        );
    end component;
    
    signal reg_out : std_logic_vector (1 downto 0);
    signal in_mem : std_logic_vector (7 downto 0);
    signal en : std_logic;
    signal rst : std_logic;
    signal clk : std_logic := '1';
    signal reg_z0 : std_logic_vector (7 downto 0);
    signal reg_z1 : std_logic_vector (7 downto 0);
    signal reg_z2 : std_logic_vector (7 downto 0);
    signal reg_z3 : std_logic_vector (7 downto 0);
    signal all_zero : std_logic_vector (7 downto 0) := (others => '0');
    signal all_one : std_logic_vector (7 downto 0) := (others => '1');
    signal wait_time : time := 2 ns;

begin
    port_map : demux port map (
        reg_out => reg_out,
        in_mem => in_mem,
        en => en,
        rst => rst,
        clk => clk,
        reg_z0 => reg_z0,
        reg_z1 => reg_z1,
        reg_z2 => reg_z2,
        reg_z3 => reg_z3
    );

    clockpr : process is
    begin
        clk <= not clk after 4 ns;
        wait for wait_time;
    end process;

    test : process is
    begin
        rst <= '1';
        wait for wait_time;
        assert reg_z0 = all_zero report "R0 non zero after reset" severity failure;
        assert reg_z1 = all_zero report "R1 non zero after reset" severity failure;
        assert reg_z2 = all_zero report "R2 non zero after reset" severity failure;
        assert reg_z3 = all_zero report "R3 non zero after reset" severity failure;
        wait until falling_edge(clk);

        rst <= '0';
        reg_out <= "00";
        en <= '0';
        in_mem <= (others => '1');
        wait until falling_edge(clk);
        assert reg_z0 = all_zero report "R0 non zero with enable down" severity failure;

        en <= '1';
        wait until falling_edge(clk);
        reg_out <= "01";
        wait until falling_edge(clk);
        assert reg_z0 = all_one report "R0 non one with enable up" severity failure;
    end process;
end testbench;
