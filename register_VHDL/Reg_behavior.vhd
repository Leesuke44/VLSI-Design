library IEEE;
use ieee.std_logic_1164.all;

entity Reg_behavior is
port (
        clk,reg_write_en: in std_logic;
        read_adr: in integer range 1023 downto 0;
        write_adr: in integer range 1023 downto 0;
        read_data: out std_logic_vector(31 downto 0);
        write_data: in std_logic_vector(31 downto 0));
end Reg_behavior;

architecture proc of Reg_behavior is
type my_storage is array (1023 downto 0) of std_logic_vector(31 downto 0);
begin
process(clk, read_adr, write_adr, reg_write_en)
variable my_register : my_storage;
begin
   read_data <= my_register(read_adr);
   if (reg_write_en='1' and (clk'EVENT and clk='1')) then
      my_register(write_adr) := write_data;
   end if;
end process;
end proc;
