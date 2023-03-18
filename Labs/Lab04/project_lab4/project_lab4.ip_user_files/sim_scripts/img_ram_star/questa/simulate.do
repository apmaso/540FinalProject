onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib img_ram_star_opt

do {wave.do}

view wave
view structure
view signals

do {img_ram_star.udo}

run -all

quit -force
