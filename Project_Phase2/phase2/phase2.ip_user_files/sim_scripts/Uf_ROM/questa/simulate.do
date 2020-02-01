onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Uf_ROM_opt

do {wave.do}

view wave
view structure
view signals

do {Uf_ROM.udo}

run -all

quit -force
