`include "hw1.v"

module demorgan_test ();

  // Instantiate device/module under test
  reg A, B;                // Primary test inputs
  wire nA, nB, AB, AoB, nAandnB, nAornB, nAB, nAoB;    // Test outputs

  demorgan dut(A, B, nA, nB, AB, AoB, nAandnB, nAornB, nAB, nAoB);  // Module to be tested


  // Run sequence of test stimuli
  initial begin
    $display("A B | ~A ~B | AB | A+B | ~A~B | ~A+~B | ~(AB) | ~(A+B) |");            // Prints header for truth table
    A=0;B=0; #1                                 // Set A and B, wait for update (#1)
    $display("%b %b |  %b  %b | %b  |  %b  |   %b  |   %b   |   %b   |    %b   |", A,B, nA, nB, AB, AoB, nAandnB, nAornB, nAB, nAoB);
    A=0;B=1; #1                                 // Set A and B, wait for new update
    $display("%b %b |  %b  %b | %b  |  %b  |   %b  |   %b   |   %b   |    %b   |", A,B, nA, nB, AB, AoB, nAandnB, nAornB, nAB, nAoB);
    A=1;B=0; #1
    $display("%b %b |  %b  %b | %b  |  %b  |   %b  |   %b   |   %b   |    %b   |", A,B, nA, nB, AB, AoB, nAandnB, nAornB, nAB, nAoB);
    A=1;B=1; #1
    $display("%b %b |  %b  %b | %b  |  %b  |   %b  |   %b   |   %b   |    %b   |", A,B, nA, nB, AB, AoB, nAandnB, nAornB, nAB, nAoB);
  end
endmodule    // End demorgan_test