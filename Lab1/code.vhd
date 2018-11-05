entity code is
   port(a_in, b_in, c_in: in bit;
	result: out bit);
      end entity;

architecture Data of code is
   begin
      result <= (a_in xor b_in) xor c_in;
   end architecture;