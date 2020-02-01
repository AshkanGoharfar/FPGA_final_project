onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+Wo_ROM -L xil_defaultlib -L secureip -O5 xil_defaultlib.Wo_ROM

do {wave.do}

view wave
view structure

do {Wo_ROM.udo}

run -all

endsim

quit -force
