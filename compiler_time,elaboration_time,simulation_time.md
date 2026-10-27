```verilog
>>> Compiler directives `include, `define, `ifdef, are evaluated at compile time.
```
```verilog
>>> Evaluation of constant expression including 'parameter' expressions are evalueated at elaboration time
```
```verilog
>>> Assignment statements and procedural control statements are evaluated at simulation time. 
```
Understand the difference between compile time, elaboration time, and simulation time with one example.
```verilog
`define k 2+3;
let m = 2+3;
int n = 2+3;
Here,Evaluation of k at compile time, m at elaboration time and n at simulation time. 
```
Bounds of a vector "bit [a:0] high" 'a' must be known at the elaboration time. 
```verilog
`define k 2+3;
let m = 2+3;
int n = 2+3;
logic [`k:0] a; Possible
logic [m:0] a; Possible
logic [n:0] a; Not possible, because the bounds of a vector must be known at elaboration time.
```
```verilog
`define k 2+3;
let m = 2+3;
int n = 2+3;
`ifdef k; - Legal
`ifdef m; - Not legal
`ifdef n; - Not legal 
```
Compile time definition is procesed syntactically whereas elaboration time and simulation time constructs are evaluated semantically.
```verilog
`define k 2+3;
let m = 2+3;
logic [2*`k:0]a; is equivalent to logic [7:0] a;
logic [2*m:0] a; is equivalent to logic [10:0] a;
```
Generate if and procedural if  example:
```verilog 
1module m #(bit FLAG = 1)(input logic in1, in2, select, 
2                         output logic out1, out2);
3    if (FLAG) assign out1 = in1;
4    else assign out1 = in2;
5    always_comb begin
6        if(select) out2 = in1;
7        else out2 = in2;
8    end
9endmodule
```
In this example the if statement on line 3 is a generate if, because an if outside a procedural context is recognized as generate. This statement is processed at elaboration time using the value of FLAG, which is a module parameter. An attempt to put a non constant expression, such as select, in this case is illegal.
    The if statement on line 6 is a normal procedural if statement. It is executed at simulation time, and its argument need not to be an elaboration time constant. the procedural if statement is recognized by its procedural context of the always_comb procedure.
