onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+Ui_ROM -L xil_defaultlib -L secureip -O5 xil_defaultlib.Ui_ROM

do {wave.do}

view wave
view structure

do {Ui_ROM.udo}

run -all

endsim

quit -force
