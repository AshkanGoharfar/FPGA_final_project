@echo off
set xv_path=E:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xsim LSTM_cell_tb_behav -key {Behavioral:sim_1:Functional:LSTM_cell_tb} -tclbatch LSTM_cell_tb.tcl -view D:/Ashkan works/VHDL_project_2/phase2/LSTM_cell_tb_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
