
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name TortillaMachine -dir "C:/SPB_Data/version-control/XilinxProjects/TortillaMachine/planAhead_run_3" -part xc3s1200efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/SPB_Data/version-control/XilinxProjects/TortillaMachine/main.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/SPB_Data/version-control/XilinxProjects/TortillaMachine} }
set_property target_constrs_file "main.ucf" [current_fileset -constrset]
add_files [list {main.ucf}] -fileset [get_property constrset [current_run]]
link_design