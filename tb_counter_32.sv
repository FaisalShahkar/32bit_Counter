

module tb_counter_32bit;

  reg clk;
  reg reset;
  wire [31:0] count;

  // Instantiate the counter
  counter_32bit uut (
    .clk(clk),
    .reset(reset),
    .count(count)
  );

  // Clock generation
  initial begin
    clk = 0;
    // Generate a clock with a period of 10 time units
    forever #5 clk = ~clk;
  end

  // Test scenario
  initial begin
    reset = 1;  // Assert reset initially
    #10 reset = 0;  // Release reset after 10 time units

    // Dump VCD file
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_counter_32bit);

    // Monitor the counter value
    $monitor("Time: %t, Count: %h", $time, count);

    // Simulate for 100 time units
    #100 $finish;  // Finish simulation after some cycles
  end

endmodule
