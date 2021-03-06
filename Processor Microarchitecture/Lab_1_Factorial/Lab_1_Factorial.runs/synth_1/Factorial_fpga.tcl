# 
# Synthesis run script generated by Vivado
# 

create_project -in_memory -part xc7a35tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/Alti/Lab_1_Factorial/Lab_1_Factorial.cache/wt [current_project]
set_property parent.project_path C:/Users/Alti/Lab_1_Factorial/Lab_1_Factorial.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/Alti/Lab_1_Factorial/Lab_1_Factorial.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  C:/Users/Alti/Lab_1_Factorial/Lab_1_Factorial.srcs/sources_1/imports/new/CMP.v
  C:/Users/Alti/Lab_1_Factorial/Lab_1_Factorial.srcs/sources_1/imports/new/CNT_down.v
  C:/Users/Alti/Lab_1_Factorial/Lab_1_Factorial.srcs/sources_1/imports/new/DP.v
  C:/Users/Alti/Lab_1_Factorial/Lab_1_Factorial.srcs/sources_1/imports/new/Factorial.v
  C:/Users/Alti/Lab_1_Factorial/Lab_1_Factorial.srcs/sources_1/imports/new/MUL.v
  C:/Users/Alti/Lab_1_Factorial/Lab_1_Factorial.srcs/sources_1/imports/new/REG.v
  C:/Users/Alti/Lab_1_Factorial/Lab_1_Factorial.srcs/sources_1/imports/new/bcd_to_7seg.v
  C:/Users/Alti/Lab_1_Factorial/Lab_1_Factorial.srcs/sources_1/imports/new/bin2bcd32.v
  C:/Users/Alti/Lab_1_Factorial/Lab_1_Factorial.srcs/sources_1/imports/new/button_debouncer.v
  C:/Users/Alti/Lab_1_Factorial/Lab_1_Factorial.srcs/sources_1/imports/new/clk_gen.v
  C:/Users/Alti/Lab_1_Factorial/Lab_1_Factorial.srcs/sources_1/imports/new/factorial_CU.v
  C:/Users/Alti/Lab_1_Factorial/Lab_1_Factorial.srcs/sources_1/imports/new/led_mux.v
  C:/Users/Alti/Lab_1_Factorial/Lab_1_Factorial.srcs/sources_1/imports/new/mux2to1.v
  C:/Users/Alti/Lab_1_Factorial/Lab_1_Factorial.srcs/sources_1/imports/new/Factorial_fpga.v
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/Alti/Lab_1_Factorial/Lab_1_Factorial.srcs/constrs_1/imports/new/Factorial.xdc
set_property used_in_implementation false [get_files C:/Users/Alti/Lab_1_Factorial/Lab_1_Factorial.srcs/constrs_1/imports/new/Factorial.xdc]


synth_design -top Factorial_fpga -part xc7a35tcsg324-1


write_checkpoint -force -noxdef Factorial_fpga.dcp

catch { report_utilization -file Factorial_fpga_utilization_synth.rpt -pb Factorial_fpga_utilization_synth.pb }
