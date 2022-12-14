-- 5-bit Binary Counter with Reset
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity counter_5bit is
    port (
        CLK, RESET, EN : in std_logic;
        Q : out std_logic_vector(4 downto 0)
    );
end counter_5bit;

architecture behavioral of counter_5bit is
    signal count : std_logic_vector(4 downto 0);
    begin 
    process (RESET, CLK) --sensitivity list... scatto quando cambiano
        begin
        if (RESET = '1') then
            count <= "00000";
        elsif (CLK'event and (CLK = '1') and (EN = '1')) then
            count <= count + "00001";
        end if;
    end process;
    Q <= count;
end behavioral;