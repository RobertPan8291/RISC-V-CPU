onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/clk
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/reset
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/fsm_controller/s
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/fsm_controller/reset
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/fsm_controller/clk
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/fsm_controller/opcode
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/fsm_controller/op
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/fsm_controller/nsel
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/fsm_controller/mem_cmd
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/fsm_controller/vsel
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/fsm_controller/shiftsel
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/fsm_controller/loada
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/fsm_controller/loadb
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/fsm_controller/loadc
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/fsm_controller/asel
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/fsm_controller/bsel
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/fsm_controller/write
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/fsm_controller/loads
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/fsm_controller/load_pc
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/fsm_controller/reset_pc
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/fsm_controller/addr_sel
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/fsm_controller/load_ir
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/fsm_controller/load_addr
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/fsm_controller/w
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/fsm_controller/present_state_out
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/mem_addr
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/mem_cmd
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/out
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/decoder_in
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/DP/REGFILE/R0
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/DP/REGFILE/R1
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/DP/REGFILE/R2
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/DP/REGFILE/R3
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/DP/REGFILE/R4
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/DP/REGFILE/R5
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/DP/REGFILE/R6
add wave -noupdate /lab7_stage1_tb_2/DUT/CPU/DP/REGFILE/R7
add wave -noupdate /lab7_stage1_tb_2/DUT/MEM/read_address
add wave -noupdate /lab7_stage1_tb_2/DUT/MEM/write_address
add wave -noupdate /lab7_stage1_tb_2/DUT/MEM/write
add wave -noupdate /lab7_stage1_tb_2/DUT/MEM/din
add wave -noupdate /lab7_stage1_tb_2/DUT/MEM/dout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {480 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 367
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {384 ps} {506 ps}
