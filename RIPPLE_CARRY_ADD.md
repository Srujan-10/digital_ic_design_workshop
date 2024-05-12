# Structural level modelling:
<br>Structural level modelling refers to a design using module instances(especially low level building blocks like AND,OR,MUX,ADDER,FLIPFLOP).
Structural modelling includes a module that instatiates other module  and verilog primitives(AND,OR,NAND,NOR,etc).<br>

--Example:
# Ripple_carry_adder
In this I will demonstrate my basic understanding of  4-bit ripple carry adder using 1-bit full adder through structural modelling.

# DESCRIPTION:Ripple carry adder
<p allign="justify">In a four bit ripple carry adder there are four 1-bit full adders.

# Block_diagram

![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/993166c7-9aa5-479c-93a0-1ede211f61db)

<br>Truth Table of ripple carry adder with few combinations<br>

|A3|A2|A1|A0|B3|B2|B1|B0|S3|S2|S1|S0|Carry|
|--|--|--|--|--|--|--|--|--|--|--|--|-----|
|0|0|0|0|0|0|0|0|0|0|0|0|0|
|0|1|0|0|0|1|0|0|1|0|0|0|0|
|1|0|0|0|1|0|0|0|0|0|0|0|1|
|1|0|1|0|1|0|1|0|0|1|0|0|1|
|1|1|0|0|1|1|0|0|1|0|0|0|1|
|1|1|1|0|1|1|1|0|1|1|0|0|1|
|1|1|1|1|1|1|1|1|1|1|1|0|1|

```
//Design of 4-bit ripple carry adder using 4, 1-bit Full adders using Structural modelling

module full_adder(a,b,cin,sum,co);
input a,b,cin;
output sum,co;
assign sum=a^b^cin;
assign co=(a&b)|(a&cin)|(cin&b);
endmodule

module rca_4bit (a,b,sum,cout);
output [3:0]sum;
output cout;
input [3:0]a;
input [3:0]b;
wire [2:0]c;
  full_adder u0 (a[0],b[0],1'b0,sum[0],c[0]);
  full_adder u1 (a[1],b[1],c[0],sum[1],c[1]);
  full_adder u2 (a[2],b[2],c[1],sum[2],c[2]);
  full_adder u3 (a[3],b[3],c[2],sum[3],cout);
endmodule
```
```
// Testbench code of 4-bit ripple carry adder

`timescale 1ns / 1ps
module tb_rca_4bit;
// Inputs
reg [3:0] a;
reg [3:0] b;

// Outputs
wire [3:0] sum;
wire cout;

// Instantiate the Unit Under Test (UUT)
rca_4bit dut(a,b,sum,cout);
initial begin
  $monitor("a=%0d b=%0d sum=%0d cout=%b",a,b,sum,cout);
// Initialize Inputs
a = 0;
b = 0;
// Wait 100 ns for global reset to finish
#100;
a = 5;
b = 6;
// Wait 100 ns for global reset to finish
#100;
end
endmodule
```
# Simulation_waveform

![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/1bc35339-47df-45bd-ba4b-4ed59c4a367c)

# SYNTHESIZED DESIGN

![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/da34ddda-26b9-48a1-a221-e171c6c936af)

















