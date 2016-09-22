module demorgan
(
  input  A,          // Single bit inputs
  input  B,
  output nA,         // Output intermediate complemented inputs
  output nB,
  output AB,         // Single bit output, (A * B)
  output AoB,        // Single bit output, (A + B)
  output nAandnB,    // Single bit output, (~A)*(~B)
  output nAornB,     // Single bit output, (~A)+(~B)
  output nAB,        // Single bit output, ~(A * B)
  output nAoB        // Single bit output, ~(A + B)
);

  wire nA;
  wire nB;
  and andgate(AB, A, B); // AND gate produces AB from A and B
  or orgate(AoB, A, B);  // OR gate produces AoB from A and B
  wire AB;
  wire AoB;
  not ABinv(nAB,AB);     // Inverter is named ABinv, takes signal AB as input and produces signal nAB
  not AoBinv(nAoB, AoB); // Inverter is named AoBinv, takes signal AoB as input and produces signal nAoB
  not Ainv(nA, A);       // Inverter is named Ainv, takes signal A as input and produces signal nA
  not Binv(nB, B);
  and andgate(nAandnB, nA, nB);  // AND gate produces nAandnB from nA and nB
  or orgate(nAornB, nA, nB);     // OR gate produces nAornB from nA and nB

endmodule