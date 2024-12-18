module Reg_behavior(read_data, write_data, 
 read_addr, write_addr, write_en, clock);
 
output[31:0] read_data;
input [31:0] write_data;
input [9:0] read_addr, write_addr;
input write_en, clock;

reg [31:0] reg_file[1023:0];


assign   read_data = reg_file[read_addr];

always @(posedge clock) begin
  if(write_en) reg_file[write_addr] <= write_data;
end
endmodule
