
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Structural_Clock -dir "F:/Sistemas Digitales/Structural_Clock/planAhead_run_3" -part xc6slx16csg324-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "F:/Sistemas Digitales/Structural_Clock/Clock.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {F:/Sistemas Digitales/Structural_Clock} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "Clock.ucf" [current_fileset -constrset]
add_files [list {Clock.ucf}] -fileset [get_property constrset [current_run]]
link_design
