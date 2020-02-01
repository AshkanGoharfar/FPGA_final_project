onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+Bf_ROM -L xil_defaultlib -L secureip -O5 xil_defaultlib.Bf_ROM

do {wave.do}

view wave
view structure

do {Bf_ROM.udo}

run -all

endsim

quit -force
