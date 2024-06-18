## Shift register 

In this I will demonstrate shift register using behavorial modelling.

## verilog code
```//design file
`timescale 1ns / 1ps
module ls24bit(clk,rst,data_in,data_out);
input clk,rst;
input data_in;
output data_out;
reg [3:0]q;
always@(posedge clk, posedge rst)
if(rst)
q<=4'b0000;
else
q<={data_in,q[3:1]};
assign data_out=q[0];
endmodule
```
```//test bench
`timescale 1ns/1ps
module tb();
reg clk,rst;
reg data_in;
wire data_out;
ls24bit dut(clk,rst,data_in,data_out);
initial
begin
rst=0;
#5 rst=1;
#1 rst=0;
end
initial
begin
clk=0;
forever #5 clk=~clk;
end

initial
begin

#6 data_in=1;
@(posedge clk);
#1;

#6 data_in=0;
@(posedge clk);
#1;

#6 data_in=1;
@(posedge clk);
#1;

#6 data_in=0;
@(posedge clk);
#1;

#6 data_in=1;
@(posedge clk);
#1;


$stop;

end
endmodule

```
