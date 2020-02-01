library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

library work;
use work.aes_pkg.all;

entity ComplexSystem is
  Port ( 
      clk: in std_logic;
      rst: in std_logic;
      mode: in std_logic_vector(1 downto 0);
      plain_text: in std_logic_vector(31 downto 0);
      keyblock: in datablocky;
      ciphertext: out datablocky);
end ComplexSystem ;

architecture Behavioral of ComplexSystem  is

    component FFT_WB is 
        generic (WB_Width:integer:=32;--Filter width signals of in/out
                    Adress_wordwidth:integer:=32 ;
                    N:integer:=1024;--width word of coefs
                    reg_control:integer:=0;
                    reg_data:integer:=4;
                    reg_status:integer:=8;
                    reg_memory:integer:=12
                    
                    );
        
        port(
        DAT_I: in std_logic_vector(WB_Width-1 downto 0);
        DAT_O:out std_logic_vector(WB_Width-1 downto 0);
        ADR_I :in std_logic_vector(Adress_wordwidth-1 downto 0);
        STB_I,RST_I,CLK_I,WE_I: in std_logic;
        ACK_O: out   std_logic
        );
    end component;

component TOP_System is
  Port ( 
      clk: in std_logic;
      rst: in std_logic;
      plaintext: in datablock;
      keyblock: in datablocky;
      ciphertext: out datablocks);
    end component;
 signal ciphertext0: datablocks;
 
 signal ff_in : std_logic_vector(31 downto 0);
 signal adr_in : std_logic_vector(31 downto 0);
 signal ff_in1 : std_logic_vector(31 downto 0);
 signal adr_in1 : std_logic_vector(31 downto 0);
 signal ff_out : std_logic_vector(31 downto 0);
 signal ff_out1 : std_logic_vector(31 downto 0);
 signal ff_res : std_logic_vector(191 downto 0);
 signal ff_res0 : std_logic_vector(63 downto 0);
 signal ff_res1: std_logic_vector(127 downto 0);
 signal ff_res2: std_logic_vector(191 downto 0);
 signal ff_res3 : std_logic_vector(191 downto 0);
 signal ff_blocks : datablocks;
 signal plaintext : datablock;
 signal res : datablocks;
 signal ff_block00 : datablock;
 signal ff_block10 : datablock;
 signal ff_block01 : datablock;
 signal ff_block11 : datablock;

begin
    plaintext(0,0) <= plain_text(7 downto 0);
    plaintext(0,1) <= plain_text(15 downto 8);
    plaintext(0,2) <= plain_text(23 downto 16);
    plaintext(0,3) <= plain_text(31 downto 24);
    
    plaintext(1,0) <= plain_text(7 downto 0);
    plaintext(1,1) <= plain_text(15 downto 8);
    plaintext(1,2) <= plain_text(23 downto 16);
    plaintext(1,2) <= plain_text(31 downto 24);
    
    plaintext(2,0) <= plain_text(7 downto 0);
    plaintext(2,1) <= plain_text(15 downto 8);
    plaintext(2,2) <= plain_text(23 downto 16);
    plaintext(2,2) <= plain_text(31 downto 24);

    plaintext(3,0) <= plain_text(7 downto 0);
    plaintext(3,1) <= plain_text(15 downto 8);
    plaintext(3,2) <= plain_text(23 downto 16);
    plaintext(3,2) <= plain_text(31 downto 24);
        
    ff_block00(0,0) <= ff_res(1 downto 0) * ff_res(3 downto 2) * x"1";
    ff_block00(1,0) <= ff_res(5 downto 4) * ff_res(7 downto 6)* X"2";
    ff_block00(0,1) <= ff_res(9 downto 8) * ff_res(11 downto 10)* X"3";
    ff_block00(1,1) <= ff_res(25 downto 24) * ff_res(10 downto 9)* X"4";

    ff_block01(0,0) <= ff_res(13 downto 12) * ff_res(115 downto 114)* X"5";
    ff_block01(1,0) <= ff_res(150 downto 149) * ff_res(119 downto 118)* X"6";
    ff_block01(0,1) <= ff_res(161 downto 160) * ff_res(121 downto 120)* X"7";
    ff_block01(1,1) <= ff_res(131 downto 130) * ff_res(160 downto 159)* X"8";
    
    ff_block10(0,0) <= ff_res(70 downto 69) * ff_res(110 downto 109)* X"9";
    ff_block10(1,0) <= ff_res(155 downto 154) * ff_res(100 downto 99)* X"A";
    ff_block10(0,1) <= ff_res(88 downto 87) * ff_res(80 downto 79)* X"B";
    ff_block10(1,1) <= ff_res(135 downto 134) * ff_res(116 downto 117)* X"C";
    
    ff_block11(0,0) <= ff_res(75 downto 74) * ff_res(105 downto 104)* X"D";
    ff_block11(1,0) <= ff_res(15 downto 8) * ff_res(121 downto 120)* X"E";
    ff_block11(0,1) <= ff_res(171 downto 170) * ff_res(163 downto 132)* X"F";
    ff_block11(1,1) <= ff_res(175 downto 174) * ff_res(145 downto 144)* X"A";
    
    ff_blocks(0,0) <= ff_block00;
    ff_blocks(0,1) <= ff_block01;
    ff_blocks(1,0) <= ff_block10;
    ff_blocks(1,1) <= ff_block11;
      
    ff_in <= plaintext(0,0) & plaintext(0,1)&plaintext(0,2) & plaintext(0,3); 
    adr_in <= plaintext(1,0) & plaintext(1,1)&plaintext(1,2) & plaintext(1,3);
    ff_in1 <= plaintext(2,0) & plaintext(2,1)&plaintext(2,2) & plaintext(2,3) ;
    adr_in1 <= plaintext(3,0) & plaintext(3,1)&plaintext(3,2) & plaintext(3,3);
    
    fftB : FFT_WB 
       port map(
        DAT_I => ff_in,
        DAT_O => ff_out,
        ADR_I => adr_in,
        STB_I => '1' ,RST_I =>'0' ,CLK_I => clk,
        WE_I => '1',
        ACK_O => open
    );
    fftB1 : FFT_WB 
           port map(
            DAT_I => ff_in1,
            DAT_O => ff_out1,
            ADR_I => adr_in1,
            STB_I => '1' ,RST_I =>'0' ,CLK_I => clk,
            WE_I => '1',
            ACK_O => open
        );        
    ff_res0 <= (ff_out1 * ff_out);
    ff_res1 <= (((ff_out1 * ff_out) * (ff_res0 + ff_out)));
    ff_res2 <= ((ff_out * ff_out1 * ff_res1 ) );
    ff_res3 <=  ff_res2 + ff_res2 ;
    ff_res <= (ff_res2 xor ff_res3);
    aes_system0 :  TOP_System
    port map(
        clk => clk,
        rst => rst,
        plaintext => plaintext,
        keyblock => keyblock,
        ciphertext => ciphertext0);

    res <= ciphertext0 when mode="00" else ff_blocks when  mode="01";
    with mode select
    ciphertext(0) <= res(0,0) when "00",
                     res(0,1) when "01",
                     res(1,0) when "10",
                     res(1,1) when "11";
    
    
    

end Behavioral;
