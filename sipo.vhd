library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity sipo is
    port (
        clk : in std_logic;
        rst : in std_logic;
        in_wr : in std_logic;
        we : in std_logic
    );
end sipo;

architecture behavioural of sipo is
    signal temp : std_logic_vector(15 downto 0);
begin
    shift_input : process (clk)
    begin
        if (rst = '1') then
            temp <= (others => '0');
        elsif (clk'event and (clk = '1') and rst = '0') then
            if (we = '1') then
                temp(15 downto 1) <= temp(14 downto 0);
                temp(0) <= in_wr;
            end if;
        end if;
    end process;
end behavioural;