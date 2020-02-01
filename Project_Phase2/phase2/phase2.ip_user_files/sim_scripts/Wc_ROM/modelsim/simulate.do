onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xil_defaultlib -L secureip -lib xil_defaultlib xil_defaultlib.Wc_ROM

do {wave.do}

view wave
view structure
view signals

do {Wc_ROM.udo}

run -all

quit -force
