library IEEE;
use IEEE.std_logic_1164.all;

entity sipo is
    port (
        clk : in std_logic;
        rst : in std_logic;
        rst_tot : in std_logic;
        in_wr : in std_logic;
        we : in std_logic;
        re : in std_logic;
        data_out : out std_logic_vector (15 downto 0)
    );
    end sipo;

architecture behavioural of sipo is
    signal temp : std_logic_vector(15 downto 0) := (others => '0');
begin
    shift_input : process (clk, rst, rst_tot)
    begin
        if (rst = '1' or rst_tot = '1') then
            temp <= (others => '0');
            data_out <= (others => '0');
        elsif (clk'event and (clk = '1') and rst = '0') then
            if (we = '1' and re = '1') then
                temp(15 downto 1) <= temp(14 downto 0);
                temp(0) <= in_wr;
            else
                data_out <= temp;
            end if;
        end if;
    end process;
end behavioural;