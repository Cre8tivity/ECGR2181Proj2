library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--use IEEE.NUMERIC_STD.ALL;
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( 
    sw : in std_logic_vector(15 downto 0);
    clk : in std_logic;
    seg : out std_logic_vector(6 downto 0);
    dp : out std_logic;
    an : out std_logic_vector(3 downto 0);
    led : out std_logic_vector(15 downto 0)
    );
end top;

architecture Behavioral of top is
    
COMPONENT Task3
    PORT(
       hex_in : IN STD_LOGIC_VECTOR(3 downto 0);
       A : OUT std_logic;
       B : OUT std_logic;
       C : OUT std_logic;
       D : OUT std_logic;
       E : OUT std_logic;
       F : OUT std_logic;
       G : OUT std_logic
    );
END COMPONENT;
    
COMPONENT ssd_muxer
    PORT(
       a_in       : in  std_logic_vector(3 downto 0);
	   b_in       : in  std_logic_vector(3 downto 0);
	   c_in       : in  std_logic_vector(3 downto 0);
	   d_in       : in  std_logic_vector(3 downto 0);
	   e_in       : in  std_logic_vector(3 downto 0);
	   f_in       : in  std_logic_vector(3 downto 0);
	   g_in       : in  std_logic_vector(3 downto 0);
	   decp0_in   : in  std_logic;
	   decp1_in   : in  std_logic;
	   decp2_in   : in  std_logic;
	   decp3_in   : in  std_logic;
	   seg_out    : out std_logic_vector(6 downto 0);
	   dp_out     : out std_logic;
	   an_out     : out std_logic_vector(3 downto 0);
	   clk        : in  STD_LOGIC
    );
END COMPONENT;
    
signal segment1 : STD_LOGIC_VECTOR(3 downto 0);
signal segment2 : STD_LOGIC_VECTOR(3 downto 0);
signal segment3 : STD_LOGIC_VECTOR(3 downto 0);
signal segment4 : STD_LOGIC_VECTOR(3 downto 0);
signal segment5 : STD_LOGIC_VECTOR(3 downto 0);
signal segment6 : STD_LOGIC_VECTOR(3 downto 0);
signal segment7 : STD_LOGIC_VECTOR(3 downto 0);
    
begin
    
    encoder1: task3 
        port map
        (
            hex_in => sw(15 downto 12),
            A => segment1(3),
            B => segment2(3),
            C => segment3(3),
            D => segment4(3),
            E => segment5(3),
            F => segment6(3),
            G => segment7(3)
        );
    encoder2: task3
        port map
        (
            hex_in => sw(11 downto 8),
            A => segment1(2),
            B => segment2(2),
            C => segment3(2),
            D => segment4(2),
            E => segment5(2),
            F => segment6(2),
            G => segment7(2)
        );
    encoder3: task3
        port map
        (
            hex_in => sw(7 downto 4),
            A => segment1(1),
            B => segment2(1),
            C => segment3(1),
            D => segment4(1),
            E => segment5(1),
            F => segment6(1),
            G => segment7(1)
        );
    encoder4: task3
        port map
        (
            hex_in => sw(3 downto 0),
            A => segment1(0),
            B => segment2(0),
            C => segment3(0),
            D => segment4(0),
            E => segment5(0),
            F => segment6(0),
            G => segment7(0)
    );
    
    mux: ssd_muxer
    port map
    (
        a_in => segment1,
        b_in => segment2,
        c_in => segment3,
        d_in => segment4,
        e_in => segment5,
        f_in => segment6,
        g_in => segment7,
        seg_out => seg,
        clk => clk,
        decp0_in => '0',
        decp1_in => '0',
        decp2_in => '0',
        decp3_in => '0',
        an_out => an
    );
    
    led <= sw;
    
end Behavioral;