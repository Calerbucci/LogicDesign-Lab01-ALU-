`timescale 1ns/100ps

module lab1_3_t;

  reg  [3:0] a, b;
  reg  [1:0] aluctr;
  wire [3:0] d;
  reg  pass;
    
  lab1_3 ALU(
    .a(a),
    .b(b),
    .aluctr(aluctr),
    .d(d));
   
  initial begin
    #0      pass = 1'b1; a = 4'b0000; b = 4'b0000; aluctr = 2'b00;
    $display("Starting simulation");
    //$monitor("%g\taluctr=%b\ta=%b\tb=%b\tc=%b\td=%b\te=%b",$time, aluctr, a, b, c, d, e);0
  
    #2560   $display("%g Terminating simulation...", $time);
    if (pass)
      $display(">>>> [PASS] Congratulations!");
    else
      $display(">>>> [ERROR] Try it again!");

    $finish;
  end
        
  always #512 aluctr = aluctr + 1;
  always #32  a = a + 1;
  always #2   b = b + 1;
    
  always @(*) begin
    #1
    if ( aluctr == 2'b00) begin
      if ( (a+b) !== {d} )
        printerror;
    end else if(aluctr == 2'b01) begin
      if ( (a-b) !== {d} )
        printerror;
    end else if( aluctr == 2'b10 ) begin
      if( ( (a&b) !== d ) )
        printerror;
    end  else if( aluctr == 2'b11 ) begin
      if( ( (a^b) !== d ) )
        printerror;
    end
  end
    
  task printerror;
    begin
      pass = 1'b0;
      $display("  Error:\taluctr=%b\ta=%b\tb=%b\td=%b", aluctr, a, b, d);
    end
  endtask
    
endmodule
