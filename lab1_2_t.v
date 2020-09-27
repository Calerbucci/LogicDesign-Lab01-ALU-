`timescale 1ns/100ps

module lab1_2_t;

  reg [3:0] a;
  reg [3:0] b;
  wire [3:0] d;
  reg sub;
  reg pass;
  reg clk;

  // TODO 1: please instantiate lab1_2 with correct interconnection
  // where a, b and d are inputs; d is output.

  lab1_2 four_full_adder(
    .a(a),
    .b(b),
    .sub(sub),
    .d(d)
  );

  always #5 clk = ~clk;

  initial begin
    clk = 1'b1;
    {a, b, sub} = 9'd0;  // initailize the counter
    pass = 1'b1;  // use the pass flag to check whether you pass the simulation

    $display("Starting the simulation");

    // In this block, the testbench will exhaustively try all possible
    // combinations of a, b and sub to test the correctness of the
    // circuit with the task function "test".
    // TODO 2: complete the repeat block with correct number of times
    repeat (2 ** 9) begin
      @ (posedge clk)
        // TODO 3: execute the task function "test" at positive clock edges
        /* add your code here */
        test;
        
      @ (negedge clk)
        // TODO 4: increase the counter {a, b, sub} by 1 at negative clock edges
        /* add your code here */
        {a, b, sub} = {a, b, sub} + 9'd1;
    end

    $display("%g Terminating simulation...", $time);
    if (pass) $display(">>>> [PASS]  Congratulations!");
    else      $display(">>>> [ERROR] Try it again!");
    $finish;
  end
            
  task test; 
    begin
      // TODO 5: execute the task function "printerror" if the behavior
      // of the module "lab1_2" is incorrect. Please verify the circuit
      // with the value of a, b, sub.
      
      if ((sub == 1 && d !== a - b) || (sub == 0 && d !== a + b)) begin
        printerror;
      end
    end
  endtask

  task printerror;
    // TODO 6: set the value of signal "pass" to 0 and display the value
    // of a, b, d and sub when error happens
    begin
        pass = 1'b0;
        $display($time," Error:  a = %b, b = %b, d = %b, sub = %b",
        a, b, d, sub);
    end
  endtask
endmodule
