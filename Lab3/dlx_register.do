add wave -position insertpoint \
sim:/dlx_register/in_val \
sim:/dlx_register/clock \
sim:/dlx_register/out_val \

force -freeze sim:/dlx_register/in_val 32'h0F0F0F0F
force -freeze sim:/dlx_register/clock 1
run 15 ns

force -freeze sim:/dlx_register/in_val 32'hABCDEF00
force -freeze sim:/dlx_register/clock 1
run 15 ns

force -freeze sim:/dlx_register/in_val 32'h10000001
force -freeze sim:/dlx_register/clock 1
run 15 ns

force -freeze sim:/dlx_register/in_val 32'h11110000
force -freeze sim:/dlx_register/clock 1
run 15 ns

force -freeze sim:/dlx_register/in_val 32'h0F0F0F0F
force -freeze sim:/dlx_register/clock 0
run 15 ns

force -freeze sim:/dlx_register/in_val 32'hABCDEF00
force -freeze sim:/dlx_register/clock 0
run 15 ns

force -freeze sim:/dlx_register/in_val 32'h10000001
force -freeze sim:/dlx_register/clock 0
run 15 ns

force -freeze sim:/dlx_register/in_val 32'h11110000
force -freeze sim:/dlx_register/clock 0
run 15 ns