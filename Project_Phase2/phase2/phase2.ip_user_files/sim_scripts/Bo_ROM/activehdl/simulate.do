onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+Bo_ROM -L xil_defaultlib -L secureip -O5 xil_defaultlib.Bo_ROM

do {wave.do}

view wave
view structure

do {Bo_ROM.udo}

run -all

endsim

quit -force
