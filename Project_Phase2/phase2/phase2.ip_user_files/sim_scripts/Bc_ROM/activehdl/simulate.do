onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+Bc_ROM -L xil_defaultlib -L secureip -O5 xil_defaultlib.Bc_ROM

do {wave.do}

view wave
view structure

do {Bc_ROM.udo}

run -all

endsim

quit -force
