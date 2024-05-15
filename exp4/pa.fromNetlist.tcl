
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name exp4 -dir "D:/gaga/work/test/exp4/planAhead_run_4" -part xc7a100tfgg484-2L
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/gaga/work/test/exp4/ALU_Regs_Top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/gaga/work/test/exp4} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "ALU_Regs_Top.ucf" [current_fileset -constrset]
add_files [list {ALU_Regs_Top.ucf}] -fileset [get_property constrset [current_run]]
link_design
