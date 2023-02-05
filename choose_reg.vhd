library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity choose_reg is
    port (
        clk : in std_logic;
        rst : in std_logic;
        we : in std_logic;
        in_wr : in std_logic;
        reg_out : out std_logic_vector (1 downto 0)
    );
end choose_reg;

architecture behavioural of choose_reg is
    signal counter : std_logic_vector (1 downto 0) := (others => '0');
begin
    read_reg : process (clk) is
    begin
        if (rst = '1') then
            counter <= (others => '0');
            reg_out <= (others => '0');
        elsif ((clk'event) and (clk = '1') and (rst = '0')) then
            if (we = '1') then
                if (counter = "00") then
                    counter(1) <= '1';
                    reg_out(1) <= in_wr;
                else if (counter = "10") then
                    counter(0) <= '1';
                    reg_out(0) <= in_wr;
                end if;
            end if;
        end if;
        end if;
    end process;
end behavioural;