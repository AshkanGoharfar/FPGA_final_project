# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -msgmgr_mode ooc_run
create_project -in_memory -part xc7vx485tffg1157-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir {D:/Ashkan works/VHDL_project_2/phase2/phase2.cache/wt} [current_project]
set_property parent.project_path {D:/Ashkan works/VHDL_project_2/phase2/phase2.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo {d:/Ashkan works/VHDL_project_2/phase2/phase2.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_ip -quiet {{d:/Ashkan works/VHDL_project_2/phase2/phase2.srcs/sources_1/ip/Ui_ROM/Ui_ROM.xci}}
set_property is_locked true [get_files {{d:/Ashkan works/VHDL_project_2/phase2/phase2.srcs/sources_1/ip/Ui_ROM/Ui_ROM.xci}}]

foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

set cached_ip [config_ip_cache -export -no_bom -use_project_ipc -dir {D:/Ashkan works/VHDL_project_2/phase2/phase2.runs/Ui_ROM_synth_1} -new_name Ui_ROM -ip [get_ips Ui_ROM]]

if { $cached_ip eq {} } {

synth_design -top Ui_ROM -part xc7vx485tffg1157-1 -mode out_of_context

#---------------------------------------------------------
# Generate Checkpoint/Stub/Simulation Files For IP Cache
#---------------------------------------------------------
catch {
 write_checkpoint -force -noxdef -rename_prefix Ui_ROM_ Ui_ROM.dcp

 set ipCachedFiles {}
 write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Ui_ROM_stub.v
 lappend ipCachedFiles Ui_ROM_stub.v

 write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Ui_ROM_stub.vhdl
 lappend ipCachedFiles Ui_ROM_stub.vhdl

 write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Ui_ROM_sim_netlist.v
 lappend ipCachedFiles Ui_ROM_sim_netlist.v

 write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Ui_ROM_sim_netlist.vhdl
 lappend ipCachedFiles Ui_ROM_sim_netlist.vhdl

 config_ip_cache -add -dcp Ui_ROM.dcp -move_files $ipCachedFiles -use_project_ipc -ip [get_ips Ui_ROM]
}

rename_ref -prefix_all Ui_ROM_

write_checkpoint -force -noxdef Ui_ROM.dcp

catch { report_utilization -file Ui_ROM_utilization_synth.rpt -pb Ui_ROM_utilization_synth.pb }

if { [catch {
  file copy -force {D:/Ashkan works/VHDL_project_2/phase2/phase2.runs/Ui_ROM_synth_1/Ui_ROM.dcp} {d:/Ashkan works/VHDL_project_2/phase2/phase2.srcs/sources_1/ip/Ui_ROM/Ui_ROM.dcp}
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  write_verilog -force -mode synth_stub {d:/Ashkan works/VHDL_project_2/phase2/phase2.srcs/sources_1/ip/Ui_ROM/Ui_ROM_stub.v}
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub {d:/Ashkan works/VHDL_project_2/phase2/phase2.srcs/sources_1/ip/Ui_ROM/Ui_ROM_stub.vhdl}
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim {d:/Ashkan works/VHDL_project_2/phase2/phase2.srcs/sources_1/ip/Ui_ROM/Ui_ROM_sim_netlist.v}
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim {d:/Ashkan works/VHDL_project_2/phase2/phase2.srcs/sources_1/ip/Ui_ROM/Ui_ROM_sim_netlist.vhdl}
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}


} else {


if { [catch {
  file copy -force {D:/Ashkan works/VHDL_project_2/phase2/phase2.runs/Ui_ROM_synth_1/Ui_ROM.dcp} {d:/Ashkan works/VHDL_project_2/phase2/phase2.srcs/sources_1/ip/Ui_ROM/Ui_ROM.dcp}
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  file rename -force {D:/Ashkan works/VHDL_project_2/phase2/phase2.runs/Ui_ROM_synth_1/Ui_ROM_stub.v} {d:/Ashkan works/VHDL_project_2/phase2/phase2.srcs/sources_1/ip/Ui_ROM/Ui_ROM_stub.v}
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force {D:/Ashkan works/VHDL_project_2/phase2/phase2.runs/Ui_ROM_synth_1/Ui_ROM_stub.vhdl} {d:/Ashkan works/VHDL_project_2/phase2/phase2.srcs/sources_1/ip/Ui_ROM/Ui_ROM_stub.vhdl}
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force {D:/Ashkan works/VHDL_project_2/phase2/phase2.runs/Ui_ROM_synth_1/Ui_ROM_sim_netlist.v} {d:/Ashkan works/VHDL_project_2/phase2/phase2.srcs/sources_1/ip/Ui_ROM/Ui_ROM_sim_netlist.v}
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  file rename -force {D:/Ashkan works/VHDL_project_2/phase2/phase2.runs/Ui_ROM_synth_1/Ui_ROM_sim_netlist.vhdl} {d:/Ashkan works/VHDL_project_2/phase2/phase2.srcs/sources_1/ip/Ui_ROM/Ui_ROM_sim_netlist.vhdl}
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

}; # end if cached_ip 

if {[file isdir {D:/Ashkan works/VHDL_project_2/phase2/phase2.ip_user_files/ip/Ui_ROM}]} {
  catch { 
    file copy -force {{d:/Ashkan works/VHDL_project_2/phase2/phase2.srcs/sources_1/ip/Ui_ROM/Ui_ROM_stub.v}} {D:/Ashkan works/VHDL_project_2/phase2/phase2.ip_user_files/ip/Ui_ROM}
  }
}

if {[file isdir {D:/Ashkan works/VHDL_project_2/phase2/phase2.ip_user_files/ip/Ui_ROM}]} {
  catch { 
    file copy -force {{d:/Ashkan works/VHDL_project_2/phase2/phase2.srcs/sources_1/ip/Ui_ROM/Ui_ROM_stub.vhdl}} {D:/Ashkan works/VHDL_project_2/phase2/phase2.ip_user_files/ip/Ui_ROM}
  }
}
