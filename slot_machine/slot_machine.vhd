entity slot_machine is
  port(C, B1, B2, clk: in bit;
      T1, T2, A : out bit);
end slot_machine; 

architecture behavior of slot_machine is
	type STATE is (s1, s2, s3, s4);
	signal cur_state, next_state: STATE;
	signal temp_A, temp_T1, temp_T2: bit;
begin
	process
	begin
		wait until clk'EVENT and clk = '1';
			A <= temp_A;
			T1 <= temp_T1;
			T2 <= temp_T2;
			cur_state <= next_state;
	end process;
	
	process(C, B1, B2, cur_state)
	begin
		case cur_state is
			when s1 =>
					temp_T1 <= '0';
					temp_T2 <= '0';
				if C = '1' then
					temp_A <= '1';
					next_state <= s2;
				else
					temp_A <= '0';
					next_state <= s1;
				end if;
			when s2 =>
				temp_T1 <= '0';
				temp_T2 <= '0';
				if B1 = '1' then
					temp_A <= '0';
					temp_T1 <= '1';
					next_state <= s3;
				elsif B2 = '1' then
					temp_A <= '0';
					temp_T2 <= '1';
					next_state <= s4;
				else 
					next_state <= s2;
				end if;
			when s3 =>
				temp_T1 <= '0';
				next_state <= s1;
			when s4 =>
				temp_T2 <= '0';
				next_state <= s1;
		end case;
	end process;
end behavior;