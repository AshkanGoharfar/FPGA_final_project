onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Bf_ROM_opt

do {wave.do}

view wave
view structure
view signals

do {Bf_ROM.udo}

run -all

quit -force
