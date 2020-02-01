onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+Uf_ROM -L xil_defaultlib -L secureip -O5 xil_defaultlib.Uf_ROM

do {wave.do}

view wave
view structure

do {Uf_ROM.udo}

run -all

endsim

quit -force
