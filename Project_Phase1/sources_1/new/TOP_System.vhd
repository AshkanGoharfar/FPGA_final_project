library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library work;
use work.aes_pkg.all;

entity TOP_System is
  Port ( 
      clk: in std_logic;
      rst: in std_logic;
      plaintext: in datablock;
      keyblock: in datablocky;
      ciphertext: out datablocks);
end TOP_System;

architecture Behavioral of TOP_System is

component aes_top is
    port(
        clk_i: in std_logic;
        rst_i: in std_logic;
        plaintext_i: in datablock;
        keyblock_i: in datablock;
        ciphertext_o: out datablock
        );
end component;
begin
    
    aes_top00 :  aes_top
    port map(
        clk_i => clk,
        rst_i => rst,
        plaintext_i => plaintext,
        keyblock_i => keyblock(0),
        ciphertext_o => ciphertext(0,0));
        
    aes_top01 :  aes_top
        port map(
            clk_i => clk,
            rst_i => rst,
            plaintext_i => plaintext,
            keyblock_i => keyblock(0),
            ciphertext_o => ciphertext(0,1));

    aes_top10 :  aes_top
    port map(
        clk_i => clk,
        rst_i => rst,
        plaintext_i => plaintext,
        keyblock_i => keyblock(1),
        ciphertext_o => ciphertext(1,0));

    aes_top11 :  aes_top
    port map(
        clk_i => clk,
        rst_i => rst,
        plaintext_i => plaintext,
        keyblock_i => keyblock(1),
        ciphertext_o => ciphertext(1,1));

end Behavioral;
