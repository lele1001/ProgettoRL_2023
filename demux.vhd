library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity demux is
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
end demux;

architecture behavioural of demux is
    signal r0 : std_logic_vector (7 downto 0);
    signal r1 : std_logic_vector (7 downto 0);
    signal r2 : std_logic_vector (7 downto 0);
    signal r3 : std_logic_vector (7 downto 0);

begin
    -- processo che modifica i segnali che poi verranno trasmessi alle uscite
    data : process (clk, rst) is
    begin
        if (rst = '1') then
            r0 <= (others => '0');
            r1 <= (others => '0');
            r2 <= (others => '0');
            r3 <= (others => '0');
        elsif (clk'event and (clk = '1') and rst = '0') then
            if (reg_out = "00") then
                r0 <= in_mem;
            elsif (reg_out = "01") then
                r1 <= in_mem;
            elsif (reg_out = "10") then
                r2 <= in_mem;
            elsif (reg_out = "11") then
                r3 <= in_mem;
            end if;
        end if;
    end process;

    -- processo che mostra il dato in uscita
    write_out : process (en, r0, r1, r2, r3) is
    begin
        if (en = '1') then
            reg_z0 <= r0;
            reg_z1 <= r1;
            reg_z2 <= r2;
            reg_z3 <= r3;
        else 
            reg_z0 <= (others => '0');
            reg_z1 <= (others => '0');
            reg_z2 <= (others => '0');
            reg_z3 <= (others => '0');
        end if;
    end process;
end behavioural;
