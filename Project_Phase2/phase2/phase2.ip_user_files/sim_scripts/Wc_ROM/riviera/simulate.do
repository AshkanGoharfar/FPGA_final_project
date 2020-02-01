onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+Wc_ROM -L xil_defaultlib -L secureip -O5 xil_defaultlib.Wc_ROM

do {wave.do}

view wave
view structure

do {Wc_ROM.udo}

run -all

endsim

quit -force
