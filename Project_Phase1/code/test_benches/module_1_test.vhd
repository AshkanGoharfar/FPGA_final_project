----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2019 02:47:49 AM
-- Design Name: 
-- Module Name: test - Behavioral
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
use STD.textio.all;
use IEEE.std_logic_textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity module_1_test is
--  Port ( );
end module_1_test;

architecture Behavioral of module_1_test is


COMPONENT tangent_h
  PORT (
    clk : IN STD_LOGIC;
    valid_input : IN STD_LOGIC;
    valid_output : out STD_LOGIC;
    x : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    y : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
  end component tangent_h;

signal clk : STD_LOGIC := '1';
signal valid_input : STD_LOGIC := '0';
signal x : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal valid_output : STD_LOGIC;
signal y : STD_LOGIC_VECTOR(15 DOWNTO 0);

constant CLK_PERIOD : time := 1000 ns;

file file_INPUT : text;
file file_RESULTS : text;



begin

u : tangent_h
  PORT MAP (
    clk => clk,
    valid_input => valid_input,
    valid_output => valid_output,
    x => x,
    y => y
  );
  
  
  clk_gen_p:process is
  begin
    clk <= '1';
    wait for CLK_PERIOD/2;
    clk <= '0';
    wait for CLK_PERIOD/2;
  end process;
  
  stimuli : process
  
 variable v_ILINE     : line;
 variable v_OLINE     : line;
 variable v_INPUT : std_logic_vector(15 downto 0);
    
  begin
  
      file_open(file_INPUT, "input_1.txt",  read_mode);
      file_open(file_RESULTS, "output_1.txt", write_mode);
    
    while not endfile(file_INPUT) loop
    
            readline(file_INPUT, v_ILINE);
            read(v_ILINE, v_INPUT);
       
            x <= v_INPUT;
            valid_input <= '1';
            
            wait for 200 us;
            
            write(v_OLINE, y, right, 16);
            writeline(file_RESULTS, v_OLINE);
    end loop;
    
    file_close(file_INPUT);
    file_close(file_RESULTS);
         
    wait;
  end process;

end Behavioral;
