onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+Bi_ROM -L xil_defaultlib -L secureip -O5 xil_defaultlib.Bi_ROM

do {wave.do}

view wave
view structure

do {Bi_ROM.udo}

run -all

endsim

quit -force
