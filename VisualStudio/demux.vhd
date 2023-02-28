library IEEE;
use IEEE.std_logic_1164.all;

entity demux is
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
end demux;

architecture behavioural of demux is
   signal r0 : std_logic_vector (7 downto 0);
   signal r1 : std_logic_vector (7 downto 0);
   signal r2 : std_logic_vector (7 downto 0);
   signal r3 : std_logic_vector (7 downto 0);
   signal reg : std_logic_vector (1 downto 0) := (others => '0');

begin
    save_reg : process (done_c) is
    begin
        if (done_c = '1') then
            reg(1 downto 0) <= reg_out(1 downto 0);
        end if;
    end process; 
    
    data : process (rst, re, done_c, reg) is
    begin
        if (rst = '1') then
            r0 <= (others => '0');
            r1 <= (others => '0');
            r2 <= (others => '0');
            r3 <= (others => '0');
        elsif (rst = '0' and re = '1' and done_c = '0') then
            if (reg = "00") then
                r0(7 downto 0) <= in_mem(7 downto 0);
            elsif (reg = "01") then
                r1(7 downto 0) <= in_mem(7 downto 0);
            elsif (reg = "10") then
                r2(7 downto 0) <= in_mem(7 downto 0);
            elsif (reg = "11") then
                r3(7 downto 0) <= in_mem(7 downto 0);
            end if;
        end if;
    end process;

    -- processo che mostra il dato in uscita
    write_out : process (en) is
    begin
        if (en = '0') then
            reg_z0 <= (others => '0');
            reg_z1 <= (others => '0');
            reg_z2 <= (others => '0');
            reg_z3 <= (others => '0');
        elsif (en = '1') then
            reg_z0 <= r0;
            reg_z1 <= r1;
            reg_z2 <= r2;
            reg_z3 <= r3;
        end if;
    end process;
end behavioural;