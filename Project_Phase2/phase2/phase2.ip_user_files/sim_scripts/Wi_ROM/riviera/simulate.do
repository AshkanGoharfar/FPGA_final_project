onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+Wi_ROM -L xil_defaultlib -L secureip -O5 xil_defaultlib.Wi_ROM

do {wave.do}

view wave
view structure

do {Wi_ROM.udo}

run -all

endsim

quit -force
