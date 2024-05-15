
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name exp5 -dir "D:/gaga/work/test/exp5/planAhead_run_1" -part xc7a100tfgg484-2L
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/gaga/work/test/exp5/Mem_Top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/gaga/work/test/exp5} {ipcore_dir} }
add_files [list {ipcore_dir/RAM_B.ncf}] -fileset [get_property constrset [current_run]]
set_param project.pinAheadLayout  yes
set_property target_constrs_file "Mem_Top.ucf" [current_fileset -constrset]
add_files [list {Mem_Top.ucf}] -fileset [get_property constrset [current_run]]
link_design
