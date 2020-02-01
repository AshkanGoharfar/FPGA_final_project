----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/24/2019 02:58:30 PM
-- Design Name: 
-- Module Name: LSTM_cell_tb - Behavioral
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
LIBRARY work;
USE work.neurals_utils.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LSTM_cell_tb is
--  Port ( );
end LSTM_cell_tb;

architecture Behavioral of LSTM_cell_tb is

component LSTM_cell  
    Port ( clk : in STD_LOGIC;
           xt : in   matrix_1_4;
           ct_1 : in  matrix_1_8;
           ht_1 : in  matrix_1_8;
           ht : out  matrix_1_8;
           ct : out  matrix_1_8;
           reset :in std_logic;
           ready : out STD_LOGIC);
end component;

signal           clk :std_logic:='0';
signal           xt :    matrix_1_4;
signal           ct_1 :   matrix_1_8;
signal           ht_1 :   matrix_1_8;
signal           ht :   matrix_1_8;
signal           ct :   matrix_1_8;
signal           ready :  STD_LOGIC;
signal            reset:std_logic:='1'; 


begin

clk<=not(clk) after 10ns;
reset<='0' after 50ns;
xt(0)<=X"00000001";
xt(1)<=X"00000002";
xt(2)<=X"00000003";
xt(3)<=X"00000004";

ht_1(0)<=X"00000001";
ht_1(1)<=X"00000002";
ht_1(2)<=X"00000003";
ht_1(3)<=X"00000004";
ht_1(4)<=X"00000005";
ht_1(5)<=X"00000006";
ht_1(6)<=X"00000007";
ht_1(7)<=X"00000008";
 
ct_1(0)<=X"00000010";
ct_1(1)<=X"00000020";
ct_1(2)<=X"00000030";
ct_1(3)<=X"00000040";
ct_1(4)<=X"00000050";
ct_1(5)<=X"00000060";
ct_1(6)<=X"00000070";
ct_1(7)<=X"00000080";



cell1: LSTM_cell  
    Port map ( clk =>clk,
           xt =>xt,
           ct_1 =>ct_1,
           ht_1 =>ht_1,
           ht =>ht,
           ct =>ct,
           reset =>reset,
           ready =>ready);
 







end Behavioral;
