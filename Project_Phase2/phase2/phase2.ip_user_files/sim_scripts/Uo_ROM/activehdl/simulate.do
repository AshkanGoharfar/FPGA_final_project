onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+Uo_ROM -L xil_defaultlib -L secureip -O5 xil_defaultlib.Uo_ROM

do {wave.do}

view wave
view structure

do {Uo_ROM.udo}

run -all

endsim

quit -force
