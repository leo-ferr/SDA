transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/leonardo/Desktop/sda/SDA/utils.vhd}
vcom -93 -work work {C:/Users/leonardo/Desktop/sda/SDA/mux_8_1.vhd}
vcom -93 -work work {C:/Users/leonardo/Desktop/sda/SDA/registrador.vhd}
vcom -93 -work work {C:/Users/leonardo/Desktop/sda/SDA/datapath.vhd}
vcom -93 -work work {C:/Users/leonardo/Desktop/sda/SDA/mux_2_1.vhd}

