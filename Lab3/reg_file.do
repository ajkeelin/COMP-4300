add wave -position insertpoint \
sim:/reg_file/data_in \
sim:/reg_file/readnotwrite \
sim:/reg_file/clock \
sim:/reg_file/data_out \
sim:/reg_file/reg_number \

force -freeze sim:/reg_file/data_in 32'h0F0F0F0F
force -freeze sim:/reg_file/readnotwrite 0
force -freeze sim:/reg_file/clock 1
force -freeze sim:/reg_file/reg_number 5'h00
run 15 ns

force -freeze sim:/reg_file/data_in 32'hABCDEF00
force -freeze sim:/reg_file/readnotwrite 0
force -freeze sim:/reg_file/clock 1
force -freeze sim:/reg_file/reg_number 5'h02
run 15 ns

force -freeze sim:/reg_file/data_in 32'h10000001
force -freeze sim:/reg_file/readnotwrite 0
force -freeze sim:/reg_file/clock 1
force -freeze sim:/reg_file/reg_number 5'h04
run 15 ns

force -freeze sim:/reg_file/data_in 32'h11110000
force -freeze sim:/reg_file/readnotwrite 0
force -freeze sim:/reg_file/clock 1
force -freeze sim:/reg_file/reg_number 5'h06
run 15 ns

force -freeze sim:/reg_file/data_in 32'hFFFFFFFF
force -freeze sim:/reg_file/readnotwrite 0
force -freeze sim:/reg_file/clock 1
force -freeze sim:/reg_file/reg_number 5'h08
run 15 ns

force -freeze sim:/reg_file/data_in 32'h00000000
force -freeze sim:/reg_file/readnotwrite 1
force -freeze sim:/reg_file/clock 1
force -freeze sim:/reg_file/reg_number 5'h00
run 15 ns

force -freeze sim:/reg_file/data_in 32'h00000000
force -freeze sim:/reg_file/readnotwrite 1
force -freeze sim:/reg_file/clock 1
force -freeze sim:/reg_file/reg_number 5'h02
run 15 ns

force -freeze sim:/reg_file/data_in 32'h00000000
force -freeze sim:/reg_file/readnotwrite 1
force -freeze sim:/reg_file/clock 1
force -freeze sim:/reg_file/reg_number 5'h04
run 15 ns

force -freeze sim:/reg_file/data_in 32'h00000000
force -freeze sim:/reg_file/readnotwrite 1
force -freeze sim:/reg_file/clock 1
force -freeze sim:/reg_file/reg_number 5'h06
run 15 ns

force -freeze sim:/reg_file/data_in 32'h00000000
force -freeze sim:/reg_file/readnotwrite 1
force -freeze sim:/reg_file/clock 1
force -freeze sim:/reg_file/reg_number 5'h08
run 15 ns

force -freeze sim:/reg_file/data_in 32'h0F0F0F0F
force -freeze sim:/reg_file/readnotwrite 0
force -freeze sim:/reg_file/clock 0
force -freeze sim:/reg_file/reg_number 5'h01
run 15 ns

force -freeze sim:/reg_file/data_in 32'h00000000
force -freeze sim:/reg_file/readnotwrite 1
force -freeze sim:/reg_file/clock 0
force -freeze sim:/reg_file/reg_number 5'h00
run 15 ns
