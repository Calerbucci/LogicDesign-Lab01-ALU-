`timescale 1ns/100ps

module lab1_1_t;

  reg a, b, c; 
  wire d, e;
  reg sub;
  reg pass;
  reg clk;
  

  // TODO 1: please instantiate lab1_1 with correct interconnection
  // where a, b, c and sub are inputs, e, d are outputs.

    lab1_1 full_adder(
    .e(e),
    .d(d),
    .a(a),
    .b(b),
    .c(c),
    .sub(sub)
  );



  always #5 clk = ~clk;

  initial begin
    clk = 1'b1;   
    pass = 1'b1;  // pass is a flag to check whether you pass the simulation
    {a, b, c, sub} = 4'd0;  // initialize the counter

    $display("Starting the simulation");

    repeat (2 ** 4) begin
      // In this block, the testbench will exhaustively try all possible
      // combinations of a, b, c and sub to test the correctness of the
      // circuit with the task function "test".
      @ (posedge clk)
        // TODO 2: execute the task function "test" at positive clock edges
        /* add your code here */
        test;
      @ (negedge clk)
        // TODO 3: increase the counter {a, b, c, sub} by 1 at negative
        // clock edges. The adder would add 0000 to 1111.
        /* add your code here */
		{a, b, c, sub} = {a, b, c, sub} + 4'b0001;
    end


    $display("%g Terminating the simulation...", $time);

    if(pass)  $display(">>>> [PASS]  Congratulations!");
    else      $display(">>>> [ERROR] Try it again!");

    $finish;
  end
            
  task test; 
    begin
      // TODO 4: execute the task function "printerror" if the behavior of
      // the module "lab1_1" is incorrect. Please verify the circuit with
      // the value of a, b, c, and sub.

      if ((sub == 1 && {e,d} !== a + !b + c) || (sub == 0 && {e,d} !== a + b + c)) begin
        printerror;
      end
    end
  endtask

  task printerror;
    begin
      // TODO 5: set the value of the signal "pass" to 0 and display the
      // value of a, b, c, d, e and sub when error happens
      pass = 1'b0;
      $display($time," Error:  a = %b, b = %b, c = %b, d = %b, e = %b, sub = %b",
        a, b, c, d, e, sub);
    end
  endtask
endmodule
 
