----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/24/2019 11:12:57 AM
-- Design Name: 
-- Module Name: LSTM_cell - Behavioral
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
use ieee.std_logic_unsigned.all;
 
LIBRARY work;
USE work.neurals_utils.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;



entity LSTM_cell is
    Port ( clk : in STD_LOGIC;
           xt : in   matrix_1_4;
           ct_1 : in  matrix_1_8;
           ht_1 : in  matrix_1_8;
           ht : out  matrix_1_8;
           ct : out  matrix_1_8;
           reset :in std_logic;
           ready : out STD_LOGIC);
end LSTM_cell;

architecture Behavioral of LSTM_cell is


-------------------------------------------------------
component add_module  
    Port (
       inputx : in std_logic_vector(31 downto 0);
       inputy : in std_logic_vector(31 downto 0);
       output : out std_logic_vector(31 downto 0));
end component;
--------------------------------------------------------
component matrix_multipler  
    Generic (
      input_a_rows : integer := 3;
      input_a_cols : integer := 3;
      input_b_rows : integer := 3;
      input_b_cols : integer := 3
    );
    Port (
           clk : in std_logic;
           rst : in std_logic;
           enable_a : in std_logic;
           enable_b : in std_logic;
           input_a : in std_logic_vector(31 downto 0);
           input_b : in std_logic_vector(31 downto 0);
           enable_r : in std_logic;
           output : out std_logic_vector(31 downto 0));
end component;
---------------------------------------------------
component multiplier_module 
    Port (
       inputx : in std_logic_vector(31 downto 0);
       inputy : in std_logic_vector(31 downto 0);
       output : out std_logic_vector(31 downto 0));
end component;
-----------------------------------------------------
component sigmoid_module  
    Port (
           clk : in std_logic;
           enable : in std_logic;
           input : in std_logic_vector(31 downto 0);
           output : out std_logic_vector(31 downto 0));
end component;
--------------------------------------------------------
component tanh_module  
    Port (
           clk : in std_logic;
           enable : in std_logic;
           input : in std_logic_vector(31 downto 0);
           output : out std_logic_vector(31 downto 0));
