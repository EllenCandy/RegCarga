library ieee;
use ieee.std_logic_1164.all;

--ghdl -a *.vhdl
--ghdl -r **tb --stop-time=ns --wave=**.ghw
 
entity tb_regCarga is
    -- entidade vazia
end tb_regCarga;
 
architecture test of tb_regCarga is
    constant CLK_PERIOD : time := 20 ns;
    
    component regCarga4bit is    

    port(        

        d      : in std_logic_vector(3 downto 0);
        clk    : in std_logic;
        pr, cl : in std_logic;
        nrw    : in std_logic;
        s      : out std_logic_vector(3 downto 0)   

    );    
 
end component;
 
    signal sd, ss         : std_logic_vector(3 downto 0);
    signal spr, scl, snrw : std_logic;
    signal sclk           : std_logic := '1';
 
begin

    -- port map
    u_tb : regCarga4bit port map(sd, sclk, spr, scl, snrw, ss);
 
    -- process
    tbc : process

    begin
 
        -- testes

        -- Reset do circuito
	spr  <= '1';
	scl  <= '0';
	snrw <= '0';
	wait for CLK_PERIOD;

        -- Gravação do número 2
        snrw <= '1';
        spr  <= '1';
        scl  <= '1';
        sd   <= "0010";
        wait for CLK_PERIOD;
 
        -- Gravação do número 12
        snrw <= '1';
        spr  <= '1';
        scl  <= '1';
        sd   <= "1100";
        wait for CLK_PERIOD;
 
        -- Sem gravação por 1 ciclo / testar armazenamento
        snrw <= '0';
        wait for CLK_PERIOD;
 
        -- Gravação do número 15 / testar byte 
        snrw <= '1';
        spr  <= '1';
        scl  <= '1';
        sd   <= "1111";
        wait for CLK_PERIOD;
 
        -- Sem gravação por 1 ciclo 
        snrw <= '0';
        wait for CLK_PERIOD;
 
        -- Gravação do número 0 / testar byte
        snrw <= '1';
        spr  <= '1';
        scl  <= '1';
        sd   <= "0000";
        wait for CLK_PERIOD;
 
        -- Sem gravação por 1 ciclo
        snrw <= '0';
        wait for CLK_PERIOD;
 
        -- desativação de clear
        scl <= '1';
        wait for CLK_PERIOD;
        
        wait;

    end process;
 
    -- process para Clock
    p_clock : process

    begin
        sclk <= not(sclk);
        wait for CLK_PERIOD/2;
        
    end process;
 
end architecture test;
