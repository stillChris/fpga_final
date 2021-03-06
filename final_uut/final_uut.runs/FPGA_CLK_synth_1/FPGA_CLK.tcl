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
set_param project.vivado.isBlockSynthRun true
set_msg_config -msgmgr_mode ooc_run
create_project -in_memory -part xc7a100tcsg324-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir G:/ucsdExtension/Fgpa1/final/final_uut/final_uut.cache/wt [current_project]
set_property parent.project_path G:/ucsdExtension/Fgpa1/final/final_uut/final_uut.xpr [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo g:/ucsdExtension/Fgpa1/final/final_uut/final_uut.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_ip -quiet G:/ucsdExtension/Fgpa1/final/final_uut/final_uut.srcs/sources_1/ip/FPGA_CLK/FPGA_CLK.xci
set_property used_in_implementation false [get_files -all g:/ucsdExtension/Fgpa1/final/final_uut/final_uut.srcs/sources_1/ip/FPGA_CLK/FPGA_CLK_board.xdc]
set_property used_in_implementation false [get_files -all g:/ucsdExtension/Fgpa1/final/final_uut/final_uut.srcs/sources_1/ip/FPGA_CLK/FPGA_CLK.xdc]
set_property used_in_implementation false [get_files -all g:/ucsdExtension/Fgpa1/final/final_uut/final_uut.srcs/sources_1/ip/FPGA_CLK/FPGA_CLK_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 0

set cached_ip [config_ip_cache -export -no_bom -use_project_ipc -dir G:/ucsdExtension/Fgpa1/final/final_uut/final_uut.runs/FPGA_CLK_synth_1 -new_name FPGA_CLK -ip [get_ips FPGA_CLK]]

if { $cached_ip eq {} } {
close [open __synthesis_is_running__ w]

synth_design -top FPGA_CLK -part xc7a100tcsg324-2 -mode out_of_context

#---------------------------------------------------------
# Generate Checkpoint/Stub/Simulation Files For IP Cache
#---------------------------------------------------------
# disable binary constraint mode for IPCache checkpoints
set_param constraints.enableBinaryConstraints false

catch {
 write_checkpoint -force -noxdef -rename_prefix FPGA_CLK_ FPGA_CLK.dcp

 set ipCachedFiles {}
 write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ FPGA_CLK_stub.v
 lappend ipCachedFiles FPGA_CLK_stub.v

 write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ FPGA_CLK_stub.vhdl
 lappend ipCachedFiles FPGA_CLK_stub.vhdl

 write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ FPGA_CLK_sim_netlist.v
 lappend ipCachedFiles FPGA_CLK_sim_netlist.v

 write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ FPGA_CLK_sim_netlist.vhdl
 lappend ipCachedFiles FPGA_CLK_sim_netlist.vhdl
set TIME_taken [expr [clock seconds] - $TIME_start]

 config_ip_cache -add -dcp FPGA_CLK.dcp -move_files $ipCachedFiles -use_project_ipc  -synth_runtime $TIME_taken  -ip [get_ips FPGA_CLK]
}

rename_ref -prefix_all FPGA_CLK_

# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef FPGA_CLK.dcp
create_report "FPGA_CLK_synth_1_synth_report_utilization_0" "report_utilization -file FPGA_CLK_utilization_synth.rpt -pb FPGA_CLK_utilization_synth.pb"

if { [catch {
  write_verilog -force -mode synth_stub G:/ucsdExtension/Fgpa1/final/final_uut/final_uut.runs/FPGA_CLK_synth_1/FPGA_CLK_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub G:/ucsdExtension/Fgpa1/final/final_uut/final_uut.runs/FPGA_CLK_synth_1/FPGA_CLK_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim G:/ucsdExtension/Fgpa1/final/final_uut/final_uut.runs/FPGA_CLK_synth_1/FPGA_CLK_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim G:/ucsdExtension/Fgpa1/final/final_uut/final_uut.runs/FPGA_CLK_synth_1/FPGA_CLK_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}


} else {


}; # end if cached_ip 

add_files G:/ucsdExtension/Fgpa1/final/final_uut/final_uut.runs/FPGA_CLK_synth_1/FPGA_CLK_stub.v -of_objects [get_files G:/ucsdExtension/Fgpa1/final/final_uut/final_uut.srcs/sources_1/ip/FPGA_CLK/FPGA_CLK.xci]

add_files G:/ucsdExtension/Fgpa1/final/final_uut/final_uut.runs/FPGA_CLK_synth_1/FPGA_CLK_stub.vhdl -of_objects [get_files G:/ucsdExtension/Fgpa1/final/final_uut/final_uut.srcs/sources_1/ip/FPGA_CLK/FPGA_CLK.xci]

add_files G:/ucsdExtension/Fgpa1/final/final_uut/final_uut.runs/FPGA_CLK_synth_1/FPGA_CLK_sim_netlist.v -of_objects [get_files G:/ucsdExtension/Fgpa1/final/final_uut/final_uut.srcs/sources_1/ip/FPGA_CLK/FPGA_CLK.xci]

add_files G:/ucsdExtension/Fgpa1/final/final_uut/final_uut.runs/FPGA_CLK_synth_1/FPGA_CLK_sim_netlist.vhdl -of_objects [get_files G:/ucsdExtension/Fgpa1/final/final_uut/final_uut.srcs/sources_1/ip/FPGA_CLK/FPGA_CLK.xci]

add_files G:/ucsdExtension/Fgpa1/final/final_uut/final_uut.runs/FPGA_CLK_synth_1/FPGA_CLK.dcp -of_objects [get_files G:/ucsdExtension/Fgpa1/final/final_uut/final_uut.srcs/sources_1/ip/FPGA_CLK/FPGA_CLK.xci]

if {[file isdir G:/ucsdExtension/Fgpa1/final/final_uut/final_uut.ip_user_files/ip/FPGA_CLK]} {
  catch { 
    file copy -force G:/ucsdExtension/Fgpa1/final/final_uut/final_uut.runs/FPGA_CLK_synth_1/FPGA_CLK_sim_netlist.v G:/ucsdExtension/Fgpa1/final/final_uut/final_uut.ip_user_files/ip/FPGA_CLK
  }
}

if {[file isdir G:/ucsdExtension/Fgpa1/final/final_uut/final_uut.ip_user_files/ip/FPGA_CLK]} {
  catch { 
    file copy -force G:/ucsdExtension/Fgpa1/final/final_uut/final_uut.runs/FPGA_CLK_synth_1/FPGA_CLK_sim_netlist.vhdl G:/ucsdExtension/Fgpa1/final/final_uut/final_uut.ip_user_files/ip/FPGA_CLK
  }
}

if {[file isdir G:/ucsdExtension/Fgpa1/final/final_uut/final_uut.ip_user_files/ip/FPGA_CLK]} {
  catch { 
    file copy -force G:/ucsdExtension/Fgpa1/final/final_uut/final_uut.runs/FPGA_CLK_synth_1/FPGA_CLK_stub.v G:/ucsdExtension/Fgpa1/final/final_uut/final_uut.ip_user_files/ip/FPGA_CLK
  }
}

if {[file isdir G:/ucsdExtension/Fgpa1/final/final_uut/final_uut.ip_user_files/ip/FPGA_CLK]} {
  catch { 
    file copy -force G:/ucsdExtension/Fgpa1/final/final_uut/final_uut.runs/FPGA_CLK_synth_1/FPGA_CLK_stub.vhdl G:/ucsdExtension/Fgpa1/final/final_uut/final_uut.ip_user_files/ip/FPGA_CLK
  }
}
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
