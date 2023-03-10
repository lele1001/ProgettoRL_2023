library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity project_reti_logiche is
    port (
        i_clk : in std_logic;
        i_rst : in std_logic;
        i_start : in std_logic;
        i_w : in std_logic;
        o_z0 : out std_logic_vector(7 downto 0);
        o_z1 : out std_logic_vector(7 downto 0);
        o_z2 : out std_logic_vector(7 downto 0);
        o_z3 : out std_logic_vector(7 downto 0);
        o_done : out std_logic;
        o_mem_addr : out std_logic_vector(15 downto 0);
        i_mem_data : in std_logic_vector(7 downto 0);
        o_mem_we : out std_logic;
        o_mem_en : out std_logic
    );
end project_reti_logiche;

architecture project_reti_logiche_arc of project_reti_logiche is 
    type S is (S0, S1, S2, S3, S4, S5);

    signal curr_state : S;
    signal reg_done : std_logic := '0';
    signal reg_out : std_logic_vector (1 downto 0);
    signal data_ready : std_logic := '0';
    signal out_en : std_logic := '0';
    signal reset_w : std_logic := '0';

    component sipo is
        port (
            clk : in std_logic;
            rst : in std_logic;
            rst_tot : in std_logic;
            in_wr : in std_logic;
            we : in std_logic;
            re : in std_logic;
            data_out : out std_logic_vector (15 downto 0)
        );
    end component;

    component choose_reg is
        port (
            clk : in std_logic;
            rst : in std_logic;
            rst_tot : in std_logic;
            we : in std_logic;
            in_wr : in std_logic;
            done_c : out std_logic;
            reg_out : out std_logic_vector (1 downto 0)
        );
    end component;

    component demux is
        port (
            clk : in std_logic;
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
    end component;

begin
    sipo_map : sipo port map (
        clk => i_clk,
        rst => reset_w,
        rst_tot => i_rst,
        in_wr => i_w,
        we => reg_done,
        re => i_start,
        data_out => o_mem_addr
    );

    reg_map : choose_reg port map (
        clk => i_clk,
        rst => reset_w,
        rst_tot => i_rst,
        we => i_start,
        in_wr => i_w,
        done_c => reg_done,
        reg_out => reg_out
    );

    demux_map : demux port map (
        clk => i_clk,
        reg_out => reg_out,
        in_mem => i_mem_data,
        en => out_en,
        re => data_ready,
        rst => i_rst,
        done_c => reg_done,
        reg_z0 => o_z0,
        reg_z1 => o_z1,
        reg_z2 => o_z2,
        reg_z3 => o_z3
    );

    o_mem_we <= '0';

    fsm : process (i_clk, i_rst, curr_state, i_start) is
    begin
        if (i_rst = '1') then
            curr_state <= S0;
        else
            if ((i_clk'event) and (i_clk = '1')) then
                case curr_state is
                    when S0 =>
                        if (i_start = '1') then
                            curr_state <= S1;
                        else
                            curr_state <= S0;
                        end if;
                    when S1 =>
                        if (i_start = '0') then
                            curr_state <= S3;
                        else
                            curr_state <= S2;
                        end if;
                    when S2 =>
                        if (i_start = '0') then
                            curr_state <= S3;
                        else
                            curr_state <= S2;
                        end if;
                    when S3 =>
                        curr_state <= S4;
                    when S4 =>
                        curr_state <= S5;
                    when S5 =>
                        curr_state <= S0;
                end case;
            end if;
        end if;
    end process;

    fsm_signals : process (curr_state) is
    begin
        case curr_state is
            when S0 => 
                -- reset state, prepairing to receive data
                reset_w <= '0';
                out_en <= '0';
                o_done <= '0';
                data_ready <= '0';
                o_mem_en <= '0';
            when S1 =>
                -- reads the first 2 bits from the input
                reset_w <= '0';
                out_en <= '0';
                o_done <= '0';
                data_ready <= '0';
                o_mem_en <= '0';
            when S2 =>
                -- reads N bit from the input
                reset_w <= '0';
                out_en <= '0';
                o_done <= '0';
                data_ready <= '0';
                o_mem_en <= '0';
            when S3 =>
                -- sends the data read from the input to the memory
                reset_w <= '0';
                out_en <= '0';
                o_done <= '0';
                data_ready <= '0';
                o_mem_en <= '1';
            when S4 => 
                -- receives the data to show in output from the memory
                reset_w <= '1';
                out_en <= '0';
                o_done <= '0';
                data_ready <= '1';
                o_mem_en <= '0';
            when S5 => 
                -- data is shown on the outputs
                reset_w <= '0';
                out_en <= '1'; 
                o_done <= '1';
                data_ready <= '0';                
                o_mem_en <= '0';
        end case; 
    end process;    
end architecture;

library IEEE;
use IEEE.std_logic_1164.all;

entity demux is
    port (
        clk : in std_logic;    
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
    -- enables the right output line
    save_reg : process (clk, done_c, reg_out, reg) is
    begin
        if ((clk'event) and (clk = '1') and (done_c = '1')) then
            reg(1 downto 0) <= reg_out(1 downto 0);
        end if;
    end process; 
    
    -- saves the data coming from the memory in the right output line
    data : process (clk, in_mem, rst, re, done_c, reg, r0, r1, r2, r3) is
    begin
        if ((clk'event) and (clk = '1')) then
            if (rst = '1') then
                r0 <= (others => '0');
                r1 <= (others => '0');
                r2 <= (others => '0');
                r3 <= (others => '0');
            else
                if ((re = '1') and (done_c = '0')) then
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
            end if;
        end if;
    end process;

    -- controls the outputs
    write_out : process (en, r0, r1, r2, r3) is
    begin
        if (en = '0') then
            reg_z0 <= (others => '0');
            reg_z1 <= (others => '0');
            reg_z2 <= (others => '0');
            reg_z3 <= (others => '0');
        else
            reg_z0 <= r0;
            reg_z1 <= r1;
            reg_z2 <= r2;
            reg_z3 <= r3;
        end if;
    end process;
end behavioural;

library IEEE;
use IEEE.std_logic_1164.all;

entity choose_reg is
    port (
        clk : in std_logic;
        rst : in std_logic;
        rst_tot : in std_logic;
        we : in std_logic;
        in_wr : in std_logic;
        done_c : out std_logic;
        reg_out : out std_logic_vector (1 downto 0)
    );
end choose_reg;

architecture behavioural of choose_reg is
    signal counter : std_logic_vector (1 downto 0) := (others => '0');
begin
    -- reads the first 2 bits and identifies the register
    read_reg : process (clk, rst, rst_tot, we) is
    begin
        if ((rst = '1') or (rst_tot = '1')) then
            counter <= (others => '0');
            reg_out <= (others => '0');
            done_c <= '0';
        else
            if ((clk'event) and (clk = '1')) then
                if (we = '1') then
                    if (counter = "00") then
                        counter(1) <= '1';
                        reg_out(1) <= in_wr;
                    elsif (counter = "10") then
                        counter <= "11";
                        reg_out(0) <= in_wr;
                        done_c <= '1';
                    end if;
                end if;
            end if;
        end if;
    end process;
end behavioural;

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
    -- reads N bits from the input
    shift_input : process (clk, rst, rst_tot, we, re)
    begin
        if ((rst = '1') or (rst_tot = '1')) then
            temp <= (others => '0');
            data_out <= (others => '0');
        else
            if ((clk'event) and (clk = '1')) then
                if ((we = '1') and (re = '1')) then
                    temp(15 downto 1) <= temp(14 downto 0);
                    temp(0) <= in_wr;
                else
                    data_out <= temp;
                end if;
            end if;
        end if;
    end process;
end behavioural;