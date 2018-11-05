add wave -position insertpoint \
sim:/alu/operand1 \
sim:/alu/operand2 \
sim:/alu/operation \
sim:/alu/result \
sim:/alu/error


force -freeze sim:/alu/operand1 32'h0F0F0F0F 0
force -freeze sim:/alu/operand2 32'h01010101 0
force -freeze sim:/alu/operation 4'h0 0
run 15 ns

force -freeze sim:/alu/operand1 32'hFFFFFFFF 0
force -freeze sim:/alu/operand2 32'h00000001 0
force -freeze sim:/alu/operation 4'h0 0
run 15 ns

force -freeze sim:/alu/operand1 32'h10101010 0
force -freeze sim:/alu/operand2 32'h01010101 0
force -freeze sim:/alu/operation 4'h1 0
run 15 ns

force -freeze sim:/alu/operand1 32'h00000001 0
force -freeze sim:/alu/operand2 32'h00000010 0
force -freeze sim:/alu/operation 4'h1 0
run 15 ns

force -freeze sim:/alu/operand1 32'h0F0F0F0F 0
force -freeze sim:/alu/operand2 32'h01010101 0
force -freeze sim:/alu/operation 4'h2 0
run 15 ns

force -freeze sim:/alu/operand1 32'h7FFFFFFF 0
force -freeze sim:/alu/operand2 32'h00000001 0
force -freeze sim:/alu/operation 4'h2 0
run 15 ns

force -freeze sim:/alu/operand1 32'h10101010 0
force -freeze sim:/alu/operand2 32'h01010101 0
force -freeze sim:/alu/operation 4'h3 0
run 15 ns

force -freeze sim:/alu/operand1 32'h80000000 0
force -freeze sim:/alu/operand2 32'h7FFFFFFF 0
force -freeze sim:/alu/operation 4'h3 0
run 15 ns

force -freeze sim:/alu/operand1 32'h00001010 0
force -freeze sim:/alu/operand2 32'h00000101 0
force -freeze sim:/alu/operation 32'h4 0
run 15 ns

force -freeze sim:/alu/operand1 32'h0F0F0F0F 0
force -freeze sim:/alu/operand2 32'h01010101 0
force -freeze sim:/alu/operation 32'h5 0
run 15 ns

force -freeze sim:/alu/operand1 32'h0000000F 0
force -freeze sim:/alu/operand2 32'h00000000 0
force -freeze sim:/alu/operation 32'h5 0
run 15 ns

force -freeze sim:/alu/operand1 32'h00000075 0
force -freeze sim:/alu/operand2 32'h00000022 0
force -freeze sim:/alu/operation 32'h6 0
run 15 ns

force -freeze sim:/alu/operand1 32'h00000075 0
force -freeze sim:/alu/operand2 32'h00000000 0
force -freeze sim:/alu/operation 32'h6 0
run 15 ns

force -freeze sim:/alu/operand1 32'h00000075 0
force -freeze sim:/alu/operand2 32'h00000022 0
force -freeze sim:/alu/operation 32'h7 0
run 15 ns

force -freeze sim:/alu/operand1 32'h00000075 0
force -freeze sim:/alu/operand2 32'h00000000 0
force -freeze sim:/alu/operation 32'h7 0
run 15 ns

force -freeze sim:/alu/operand1 32'h00000075 0
force -freeze sim:/alu/operand2 32'h00000000 0
force -freeze sim:/alu/operation 32'h8 0
run 15 ns

force -freeze sim:/alu/operand1 32'h00000000 0
force -freeze sim:/alu/operand2 32'h00000000 0
force -freeze sim:/alu/operation 32'h8 0
run 15 ns

force -freeze sim:/alu/operand1 32'h00000075 0
force -freeze sim:/alu/operand2 32'h00000000 0
force -freeze sim:/alu/operation 32'h9 0
run 15 ns

force -freeze sim:/alu/operand1 32'h00000055 0
force -freeze sim:/alu/operand2 32'h000000AA 0
force -freeze sim:/alu/operation 32'h9 0
run 15 ns

force -freeze sim:/alu/operand1 32'h00000000 0
force -freeze sim:/alu/operand2 32'h00000000 0
force -freeze sim:/alu/operation 32'hA 0
run 15 ns

force -freeze sim:/alu/operand1 32'h00000075 0
force -freeze sim:/alu/operand2 32'h00000000 0
force -freeze sim:/alu/operation 32'hA 0
run 15 ns

force -freeze sim:/alu/operand1 32'h00000055 0
force -freeze sim:/alu/operand2 32'h00000000 0
force -freeze sim:/alu/operation 32'hB 0
run 15 ns

force -freeze sim:/alu/operand1 32'h10101010 0
force -freeze sim:/alu/operand2 32'h01010101 0
force -freeze sim:/alu/operation 32'hC 0
run 15 ns

force -freeze sim:/alu/operand1 32'h10101010 0
force -freeze sim:/alu/operand2 32'h01010101 0
force -freeze sim:/alu/operation 32'hD 0
run 15 ns

force -freeze sim:/alu/operand1 32'h10101010 0
force -freeze sim:/alu/operand2 32'h01010101 0
force -freeze sim:/alu/operation 32'hE 0
run 15 ns

force -freeze sim:/alu/operand1 32'h10101010 0
force -freeze sim:/alu/operand2 32'h01010101 0
force -freeze sim:/alu/operation 32'hF 0
run 15 ns