end component;
----------------------------------------------------------
COMPONENT Wc_ROM
  PORT (
    a : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    clk : IN STD_LOGIC;
    spo : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;
---------------------------------------------------------
COMPONENT Wf_ROM
  PORT (
    a : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    clk : IN STD_LOGIC;
    spo : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;
--------------------------------------------------------
COMPONENT Wi_ROM
  PORT (
    a : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    clk : IN STD_LOGIC;
    spo : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;
-----------------------------------------------------
COMPONENT Wo_ROM
  PORT (
    a : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    clk : IN STD_LOGIC;
    spo : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;
----------------------------------------
COMPONENT Uc_ROM
  PORT (
    a : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    clk : IN STD_LOGIC;
    spo : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;
--------------------------------------------
COMPONENT Uf_ROM
  PORT (
    a : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    clk : IN STD_LOGIC;
    spo : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;
----------------------------------------------
COMPONENT Ui_ROM
  PORT (
    a : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    clk : IN STD_LOGIC;
    spo : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;
----------------------------------------
COMPONENT Uo_ROM
  PORT (
    a : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    clk : IN STD_LOGIC;
    spo : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;
---------------------------------------------
COMPONENT Bc_ROM
  PORT (
    a : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    clk : IN STD_LOGIC;
    spo : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;
-------------------------------------------------
COMPONENT Bf_ROM
  PORT (
    a : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    clk : IN STD_LOGIC;
    spo : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;
------------------------------------------------------
COMPONENT Bi_ROM
  PORT (
    a : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    clk : IN STD_LOGIC;
    spo : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;
--------------------------------------------------------
COMPONENT Bo_ROM
  PORT (
    a : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    clk : IN STD_LOGIC;
    spo : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;
---------------------------------------------------------




signal rst :std_logic:='1';
signal enable_x1  :std_logic:='0';
signal enable_w1  :std_logic:='0';
signal enable_h1  :std_logic:='0';
signal enable_u1  :std_logic:='0';



signal row1_xt :std_logic_vector(31 downto 0);
signal row2_wf :std_logic_vector(31 downto 0);
signal row2_wc :std_logic_vector(31 downto 0);
signal row2_wi :std_logic_vector(31 downto 0);
signal row2_wo :std_logic_vector(31 downto 0);


signal row1_ht_1 :std_logic_vector(31 downto 0);
signal row2_uf :std_logic_vector(31 downto 0);
signal row2_uc :std_logic_vector(31 downto 0);
signal row2_ui :std_logic_vector(31 downto 0);
signal row2_uo :std_logic_vector(31 downto 0);



signal Wc_buff : matrix_1_32;
signal Wf_buff : matrix_1_32;
signal Wi_buff : matrix_1_32;
signal Wo_buff : matrix_1_32;

signal uc_buff : matrix_1_64;
signal uf_buff : matrix_1_64;
signal ui_buff : matrix_1_64;
signal uo_buff : matrix_1_64;

signal Bc_buff : matrix_1_8;
signal Bf_buff  : matrix_1_8;
signal Bi_buff : matrix_1_8;
signal Bo_buff : matrix_1_8;




signal out_xwf :std_logic_vector(31 downto 0);
signal out_xwc :std_logic_vector(31 downto 0);
signal out_xwi :std_logic_vector(31 downto 0);
signal out_xwo :std_logic_vector(31 downto 0);
 
signal out_huf :std_logic_vector(31 downto 0);
signal out_huc :std_logic_vector(31 downto 0);
signal out_hui :std_logic_vector(31 downto 0);
signal out_huo :std_logic_vector(31 downto 0); 
 

signal enable_r1 :std_logic:='0'; 
----------------------------------------------------------
signal  wc_rom_add: STD_LOGIC_VECTOR(4 DOWNTO 0); 
signal  wf_rom_add: STD_LOGIC_VECTOR(4 DOWNTO 0);
signal  wi_rom_add: STD_LOGIC_VECTOR(4 DOWNTO 0);
signal  wo_rom_add: STD_LOGIC_VECTOR(4 DOWNTO 0);

    
signal  wc :STD_LOGIC_VECTOR(31 DOWNTO 0);
signal  wf :STD_LOGIC_VECTOR(31 DOWNTO 0);
signal  wi :STD_LOGIC_VECTOR(31 DOWNTO 0);
signal  wo :STD_LOGIC_VECTOR(31 DOWNTO 0);
---------------------------------------------------
signal  bc_rom_add: STD_LOGIC_VECTOR(3 DOWNTO 0); 
signal  bf_rom_add: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal  bi_rom_add: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal  bo_rom_add: STD_LOGIC_VECTOR(3 DOWNTO 0);
    
signal  bc :STD_LOGIC_VECTOR(31 DOWNTO 0);
signal  bf :STD_LOGIC_VECTOR(31 DOWNTO 0);
signal  bi :STD_LOGIC_VECTOR(31 DOWNTO 0);
signal  bo :STD_LOGIC_VECTOR(31 DOWNTO 0);
---------------------------------------------------
signal  uc_rom_add: STD_LOGIC_VECTOR(5 DOWNTO 0); 
signal  uf_rom_add: STD_LOGIC_VECTOR(5 DOWNTO 0);
signal  ui_rom_add: STD_LOGIC_VECTOR(5 DOWNTO 0);
signal  uo_rom_add: STD_LOGIC_VECTOR(5 DOWNTO 0);
    
signal  uc :STD_LOGIC_VECTOR(31 DOWNTO 0);
signal  uf :STD_LOGIC_VECTOR(31 DOWNTO 0);
signal  ui :STD_LOGIC_VECTOR(31 DOWNTO 0);
signal  uo :STD_LOGIC_VECTOR(31 DOWNTO 0);
---------------------------------------------------
type f_st  is (f_reset,loads,start,mult_xw,wait_mult_xw_hu,read_mult_xw_hu,wait_load_a,load_b,cal1,cal2,cal3,cal4,cal5,result);
signal f_state :f_st:=f_reset;
signal row_index_xt : integer:=0;
signal row_index_ht_1 : integer:=0;
signal column_index :integer:=0;
 
 
signal   row_index_w : integer:=0;
signal   row_index_u : integer:=0; --for U
signal   row_index_b : integer:=0; --for b


signal   enable_xw  :std_logic:='0';
signal   enable_hu  :std_logic:='0';


 
signal index_xw :integer:=0;
signal index_hu :integer:=0;

signal index_sum :integer:=0;

signal sum_f_matrix :matrix_1_8;
signal sum_c_matrix :matrix_1_8;
signal sum_i_matrix :matrix_1_8;
signal sum_o_matrix :matrix_1_8;
 

signal  xwf :matrix_1_8;
signal  xwc :matrix_1_8;
signal  xwi :matrix_1_8;
signal  xwo :matrix_1_8;


signal  huf :matrix_1_8;
signal  huc :matrix_1_8;
signal  hui :matrix_1_8;
signal  huo :matrix_1_8;

signal ft :matrix_1_8;
signal it :matrix_1_8;
signal ot :matrix_1_8;
signal ct_bar :matrix_1_8;

signal enable_sig:std_logic:='0';
signal enable_tanh:std_logic:='0';

signal sum_f_matrix_element :STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sum_i_matrix_element :STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sum_o_matrix_element :STD_LOGIC_VECTOR(31 DOWNTO 0);
signal sum_c_bar_matrix_element :STD_LOGIC_VECTOR(31 DOWNTO 0);

signal  sum_ft_matrix_element :STD_LOGIC_VECTOR(31 DOWNTO 0);
signal  sum_it_matrix_element :STD_LOGIC_VECTOR(31 DOWNTO 0);
signal  sum_ot_matrix_element :STD_LOGIC_VECTOR(31 DOWNTO 0);
signal  sum_ct_bar_matrix_element :STD_LOGIC_VECTOR(31 DOWNTO 0);


signal index_col :integer:=0;
signal delay_mult_xw :integer:=16;


 
signal  fct_1 :matrix_1_8;
signal  ict  :matrix_1_8;
 
signal enable_tanh_ct_bar :std_logic:='1';
 
signal tanh_ct_bar :matrix_1_8; 
signal delay_calculation: integer;


begin
Wc_inst: Wc_ROM
  PORT MAP (
    a => wc_rom_add,
    clk => clk,
    spo => wc
  );
Wf_inst: Wf_ROM
    PORT MAP (
      a => wf_rom_add,
      clk => clk,
      spo => wf
    );
Wi_inst: Wi_ROM
      PORT MAP (
        a => wi_rom_add,
        clk => clk,
        spo => wi
      ); 
Wo_inst: Wo_ROM
        PORT MAP (
          a => wo_rom_add,
          clk => clk,
          spo => wo
        );
-----------------------------------------        
Bc_inst:  Bc_ROM
          PORT MAP (
            a => bc_rom_add,
            clk => clk,
            spo => bc
          );                 
Bf_inst:  Bf_ROM
             PORT MAP (
               a => bf_rom_add,
               clk => clk,
                spo => bf
                ); 
Bi_inst:  Bi_ROM
                PORT MAP (
               a => bi_rom_add,
               clk => clk,
                spo => bi
                ); 
Bo_inst:  Bo_ROM
                 PORT MAP (
                a => bo_rom_add,
                clk => clk,
                spo => bo
                  );  
----------------------------------------                                        
Uc_inst: Uc_ROM
  PORT MAP (
    a => uc_rom_add,
    clk => clk,
    spo => uc
  );  
  
Uf_inst: Uf_ROM
    PORT MAP (
      a => uf_rom_add,
      clk => clk,
      spo => uf
    );  
Ui_inst: Ui_ROM
      PORT MAP (
        a => ui_rom_add,
        clk => clk,
        spo => ui
      ); 
Uo_inst: Uo_ROM
        PORT MAP (
          a => uo_rom_add,
          clk => clk,
          spo => uo
        );  
---------------------------------------------       
  
                                            



--------------------- XW multipliers ---------------------

XWF_multipler1: matrix_multipler 
generic map(
            input_a_rows =>1,
            input_a_cols =>4,
            input_b_rows  => 4,
            input_b_cols  =>8
          )
port map(
           clk =>clk,
           rst =>reset,
           enable_a  =>enable_x1,
           enable_b  =>enable_w1,
           input_a =>row1_xt,
           input_b =>row2_wf,
           enable_r =>enable_xw,
           output =>out_xwf
         );
         
XWc_multipler1: matrix_multipler 
         generic map(
                     input_a_rows =>1,
                     input_a_cols =>4,
                     input_b_rows  => 4,
                     input_b_cols  =>8
                   )
         port map(
                    clk =>clk,
                    rst =>reset,
                    enable_a  =>enable_x1,
                    enable_b  =>enable_w1,
                    input_a =>row1_xt,
                    input_b =>row2_wc,
                    enable_r =>enable_xw,
                    output =>out_xwc
                  );         
XWi_multipler1: matrix_multipler 
                  generic map(
                              input_a_rows =>1,
                              input_a_cols =>4,
                              input_b_rows  => 4,
                              input_b_cols  =>8
                            )
                  port map(
                             clk =>clk,
                             rst =>reset,
                             enable_a  =>enable_x1,
                             enable_b  =>enable_w1,
                             input_a =>row1_xt,
                             input_b =>row2_wi,
                             enable_r =>enable_xw,
                             output =>out_xwi
                           ); 
                           
XWo_multipler1: matrix_multipler 
                           generic map(
                                       input_a_rows =>1,
                                       input_a_cols =>4,
                                       input_b_rows  => 4,
                                       input_b_cols  =>8
                                     )
                           port map(
                                      clk =>clk,
                                      rst =>reset,
                                      enable_a  =>enable_x1,
                                      enable_b  =>enable_w1,
                                      input_a =>row1_xt,
                                      input_b =>row2_wo,
                                      enable_r =>enable_xw,
                                      output =>out_xwo
                                    );                           
                           
----------------------- HU MULTIPLIERS------------------                                   
HUF_multipler1: matrix_multipler 
generic map(
            input_a_rows =>1,
            input_a_cols =>8,
            input_b_rows  => 8,
            input_b_cols  =>8
          )
port map(
           clk =>clk,
           rst =>reset,
           enable_a  =>enable_h1,
           enable_b  =>enable_u1,
           input_a =>row1_ht_1,
           input_b =>row2_uf,
           enable_r =>enable_hu,
           output =>out_huf
         );        
HUC_multipler1: matrix_multipler 
         generic map(
                     input_a_rows =>1,
                     input_a_cols =>8,
                     input_b_rows  => 8,
                     input_b_cols  =>8
                   )
         port map(
                    clk =>clk,
                    rst =>reset,
                    enable_a  =>enable_h1,
                    enable_b  =>enable_u1,
                    input_a =>row1_ht_1,
                    input_b =>row2_uc,
                    enable_r =>enable_hu,
                    output =>out_huc
                  );
 
HUI_multipler1: matrix_multipler 
                           generic map(
                                       input_a_rows =>1,
                                       input_a_cols =>8,
                                       input_b_rows  => 8,
                                       input_b_cols  =>8
                                     )
                           port map(
                                      clk =>clk,
                                      rst =>reset,
                                      enable_a  =>enable_h1,
                                      enable_b  =>enable_u1,
                                      input_a =>row1_ht_1,
                                      input_b =>row2_ui,
                                      enable_r =>enable_hu,
                                      output =>out_hui
                                    ); 
HUO_multipler1: matrix_multipler 
                                       generic map(
                                                         input_a_rows =>1,
                                                         input_a_cols =>8,
                                                         input_b_rows  => 8,
                                                         input_b_cols  =>8
                                                       )
                                         port map(
                                                        clk =>clk,
                                                        rst =>reset,
                                                        enable_a  =>enable_h1,
                                                        enable_b  =>enable_u1,
                                                        input_a =>row1_ht_1,
                                                        input_b =>row2_uo,
                                                        enable_r =>enable_hu,
                                                        output =>out_huo
                                                      );                                    
 
---------------------------- sigmoid ---------------
f_sigmoid: sigmoid_module  
    Port map(
           clk =>clk ,
           enable =>enable_sig,
           input  =>sum_f_matrix_element,
           output =>sum_ft_matrix_element);

i_sigmoid: sigmoid_module  
    Port map(
           clk =>clk ,
           enable =>enable_sig,
           input  =>sum_i_matrix_element,
           output =>sum_it_matrix_element); 
o_sigmoid: sigmoid_module  
               Port map(
                      clk =>clk ,
                      enable =>enable_sig,
                      input  =>sum_o_matrix_element,
                      output =>sum_ot_matrix_element); 
 ------------------- tanh-----------------------
ct_bat: tanh_module  
                Port map(
                       clk =>clk ,
                       enable =>enable_tanh,
                       input  =>sum_c_bar_matrix_element,
                       output =>sum_ct_bar_matrix_element); 
 
 -------------------------- mulilier one by one--------

fc: for i in 0 to 7 generate
fci: multiplier_module 
     Port map(
        inputx =>ft(i),
        inputy =>ct_1(i), 
        output =>fct_1(i) );  
 end generate fc;
 
 
ic: for i in 0 to 7 generate
ici: multiplier_module 
      Port map(
         inputx =>it(i),
         inputy =>ct_bar(i), 
         output =>ict(i) );  
  end generate ic;
------------------- add one by one -------------
ct_out: for i in 0 to 7 generate
ct_outi: add_module 
      Port map(
         inputx =>fct_1(i),
         inputy =>ict(i), 
         output =>ct(i) );  
  end generate ct_out;

----------------------tanhct_bar----------
th_ct_bar: for i in 0 to 7 generate
  
th_ct_bar_i:   tanh_module  
                Port map(
                       clk =>clk ,
                       enable =>enable_tanh_ct_bar,
                       input  =>ct_bar(i),
                       output =>tanh_ct_bar(i)); 
 
end generate;
------------------multipli one by one ----------------
tho: for i in 0 to 7 generate
thoi: multiplier_module 
     Port map(
        inputx =>tanh_ct_bar(i),
        inputy =>Ot(i), 
        output =>ht(i) );  
 end generate;
         
 ---------------------------------------------------        
process(clk,reset)




begin

if rising_edge(clk) then

 
  case f_state is
   when f_reset =>
          ready<='1';
          enable_x1<='0';
          enable_w1<='0';
          enable_h1<='0';
          enable_u1<='0';
          
          
          
          row_index_xt<=0;
          row_index_ht_1<=0;
          row_index_b<=0;
          
          column_index<=0;
          row1_xt<=xt(row_index_xt);
          row1_ht_1<=ht_1(row_index_ht_1);
          row_index_w<=0;
          row_index_u<=0;
          row_index_b<=0;
          wf_rom_add<=std_logic_vector(to_unsigned(row_index_w,5));
          wc_rom_add<=std_logic_vector(to_unsigned(row_index_w,5));  
          wi_rom_add<=std_logic_vector(to_unsigned(row_index_w,5));   
          wo_rom_add<=std_logic_vector(to_unsigned(row_index_w,5));
          
           uf_rom_add<=std_logic_vector(to_unsigned(row_index_u,6));
           uc_rom_add<=std_logic_vector(to_unsigned(row_index_u,6));  
           ui_rom_add<=std_logic_vector(to_unsigned(row_index_u,6));   
           uo_rom_add<=std_logic_vector(to_unsigned(row_index_u,6));
 
           bf_rom_add<=std_logic_vector(to_unsigned(row_index_b,4));
           bc_rom_add<=std_logic_vector(to_unsigned(row_index_b,4));  
           bi_rom_add<=std_logic_vector(to_unsigned(row_index_b,4));   
           bo_rom_add<=std_logic_vector(to_unsigned(row_index_b,4));         
          
          
                  
           if reset='0' then
               f_state<= loads;
               row_index_w<=row_index_w+1;
               wf_rom_add<=std_logic_vector(to_unsigned(row_index_w,5));
               wc_rom_add<=std_logic_vector(to_unsigned(row_index_w,5));
               wi_rom_add<=std_logic_vector(to_unsigned(row_index_w,5));
               wo_rom_add<=std_logic_vector(to_unsigned(row_index_w,5));
               
               row_index_u<=row_index_u+1;
               uf_rom_add<=std_logic_vector(to_unsigned(row_index_u,6));
               uc_rom_add<=std_logic_vector(to_unsigned(row_index_u,6));  
               ui_rom_add<=std_logic_vector(to_unsigned(row_index_u,6));   
               uo_rom_add<=std_logic_vector(to_unsigned(row_index_u,6));
               
               row_index_b<=row_index_b+1;
               bf_rom_add<=std_logic_vector(to_unsigned(row_index_b,4));
               bc_rom_add<=std_logic_vector(to_unsigned(row_index_b,4));  
               bi_rom_add<=std_logic_vector(to_unsigned(row_index_b,4));   
               bo_rom_add<=std_logic_vector(to_unsigned(row_index_b,4));
                            
               
               
                                
           end if;
           
    when loads=>
    
 -----------------------  B factor load ---------------------   
    if row_index_b<2 then
    row_index_b<=row_index_b+1;
    bf_rom_add<=std_logic_vector(to_unsigned(row_index_b,4));
    bc_rom_add<=std_logic_vector(to_unsigned(row_index_b,4));  
    bi_rom_add<=std_logic_vector(to_unsigned(row_index_b,4));   
    bo_rom_add<=std_logic_vector(to_unsigned(row_index_b,4));
                 
    

 elsif row_index_b<10 and row_index_b>=2   then
   row_index_b<=row_index_b+1;
   bf_rom_add<=std_logic_vector(to_unsigned(row_index_b,4));
   bc_rom_add<=std_logic_vector(to_unsigned(row_index_b,4));  
   bi_rom_add<=std_logic_vector(to_unsigned(row_index_b,4));   
   bo_rom_add<=std_logic_vector(to_unsigned(row_index_b,4));
   
   Bf_buff(row_index_b-2)<=Bf; 
   Bc_buff(row_index_b-2)<=Bc;
   Bo_buff(row_index_b-2)<=Bo;
   Bi_buff(row_index_b-2)<=Bi;
   
            
end if; 
 ----------------------- W factor load ------------------------ 
           if row_index_w<2 then
              row_index_w<=row_index_w+1;
              wf_rom_add<=std_logic_vector(to_unsigned(row_index_w,5));
              wc_rom_add<=std_logic_vector(to_unsigned(row_index_w,5));
              wi_rom_add<=std_logic_vector(to_unsigned(row_index_w,5));
              wo_rom_add<=std_logic_vector(to_unsigned(row_index_w,5)); 
           elsif row_index_w<34 and row_index_w>=2   then
             row_index_w<=row_index_w+1;
             wf_rom_add<=std_logic_vector(to_unsigned(row_index_w,5));
             wc_rom_add<=std_logic_vector(to_unsigned(row_index_w,5));
             wi_rom_add<=std_logic_vector(to_unsigned(row_index_w,5));
             wo_rom_add<=std_logic_vector(to_unsigned(row_index_w,5));
             Wf_buff(row_index_w-2)<=Wf; 
             Wc_buff(row_index_w-2)<=Wc;
             Wo_buff(row_index_w-2)<=Wo;
             Wi_buff(row_index_w-2)<=Wi;
             
     
                      
         end if;
  ----------------------------U factor load----------------------
  if row_index_u<2 then
     row_index_u<=row_index_u+1;
     uf_rom_add<=std_logic_vector(to_unsigned(row_index_u,6));
     uc_rom_add<=std_logic_vector(to_unsigned(row_index_u,6));
     ui_rom_add<=std_logic_vector(to_unsigned(row_index_u,6));
     uo_rom_add<=std_logic_vector(to_unsigned(row_index_u,6)); 
  elsif row_index_u<66 and row_index_u>=2   then
    row_index_u<=row_index_u+1;
    uf_rom_add<=std_logic_vector(to_unsigned(row_index_u,6));
    uc_rom_add<=std_logic_vector(to_unsigned(row_index_u,6));
    ui_rom_add<=std_logic_vector(to_unsigned(row_index_u,6));
    uo_rom_add<=std_logic_vector(to_unsigned(row_index_u,6));
    Uf_buff(row_index_u-2)<=Uf; 
    Uc_buff(row_index_u-2)<=Uc;
    Uo_buff(row_index_u-2)<=Uo;
    Ui_buff(row_index_u-2)<=Ui;
    
elsif  row_index_U=66  then
    f_state<=Mult_xw; 
    
    row_index_xt<=row_index_xt+1;
    row1_xt<=xt(row_index_xt); 
    
    row_index_ht_1<=row_index_ht_1+1;
    row1_ht_1<=ht_1(row_index_ht_1); 
     enable_h1<='1';
     enable_u1<='1';
     enable_x1<='1';
     enable_w1<='1';
     
     row_index_u<=1;
     row2_uf<=Uf_buff(0);
     row2_uc<=Uc_buff(0);
     row2_ui<=Ui_buff(0);
     row2_uo<=Uo_buff(0);
     
     
     row_index_w<=1;
     row2_wf<=Wf_buff(0);
     row2_wc<=Wc_buff(0);
     row2_wi<=Wi_buff(0);
     row2_wo<=Wo_buff(0);
     
     
             
end if;
  
  
  
     
       
    when Mult_xw =>
 ------------------XW mult----------------------------       
      if row_index_xt<4 then
         row_index_xt<=row_index_xt+1;
         enable_x1<='1';
         row1_xt<=xt(row_index_xt);
         
      elsif row_index_xt=4 then
         enable_x1<='1'; 
         row_index_xt<=5;
                   
      end if;
      if row_index_w<32 then
         row_index_w<=row_index_w+1;
         enable_w1<='1';
         row2_wf<=Wf_buff(row_index_w);
         row2_wc<=Wc_buff(row_index_w);
         row2_wi<=Wi_buff(row_index_w);
         row2_wo<=Wo_buff(row_index_w);
      elsif row_index_w=32 then
          enable_w1<='1'; 
          --f_state<=wait_mult_xw_hu; 
         -- delay_mult_xw<=16;
         -- index_xw<=0;
                   
      end if;
 ---------------------- hU mult
   if row_index_ht_1<8 then
    row_index_ht_1<=row_index_ht_1+1;
    enable_h1<='1';
    row1_ht_1<=ht_1(row_index_ht_1);
    
 elsif row_index_ht_1=8 then
    enable_h1<='1'; 
    row_index_ht_1<=9;
              
 end if;
 if row_index_U<64 then
    row_index_u<=row_index_u+1;
    enable_u1<='1';
    row2_uf<=Uf_buff(row_index_u);
    row2_uc<=Uc_buff(row_index_u);
    row2_ui<=Ui_buff(row_index_u);
    row2_uo<=Uo_buff(row_index_u);
 elsif row_index_u=64 then
 
     enable_w1<='1'; 
     enable_u1<='1';
     
     index_xw<=0;
     index_hu<=0;
 
       
     f_state<=wait_mult_xw_hu; 
     delay_mult_xw<=32;
     
              
 end if;     
      
 

    when wait_mult_xw_hu =>
       enable_x1<='1';
       enable_w1<='1';
       enable_h1<='1';
       enable_u1<='1';       
       
       
       if delay_mult_xw>1 then
          delay_mult_xw<=delay_mult_xw-1;
          index_xw<=0;
          index_hu<=0;
   
       elsif delay_mult_xw=1 then
         delay_mult_xw<=delay_mult_xw-1;
         enable_xw<='1';
         enable_hu<='1';
         index_xw<=0;
         index_hu<=0;
          
       else
          enable_xw<='1';
          enable_hu<='1';
          index_xw<=0;
          index_hu<=0;
          xwf(index_xw)<=out_xwf;
          xwc(index_xw)<=out_xwc;
          xwi(index_xw)<=out_xwi;
          xwo(index_xw)<=out_xwo;
          
          huf(index_hu)<=out_huf;
          huc(index_hu)<=out_huc;
          hui(index_hu)<=out_hui;
          huo(index_hu)<=out_huo;         
          
          
          
          f_state<=read_mult_xw_hu;
 
      end if;
    when read_mult_xw_hu =>
    
        enable_xw<='1';
        enable_hu<='1';
       if index_xw<8 then
          xwf(index_xw)<=out_xwf;
          xwc(index_xw)<=out_xwc;
          xwi(index_xw)<=out_xwi;
          xwo(index_xw)<=out_xwo;
          
          huf(index_xw)<=out_huf;
          huc(index_xw)<=out_huc;
          hui(index_xw)<=out_hui;
          huo(index_xw)<=out_huo;
          
          
          
          index_xw<=index_xw+1;
       else
         f_state<=cal1; 
         enable_xw<='0';
         enable_hu<='0';
         index_sum<=0;
         
      end if; 
    
    when cal1=>
        if index_sum<8 then
          index_sum<=index_sum+1;
          sum_f_matrix(index_sum)<=xwf(index_sum)+ huf(index_sum)+Bf_buff(index_sum);
          sum_c_matrix(index_sum)<=xwc(index_sum)+ huc(index_sum)+Bc_buff(index_sum);
          sum_i_matrix(index_sum)<=xwi(index_sum)+ hui(index_sum)+Bi_buff(index_sum);
          sum_o_matrix(index_sum)<=xwo(index_sum)+ huo(index_sum)+Bo_buff(index_sum);
        else
          f_state<=cal2;
          index_col<=0;
          enable_sig<='1';
          enable_tanh<='1';
          sum_f_matrix_element<=sum_f_matrix(0);
           
        end if;
    when cal2 =>
      if index_col <8 then
         index_col<=index_col+1;
         sum_f_matrix_element<=sum_f_matrix(index_col);
         sum_i_matrix_element<=sum_i_matrix(index_col);
         sum_o_matrix_element<=sum_o_matrix(index_col);
         sum_c_bar_matrix_element<=sum_c_matrix(index_col);
         enable_sig<='1';
         enable_tanh<='1';
      elsif index_col <13 then 
          index_col<=index_col+1;      
      else
         f_state<=cal3;   
      end if;
      
      if index_col >5 then   --just for latency
        ft(index_col-6)<=sum_ft_matrix_element;
        it(index_col-6)<=sum_it_matrix_element;
        ot(index_col-6)<=sum_ot_matrix_element;
        ct_bar(index_col-6)<=sum_ct_bar_matrix_element;
        
        
      end if;
      
      
    when cal3 =>
           enable_sig<='0';
           enable_tanh<='0';
           delay_calculation<=10;
           f_state<=cal4;
    when cal4 =>
       if delay_calculation>0 then
         delay_calculation<=delay_calculation-1;
       else
          f_state<=result;
       end if;       
    when result=>
          ready<='1'; 
    when others=>
     
  
  end case;
 end if;        
         
end process;         

end Behavioral;
