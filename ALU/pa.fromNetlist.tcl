
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name ALU -dir "C:/gaga/work/test/ALU/planAhead_run_5" -part xc7a100tfgg484-2L
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/gaga/work/test/ALU/ALU_Top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/gaga/work/test/ALU} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "ALU_Top.ucf" [current_fileset -constrset]
add_files [list {ALU_Top.ucf}] -fileset [get_property constrset [current_run]]
link_design
