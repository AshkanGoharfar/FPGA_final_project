onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+Uc_ROM -L xil_defaultlib -L secureip -O5 xil_defaultlib.Uc_ROM

do {wave.do}

view wave
view structure

do {Uc_ROM.udo}

run -all

endsim

quit -force
