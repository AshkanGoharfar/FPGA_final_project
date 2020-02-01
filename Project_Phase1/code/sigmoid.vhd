----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/22/2019 05:31:39 PM
-- Design Name: 
-- Module Name: sigmoid - Behavioral
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
use ieee.numeric_std.all; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sigmoid is
Port (
    clk : in std_logic;
    valid_input : in std_logic;
    valid_output : out std_logic;
    x : in std_logic_vector(15 downto 0);
    y : out std_logic_vector(15 downto 0)
 );
end sigmoid;

architecture Behavioral of sigmoid is

COMPONENT tangent_h
  PORT (
    clk : IN STD_LOGIC;
    valid_input : IN STD_LOGIC;
    valid_output : out STD_LOGIC;
    x : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    y : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
 END COMPONENT tangent_h;
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
 COMPONENT add_float
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
 

signal divided_by2_x : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal tanh : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal divided_by2_tanh : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal float_temp : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal add_result : STD_LOGIC_VECTOR(31 DOWNTO 0);

constant half : std_logic_vector(31 downto 0) := "00111111000000000000000000000000"; -- 0.5

begin

divided_by2_x <= STD_LOGIC_VECTOR(shift_right(signed(x), 1));

u1 : tangent_h
    PORT MAP (
      clk => clk,
      valid_input => valid_input,
--    valid_output => valid_output,
      x => divided_by2_x,
      y => tanh
      );
      
divided_by2_tanh <= STD_LOGIC_VECTOR(shift_right(signed(tanh), 1)); 
 
      
u2 : fix2float
    PORT MAP (
      aclk => clk,
      s_axis_a_tvalid => valid_input,
      s_axis_a_tdata => divided_by2_tanh,
  --    m_axis_result_tvalid => m_axis_result_tvalid,
      m_axis_result_tdata => float_temp
      );
      
u3 : add_float
        PORT MAP (
          aclk => clk,
          s_axis_a_tvalid => valid_input,
          s_axis_a_tdata => half,
          s_axis_b_tvalid => valid_input,
          s_axis_b_tdata => float_temp,
--        m_axis_result_tvalid => m_axis_result_tvalid,
          m_axis_result_tdata => add_result
        );
        
        
u4 : float2fix
    PORT MAP (
      aclk => clk,
      s_axis_a_tvalid => valid_input,
      s_axis_a_tdata => add_result,
      m_axis_result_tvalid => valid_output,
      m_axis_result_tdata => y
    );



end Behavioral;
