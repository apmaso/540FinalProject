# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/Labs/Lab04/project_lab4/project_lab4.cache/wt [current_project]
set_property parent.project_path /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/Labs/Lab04/project_lab4/project_lab4.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:nexys-a7-100t:part0:1.3 [current_project]
set_property ip_output_repo /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/Labs/Lab04/project_lab4/project_lab4.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
set_property include_dirs {
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Interconnect/AxiInterconnect/pulp-platform.org__axi_0.25.0/include
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/OtherSources/pulp-platform.org__common_cells_1.20.0/include
} [current_fileset]
add_files /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/Labs/Lab04/HW_LAB_4/tower/pic4.coe
add_files /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/Labs/Lab04/HW_LAB_4/tower/pic4old.coe
add_files /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/mycoefile_star.coe
read_verilog {
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/include/common_defines.vh
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Peripherals/gpio/gpio_defines.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Peripherals/ptc/ptc_defines.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/LiteDRAM/serv_1.0.2/rtl/serv_params.vh
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Interconnect/WishboneInterconnect/wb_intercon.vh
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Interconnect/AxiInterconnect/axi_intercon.vh
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Peripherals/uart/uart_defines.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Interconnect/AxiInterconnect/pulp-platform.org__axi_0.25.0/include/axi/typedef.svh
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Interconnect/AxiInterconnect/pulp-platform.org__axi_0.25.0/include/axi/assign.svh
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/OtherSources/pulp-platform.org__common_cells_1.20.0/include/common_cells/registers.svh
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/include/global.h
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/include/pic_map_auto.h
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/include/build.h
}
set_property is_global_include true [get_files /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/include/common_defines.vh]
set_property file_type "Verilog Header" [get_files /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Peripherals/gpio/gpio_defines.v]
set_property file_type "Verilog Header" [get_files /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Peripherals/ptc/ptc_defines.v]
set_property file_type "Verilog Header" [get_files /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Peripherals/uart/uart_defines.v]
set_property file_type "Verilog Header" [get_files /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Interconnect/AxiInterconnect/pulp-platform.org__axi_0.25.0/include/axi/typedef.svh]
set_property file_type "Verilog Header" [get_files /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Interconnect/AxiInterconnect/pulp-platform.org__axi_0.25.0/include/axi/assign.svh]
set_property file_type "Verilog Header" [get_files /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/OtherSources/pulp-platform.org__common_cells_1.20.0/include/common_cells/registers.svh]
set_property file_type "Verilog Header" [get_files /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/include/global.h]
set_property file_type "Verilog Header" [get_files /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/include/pic_map_auto.h]
set_property file_type "Verilog Header" [get_files /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/include/build.h]
read_mem /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/BootROM/sw/boot_main.mem
read_verilog -library xil_defaultlib -sv {
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/OtherSources/pulp-platform.org__common_cells_1.20.0/src/cf_math_pkg.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/OtherSources/pulp-platform.org__common_cells_1.20.0/src/addr_decode.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Interconnect/AxiInterconnect/pulp-platform.org__axi_0.25.0/src/axi_pkg.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Interconnect/AxiInterconnect/pulp-platform.org__axi_0.25.0/src/axi_atop_filter.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Interconnect/AxiInterconnect/pulp-platform.org__axi_0.25.0/src/axi_cdc.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Interconnect/AxiInterconnect/pulp-platform.org__axi_0.25.0/src/axi_demux.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Interconnect/AxiInterconnect/pulp-platform.org__axi_0.25.0/src/axi_err_slv.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Interconnect/AxiInterconnect/pulp-platform.org__axi_0.25.0/src/axi_id_prepend.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Interconnect/AxiInterconnect/axi_intercon.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Interconnect/AxiInterconnect/pulp-platform.org__axi_0.25.0/src/axi_intf.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Interconnect/AxiInterconnect/pulp-platform.org__axi_0.25.0/src/axi_mux.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Interconnect/AxiInterconnect/pulp-platform.org__axi_0.25.0/src/axi_xbar.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/lib/beh_lib.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/OtherSources/pulp-platform.org__common_cells_1.20.0/src/binary_to_gray.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/OtherSources/bscan_tap.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Peripherals/btn/btn_top.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/OtherSources/pulp-platform.org__common_cells_1.20.0/src/cdc_fifo_gray.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/OtherSources/pulp-platform.org__common_cells_1.20.0/src/counter.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/dbg/dbg.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/include/swerv_types.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/dec/dec.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/dec/dec_decode_ctl.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/dec/dec_gpr_ctl.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/dec/dec_ib_ctl.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/dec/dec_tlu_ctl.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/dec/dec_trigger.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/OtherSources/pulp-platform.org__common_cells_1.20.0/src/delta_counter.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/dma/dma_ctrl.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/exu/exu.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/exu/exu_alu_ctl.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/exu/exu_div_ctl.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/exu/exu_mul_ctl.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/OtherSources/pulp-platform.org__common_cells_1.20.0/src/deprecated/fifo_v2.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/OtherSources/pulp-platform.org__common_cells_1.20.0/src/fifo_v3.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/OtherSources/pulp-platform.org__common_cells_1.20.0/src/gray_to_binary.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/ifu/ifu.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/ifu/ifu_aln_ctl.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/ifu/ifu_bp_ctl.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/ifu/ifu_compress_ctl.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/ifu/ifu_ic_mem.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/ifu/ifu_ifc_ctl.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/ifu/ifu_mem_ctl.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/lsu/lsu.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/lsu/lsu_addrcheck.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/lsu/lsu_bus_buffer.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/lsu/lsu_bus_intf.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/lsu/lsu_clkdomain.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/lsu/lsu_dccm_ctl.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/lsu/lsu_dccm_mem.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/lsu/lsu_ecc.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/lsu/lsu_lsc_ctl.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/lsu/lsu_stbuf.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/lsu/lsu_trigger.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/OtherSources/pulp-platform.org__common_cells_1.20.0/src/lzc.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/mem.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/lib/mem_lib.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/pic/pic_ctrl.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/OtherSources/pulp-platform.org__common_cells_1.20.0/src/rr_arb_tree.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/OtherSources/pulp-platform.org__common_cells_1.20.0/src/spill_register.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/OtherSources/pulp-platform.org__common_cells_1.20.0/src/stream_register.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/swerv.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/SweRVEh1CoreComplex/swerv_wrapper_dmi.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/OtherSources/pulp-platform.org__common_cells_1.20.0/src/sync.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Peripherals/vga/vga_top.sv
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/rvfpganexys.sv
}
read_verilog -library xil_defaultlib {
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Interconnect/AxiToWb/axi2wb.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/OtherSources/clk_gen_nexys.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/BootROM/dpram64.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/OtherSources/dtg.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Peripherals/spi/fifo4.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Peripherals/gpio/gpio_top.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/LiteDRAM/litedram_core.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/LiteDRAM/litedram_top.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Peripherals/ptc/ptc_top.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Peripherals/uart/raminfr.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/LiteDRAM/serv_1.0.2/rtl/serv_alu.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/LiteDRAM/serv_1.0.2/rtl/serv_bufreg.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/LiteDRAM/serv_1.0.2/rtl/serv_csr.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/LiteDRAM/serv_1.0.2/rtl/serv_ctrl.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/LiteDRAM/serv_1.0.2/rtl/serv_decode.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/LiteDRAM/serv_1.0.2/rtl/serv_mem_if.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/LiteDRAM/serv_1.0.2/rtl/serv_rf_if.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/LiteDRAM/serv_1.0.2/rtl/serv_rf_ram.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/LiteDRAM/serv_1.0.2/rtl/serv_rf_ram_if.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/LiteDRAM/serv_1.0.2/rtl/serv_rf_top.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/LiteDRAM/serv_1.0.2/rtl/serv_shift.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/LiteDRAM/serv_1.0.2/rtl/serv_state.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/LiteDRAM/serv_1.0.2/rtl/serv_top.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Peripherals/spi/simple_spi_top.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/swervolf_core.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Peripherals/SystemController/swervolf_syscon.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Peripherals/uart/uart_receiver.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Peripherals/uart/uart_regs.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Peripherals/uart/uart_rfifo.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Peripherals/uart/uart_sync_flops.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Peripherals/uart/uart_tfifo.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Peripherals/uart/uart_top.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Peripherals/uart/uart_transmitter.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Peripherals/uart/uart_wb.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Interconnect/WishboneInterconnect/wb_intercon.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/BootROM/wb_mem_wrapper.v
  /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/SweRVolfSoC/Interconnect/WishboneInterconnect/wb_intercon_1.2.2-r1/wb_mux.v
}
read_ip -quiet /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/Labs/Lab04/project_lab4/project_lab4.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci
set_property used_in_implementation false [get_files -all /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/Labs/Lab04/project_lab4/project_lab4.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/Labs/Lab04/project_lab4/project_lab4.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc]
set_property used_in_implementation false [get_files -all /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/Labs/Lab04/project_lab4/project_lab4.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_ooc.xdc]

read_ip -quiet /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/Labs/Lab04/project_lab4/project_lab4.srcs/sources_1/ip/image_ram/image_ram.xci
set_property used_in_implementation false [get_files -all /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/Labs/Lab04/project_lab4/project_lab4.srcs/sources_1/ip/image_ram/image_ram_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/rvfpganexys.xdc
set_property used_in_implementation false [get_files /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/rvfpganexys.xdc]

read_xdc /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/LiteDRAM/liteDRAM.xdc
set_property used_in_implementation false [get_files /home/amass/Documents/ECE540/Lab4/RVfpga-Lab4Fin/src/LiteDRAM/liteDRAM.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top rvfpganexys -part xc7a100tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef rvfpganexys.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file rvfpganexys_utilization_synth.rpt -pb rvfpganexys_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
