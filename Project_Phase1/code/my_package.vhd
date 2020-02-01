----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2019 09:31:43 PM
-- Design Name: 
-- Module Name: my_package - Behavioral
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

-- Package Declaration Section
package my_package is
 
 constant c_PIXELS : integer := 65536;
 
 type array2D is array( positive range <> , positive range <>) of std_logic_vector(15 downto 0);
 
 type t_FROM_FIFO is record
    wr_full  : std_logic;
    rd_empty : std_logic;
 end record t_FROM_FIFO;  
   
  component example_component is
    port (
      i_data  : in  std_logic;
      o_rsult : out std_logic); 
  end component example_component;
 
  function Bitwise_AND (
    i_vector : in std_logic_vector(3 downto 0))
    return std_logic;
   
end package my_package;
 
-- Package Body Section
package body my_package is
 
  function Bitwise_AND (
    i_vector : in std_logic_vector(3 downto 0)
    )
    return std_logic is
  begin
    return (i_vector (0) and i_vector (1) and i_vector (2) and i_vector (3));
  end;
 
end package body my_package;



-- how to use package:
--library work;
--use work.my_package.all;
