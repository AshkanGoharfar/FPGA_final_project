vlib work
vlib msim

vlib msim/xil_defaultlib

vmap xil_defaultlib msim/xil_defaultlib

vcom -work xil_defaultlib -64 -93 \
"../../../../phase2.srcs/sources_1/ip/Uf_ROM/Uf_ROM_sim_netlist.vhdl" \


