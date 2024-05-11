#### Data flow level modelling
In this I will present my basic knowledge of data flow level modelling concept.

<p allign="justify">In Data flow level modelling we use contionous assign statements which define the information in terms of logical or arithmetic expressions.
  Continuous assign statements continously update the outputs
  based upon the inputs.
  For example:
  assign out =(a&b)| (c^d);
  This statement assigns the value of the expression "(a&b) | (c^d)" ,where a,b,c,d are input signals.
  Whenever any of these input signals change,the expression is re-evalusted and the output signal is updated accordingly.</p>
  
  ## Some examples of contionuos assign statements and their relative combinational gate expressions/boolean expressions

 |Assign statements|Boolean expression|
 |-----------------|------------------|
 |assign y=a&b|y=a.b|
 |assign y=a|b|y=a+b|
 |assign y=a^b|y=a xor b |
 |assign y=a&b|y=a.b|
 |assign y=~a|y=a'|
 |assign y=~(a&b)|y=(a.b)'|
 
 ## Operators that are generally used in data flow level modelling from high precedence to low precedence that are supported Verilog HDL
 <ol>
  <li>Unary operator</li>
    <li>Multiply(*),divide(/),modulus(%) operators</li>
    <li>Shifting operator(<<,>>)</li>
    <li>Relational operator(<,>,<=,>=)</li>
    <li>Equality operators(=,!=,==,===,!==)</li>
    <li>Reduction operator(^,~&,~|,^~or~^)</li>
    <li>Logical operator(&&,||,==,!=)</li>
    <li>Conditional or Terenary operator(?:)</li>
    <li>Concatenation  operator({})</li>
    <li>Replication operator({{}})</li>
    
  </ol>

  <br>The differnce between bitwise operator and reduction operators is that bitwise operators works on a pair of operands and reduction operator works on a single operand resulting in a asingle bit boolean value.<br>

  ## An example to compare the difference in the code syntax  of half adder using Gate and  dataflow level modelling
  
  ```
 //half adder design file code using dataflow level modelling
module halfadder_dfm(sum1,cy,a,b);
input a,b;
output sum1,cy;
assign sum1=a^b;
assign sum1=a&b;
endmodule
```
```
//half adder design file code using gate level modelling
module halfadder_dfm(sum1,cy,a,b);
input a,b;
output sum1,cy;
xor(sum1,a,b);
and(cy,a,b);
endmodule
```
```
//test bench for the design file
`timescale 1ns / 1ps
module tb_half_dfm;
reg a,b;
wire sum1,cy;
halfadder_dfm halfadder_dfm1(sum1,cy,a,b);
initial
 begin
$display("a b sum1 cy");
$monitor(a," ",b," ",sum1," ",cy);
a=0;b=0;
#10
b=1;
#10
a=1;b=0;
#10
b=1;$ stop //$stop is system task
end
endmodule


  
  
  
 
 
