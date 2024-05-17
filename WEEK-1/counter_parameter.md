## UP COUNTER AND DOWN COUNTER

In this I will demonstrate the implementation of up counter and down counter using parameter keyword and behavorial modelling.

## BLACK BOX

![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/6ce328d6-9960-47f8-afd2-3b016fa234b5)


## verilog code 
```
//design file for up counter
module counter_5_bit(clk,rst,count);
input clk,rst;
output [4:0]count;
counter_parameerized #(5) dut(clk,rst,count);

endmodule
module counter_parameerized(clk,rst,count);
parameter N=3;
input clk,rst;
output reg [N-1:0]count;
always@(posedge clk)
if(rst)
count<=3'b000;
else
count<=count+1'b1;
endmodule
```
```
// design file for down counter
module counter_5_bit(clk,rst,count);
input clk,rst;
output [4:0]count;
counter_parameerized #(5) dut(clk,rst,count);

endmodule

module counter_parameerized(clk,rst,count);
parameter N=3;
input clk,rst;
output reg [N-1:0]count;
always@(posedge clk)
if(rst)
count<=31;
else
count<=count-1'b1;
endmodule


```
```
//test bench

//tb
`timescale 1ns / 1ps
module tb_5_bit();

reg clk,rst;
wire [4:0]count;

counter_5_bit dut(clk,rst,count);

initial begin
rst=0;
#5 rst=1;
#1 rst=0;
end

initial
begin
clk=0;
forever
#5 clk=~clk;
end

initial
#500 $stop;

//always #5 clk=~clk;

endmodule
```
## RTL SCHEMATIC OF COUNTER
UP COUNTER

![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/3bdce115-01cb-4ae7-a114-c9e90612a5f2)

DOWN COUNTER

![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/47324bbb-6626-48f1-8dbe-5ea71b2ae994)

## BEHAVORIAL SIMULATION OF UP COUNTER

![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/7b51bfe1-5f2e-4adc-8bf6-15925ae4101f)


## BEHAVORIAL SIMULATION OF DOWN COUNTER

![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/98619f09-6eb1-431b-b693-bb5007279a96)

## Synthesis schematic

![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/96281011-fa4c-4c30-9080-e7445fc02c28)

(EDAPLAYGROUNG LINK)[].
















