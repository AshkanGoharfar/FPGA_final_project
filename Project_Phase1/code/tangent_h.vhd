----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/22/2019 03:46:06 PM
-- Design Name: 
-- Module Name: tangent_h - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tangent_h is
Port (
    clk : in std_logic;
    valid_input : in std_logic;
    valid_output : out std_logic;
    x : in std_logic_vector(15 downto 0);
    y : out std_logic_vector(15 downto 0)
 );
end tangent_h;

architecture Behavioral of tangent_h is

COMPONENT cordic_1
  PORT (
    s_axis_phase_tvalid : IN STD_LOGIC;
    s_axis_phase_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    m_axis_dout_tvalid : OUT STD_LOGIC;
    m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;
COMPONENT fix2float
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_a_tvalid : IN STD_LOGIC;
    s_axis_a_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    m_axis_result_tvalid : OUT STD_LOGIC;
    m_axis_result_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;
COMPONENT float2fix
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_a_tvalid : IN STD_LOGIC;
    s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_result_tvalid : OUT STD_LOGIC;
    m_axis_result_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END COMPONENT;
COMPONENT floating_point_0
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_a_tvalid : IN STD_LOGIC;
    s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_b_tvalid : IN STD_LOGIC;
    s_axis_b_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_result_tvalid : OUT STD_LOGIC;
    m_axis_result_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;

signal cordic_out : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sinh : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal cosh : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal divide_out : STD_LOGIC_VECTOR(31 DOWNTO 0);

begin

u1 : cordic_1
  PORT MAP (
    s_axis_phase_tvalid => valid_input,
    s_axis_phase_tdata => x,
--    m_axis_dout_tvalid => m_axis_dout_tvalid,
    m_axis_dout_tdata => cordic_out
  );

u2 : fix2float
  PORT MAP (
    aclk => clk,
    s_axis_a_tvalid => valid_input,
    s_axis_a_tdata => cordic_out(31 downto 16),
--    m_axis_result_tvalid => m_axis_result_tvalid,
    m_axis_result_tdata => sinh
  );
u3 : fix2float
    PORT MAP (
      aclk => clk,
      s_axis_a_tvalid => valid_input,
      s_axis_a_tdata => cordic_out(15 downto 0),
  --    m_axis_result_tvalid => m_axis_result_tvalid,
      m_axis_result_tdata => cosh
    );

u4 : floating_point_0
  PORT MAP (
    aclk => clk,
    s_axis_a_tvalid => valid_input,
    s_axis_a_tdata => sinh,
    s_axis_b_tvalid => valid_input,
    s_axis_b_tdata => cosh,
--    m_axis_result_tvalid => m_axis_result_tvalid,
    m_axis_result_tdata => divide_out
  );
  
  
 u5 : float2fix
    PORT MAP (
      aclk => clk,
      s_axis_a_tvalid => valid_input,
      s_axis_a_tdata => divide_out,
      m_axis_result_tvalid => valid_output,
      m_axis_result_tdata => y
    );

end Behavioral;
