library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--library UNISIM;
--use UNISIM.VComponents.all;

entity top_tb is
--  Port ( );
end top_tb;

architecture Behavioral of top_tb is

COMPONENT top is
    Port (
        sw : in STD_LOGIC_VECTOR(15 downto 0);
        clk : in STD_LOGIC;
        seg : out STD_LOGIC_VECTOR(6 downto 0);
        dp : out STD_LOGIC;
        an : out STD_LOGIC_VECTOR(3 downto 0);
        led : out STD_LOGIC_VECTOR(15 downto 0)
        );
END COMPONENT;

        signal sw : STD_LOGIC_VECTOR(15 downto 0);
        signal clk : STD_LOGIC;
        signal seg : STD_LOGIC_VECTOR(6 downto 0);
        signal dp : STD_LOGIC;
        signal an : STD_LOGIC_VECTOR(3 downto 0);
        signal led : STD_LOGIC_VECTOR(15 downto 0);

begin

    sim : top
    port map
    (
        sw => sw,
        clk => clk,
        seg => seg,
        dp => dp,
        an => an,
        led => led
    );

end Behavioral;
