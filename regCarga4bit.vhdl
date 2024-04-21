library ieee;
use ieee.std_logic_1164.all;

entity regCarga4bit is
    port(
        d      : in std_logic_vector(3 downto 0);
        clk    : in std_logic;
        pr, cl : in std_logic;
        nrw    : in std_logic;
        s      : out std_logic_vector(3 downto 0)
    );
end entity;

architecture reg4bit of regCarga4bit is
    component regCarga1bit is
    port(
        d      : in std_logic;
        clk    : in std_logic;
        pr, cl : in std_logic;
        nrw    : in std_logic;
        s      : out std_logic
    );
    end component;

begin
    -- instâncias de regCarga1bit (4 vezes)
    u_reg0 : regCarga1bit port map(d(0), clk, pr, cl, nrw, s(0));
    u_reg1 : regCarga1bit port map(d(1), clk, pr, cl, nrw, s(1));
    u_reg2 : regCarga1bit port map(d(2), clk, pr, cl, nrw, s(2));
    u_reg3 : regCarga1bit port map(d(3), clk, pr, cl, nrw, s(3));

end architecture;
