// Code your design here
module counter_32bit (
  input wire clk,
  input wire reset,
  output reg [32-1:0] count
);

  always @(posedge clk or posedge reset) 
    begin
    if (reset) 
      begin
      count <= 0;
      end 
    else 
      begin
      count <= count + 1;
      end
    end
endmodule
