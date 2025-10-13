TYPE : 1
module half_adder(input wire clk,
                  input wire rst,
                  input wire a,
                  input wire b,
                  output reg sum);
TYPE : 2
module half_adder(input clk,
                  input rst,
                  input a,
                  input b,
                  output reg sum);
TYPE : 3
module half_adder(clk,rst,a,b,sum);
    input clk;
    input rst;
    input a,b;
    output reg sum;

NOTE:
  1. TYPE : 1 and TYPE : 2 are exactly the same.
  2. Wire need not be explicitly defined for inputs.
  3. TYPE : 3 is old style (Pre -2001 verilog).
  4. Instead of reg/wire SV supports using logic keyword
  
