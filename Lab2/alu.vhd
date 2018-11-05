library work;
use work.dlx_types.all;
use work.bv_arithmetic.all;

entity alu is
   port(operand1, operand2: in dlx_word; operation: in
		alu_operation_code;
		result: out dlx_word; error: out error_code);
   end entity alu;

architecture Data of alu is
   begin
   process(operand1, operand2, operation)
	variable ov: boolean;
	variable zr: boolean;
	variable op1_logical: boolean := false;
	variable op2_logical: boolean := false;
	variable in_result: dlx_word := x"00000000"; --Functions won't accept output variable as input
   begin
   case operation is
	--Unsigned Add
      when "0000" =>
	error <= "0000";
	bv_addu(operand1, operand2, in_result, ov);
	if ov then
	   error <= "0001";
	end if;
	result <= in_result;

	--Unsigned Subtract
      when "0001" =>
	error <= "0000";
        bv_subu(operand1, operand2, in_result, ov);
	if ov then
	   error <= "0010";
	end if;
	result <= in_result;

	--Two's Complement Add
      when "0010" =>
	error <= "0000";
	bv_add(operand1, operand2, in_result, ov);

	--If overflow flag is true, must determine whether there is overflow or underflow
	if ov then
	   --If OP1 and OP2 are both positive and yield a negative result
	   if (operand1(31) = '0') AND (operand2(31) = '0') then
	      if (in_result(31) = '1') then
		 error <= "0001";
	      end if;	

	   --If OP1 and OP2 are both negative and yield a positive result
	   elsif (operand1(31) = '1') AND (operand2(31) = '1') then
	      if (in_result(31) = '0') then
		 error <= "0010";
	      end if;
	   end if;
	end if;
	result <= in_result;

	--Two's Complement Subtract
      when "0011" =>	
	error <= "0000";
	bv_sub(operand1, operand2, in_result, ov);
	
	--If overflow flag is true, must determine whether there is overflow or underflow
	if ov then
	   --If OP1 is positive and OP2 is negative but yield a negative result
	   if (operand1(31) = '0') AND (operand2(31) = '1') then
	      if (in_result(31) = '1') then
		 error <= "0001";
	      end if;	

	   --If OP1 is negative and OP2 is positive but yield a positive result
	   elsif (operand1(31) = '1') AND (operand2(31) = '0') then
	      if (in_result(31) = '0') then
		 error <= "0010";
	      end if;
	   end if;
	end if;
	result <= in_result;

	--Two's Complement Multiply
      when "0100" =>
	error <= "0000";
	bv_mult(operand1, operand2, in_result, ov);
	
	--If overflow flag is true, must determine whether there is overflow or underflow
	if ov then
	   --If OP1 and OP2 are both positive but the result is negative
	   if (operand1(31) = '0') AND (operand2(31) = '0') then
	      error <= "0001";

	   --If OP1 and OP2 are both negative but the result is positive
	   elsif (operand1(31) = '1') AND (operand2(31) = '1') then
	      error <= "0001";

	   --If one of the operands is positive and one of the operands is negative but the result is positive
	   elsif (operand1(31) = '0') AND (operand2(31) = '1') then
	      error <= "0010";

	   elsif (operand1(31) = '1') AND (operand2(31) = '0') then
	      error <= "0010";
	   end if;
	end if;
	result <= in_result;

	--Two's Complement Divide
      when "0101" =>
	error <= "0000";
	bv_div(operand1, operand2, in_result, zr, ov);

	--If zero flag is true, return divide by zero error code
	if zr then
	   error<= "0011";

	--If overflow flag is true, return underflow error code
	elsif ov then
	   error<= "0010";
	end if;
	result<= in_result;

	--Logical: 0 = false, anything else = true
	--Bitwise: Treat n-bit numbers as a vector of n booleans

	--Logical AND: Return true only if both operands are true
      when "0110" =>
	--Search OP1 for a 1. If found, op1_logical is set to true and exits loop
	error <= "0000";
	op1_logical := false;
	op2_logical := false;
	for i in 31 downto 0 loop
	   if (operand1(i) = '1') then
	      op1_logical := true;
	      exit;
	   end if;
	end loop;

	--Search OP2 for a 1. If found, op2_logical is set to true and exits loop
	for j in 31 downto 0 loop
	   if (operand2(j) = '1') then
	      op2_logical := true;
	      exit;
	   end if;
	end loop;

	--If both operands are true, then result is true
	if op1_logical AND op2_logical then
	   result <= x"00000001";
	else
	   result <= x"00000000";
	end if;

	--Bitwise AND
      when "0111" =>
	error <= "0000";
	for i in 31 downto 0 loop
	   in_result(i) := operand1(i) and operand2(i);
	end loop;
	result <= in_result;

	--Logical OR: Return true if one of the operands is true
      when "1000" =>
	--Search OP1 for a 1. If found, op1_logical is set to true and exits loop
	error <= "0000";
	op1_logical := false;
	op2_logical := false;
	for i in 31 downto 0 loop
	   if (operand1(i) = '1') then
	      op1_logical := true;
	      exit;
	   end if;
	end loop;

	--Search OP2 for a 1. If found, op2_logical is set to true and exits loop
	for j in 31 downto 0 loop
	   if (operand2(j) = '1') then
	      op2_logical := true;
	      exit;
	   end if;
	end loop;

	--If one of the operands is true, then result is true
	if op1_logical OR op2_logical then
	   result <= x"00000001";
	else
	   result <= x"00000000";
	end if;

	--Bitwise OR
      when "1001" =>
	error <= "0000";
	for i in 31 downto 0 loop
	   in_result(i) := operand1(i) or operand2(i);
	end loop;
	result <= in_result;

	--Logical NOT of Operand1: Result is true if op1 is false (zero); result is false if number is true (non-zero)
      when "1010" =>
	error <= "0000";
	result <= x"00000001";
	for i in 31 downto 0 loop
	   if (operand1(i) = '1') then
	      result <= x"00000000";
	      exit;
	   end if;
	end loop;
	   

	--Bitwise NOT of Operand1
      when "1011" =>
	error <= "0000";
	for i in 31 downto 0 loop
	   in_result(i) := NOT operand1(i);
	end loop;
	result <= in_result;

      when others =>
        result <= x"00000000";

   end case;

   end process;
  
end architecture;
