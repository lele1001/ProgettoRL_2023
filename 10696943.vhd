library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity project_reti_logiche is
    port (
        i_clk   : in std_logic;
        i_rst   : in std_logic;
        i_start : in std_logic;
        i_w     : in std_logic;
        o_z0    : out std_logic_vector(7 downto 0);
        o_z1    : out std_logic_vector(7 downto 0);
        o_z2    : out std_logic_vector(7 downto 0);
        o_z3    : out std_logic_vector(7 downto 0);
        o_done  : out std_logic;
        o_mem_addr : out std_logic_vector(15 downto 0);
        i_mem_data : in std_logic_vector(7 downto 0);
        o_mem_we   : out std_logic;
        o_mem_en   : out std_logic
    );
end project_reti_logiche;

architecture project_reti_logiche_arc of project_reti_logiche is 
    type S is (S0, S1, S2, S3, S4, S5);

    signal curr_state : S;
    signal reg_en : std_logic := '0';
    signal data_en : std_logic := '0';
    signal out_en : std_logic := '0';

begin
    fsm : process (i_clk, i_rst) is
    begin
        if i_rst = '1' then
            curr_state <= S0;
        elsif (i_clk'event and i_clk = '1') then
            case curr_state is
                when S0 =>
                    if (i_start = '1') then
                        curr_state <= S1;
                    end if;
                when S1 =>
                    if (i_start = '0') then
                        curr_state <= S3
                    elsif (i_start = '1') then
                        curr_state <= S2
                    end if;
                when S2 =>
                    if (i_start = '0') then
                        curr_state <= S3;
                    end if;
                when S3 =>
                    curr_state <= S4;
                when S4 =>
                    if (o_done = '1') then
                        curr_state <= S5;
                    end if;
                when S5 =>
                    curr_state <= S0;
            end case;
        end if;
    end process;

    fsm_signals : process (curr_state) is
    begin
        reg_en <= '0';
        data_en <= '0';
        out_en <= '0';
        o_done <= '0';
        o_mem_addr <= (others => '0');
        o_mem_we <= '0';
        o_mem_en <= '0';

        case curr_state is
            when S0 => 
                -- preparazione per ricevere il nuovo input               
            when S1 =>
                -- lettura dei primi due bit
                reg_en <= '1';
            when S2 =>
                -- lettura del dato da inviare alla memoria
                reg_en <= '0';
                data_en <= '1';
            when S3 =>
                -- invio del dato alla memoria
                reg_en <= '0';
                data_en <= '0';
                o_mem_en <= '1';
                o_mem_we <= '1';
            when S4 => 
                -- ricezione del dato dalla memoria
                o_mem_we <= '0'; 
            when S5 => 
                -- il dato viene mostrato sulle uscite
                o_mem_en <= '0';
                out_en <= '1'; 
                o_done <= '0';
        end case; 
    end process;    
end architecture;