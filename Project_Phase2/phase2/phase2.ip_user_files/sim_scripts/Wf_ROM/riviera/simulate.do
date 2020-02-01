onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+Wf_ROM -L xil_defaultlib -L secureip -O5 xil_defaultlib.Wf_ROM

do {wave.do}

view wave
view structure

do {Wf_ROM.udo}

run -all

endsim

quit -force
