### 4:2 ENCODER

In this I will demonstrate the implementation of 4:2 encoder using behavorial modelling.

## Black box/block diagram

![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/df17ba3e-911a-4f20-964a-8548835e1799)

## Truth table
|enable|A3|A2|A1|A0|Y1|Y0|
|------|--|--|--|--|--|--|
|0|x|x|x|x|z|z|z|
|1|0|0|0|1|0|0|
|1|0|0|1|0|0|1|
|1|0|1|0|0|1|0|
|1|1|0|0|0|1|1|

## VERILOG CODE
```
//design file
module encoder_4x2(a,y);
input [3:0]a;
output reg [1:0]y;
always@(*)//@ is event controller
begin
case(a)
4'b0001 : y=2'b00;
4'b0010 : y=2'b01;
4'b0100 : y=2'b10;
4'b1000 : y=2'b11;
default: y=2'b00;//must for avoiding latch
endcase
end

endmodule

```
```
//test bench
`timescale 1ns / 1ps
module tt_encoder();
reg [3:0]a;
wire [1:0]y;
encoder_4x2 dut(a,y);
initial 
begin
a=4'b0000;
#5
a=4'b0010;
#5
a=4'b0100;
#5
a=4'b1000;
#5
$finish();
end
endmodule

```
## Behavorial simulation
![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/c24a624d-c408-4a9b-a855-6f47ef8ba150)


## RTL SCHEMATIC
![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/bb740a6d-eced-4430-8dae-19f9c6fc8a96)


## SYSNTHESIS SCHEMATIC
![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/dccc806e-f2c4-4fd3-a10a-d68ef40b9362)


[EDA PLAYGROUNG LINK](https://www.edaplayground.com/x/N_Et)



