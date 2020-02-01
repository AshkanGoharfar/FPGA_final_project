onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Bi_ROM_opt

do {wave.do}

view wave
view structure
view signals

do {Bi_ROM.udo}

run -all

quit -force
