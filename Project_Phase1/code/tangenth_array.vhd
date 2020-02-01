----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/22/2019 04:20:51 PM
-- Design Name: 
-- Module Name: tangenth_array - Behavioral
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
library work;
use work.my_package.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tangenth_array is
    generic (
    m, n : positive
    );
    
    Port (
    input : in array2D (m downto 0, n downto 0);
    output : out array2D (m downto 0, n downto 0);
    valid_input : in std_logic;
    clk : in std_logic
     );
     
end tangenth_array;

architecture Behavioral of tangenth_array is

COMPONENT tangent_h
  PORT (
    clk : IN STD_LOGIC;
    valid_input : IN STD_LOGIC;
    valid_output : out STD_LOGIC;
    x : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    y : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
  end component tangent_h;

begin

gen_assign_1 :
    for i in 0 to m generate
    gen_assign_2 :
        for j in 0 to n generate
        
          u : tangent_h
          PORT MAP (
            clk => clk,
            valid_input => valid_input,
--            valid_output => valid_output,
            x => input(i,j),
            y => output(i,j)
          );
            
        end generate gen_assign_2;     
    end generate gen_assign_1;

end Behavioral;
