## 8:3 ENCODER

In this I will implement 8:3 encoder using behavorial level modelling.

## Truth table
|enable|I7|I6|I5|I4|I3|I2|I1|I0|Y2|Y1|Y0|
|------|--|--|--|--|--|--|--|--|--|--|--|
|1|0|0|0|0|0|0|0|1|0|0|0|
|1|0|0|0|0|0|0|1|0|0|0|1|
|1|0|0|0|0|0|1|0|0|0|0|1|
|1|0|0|0|0|1|0|0|0|0|1|0|
|1|0|0|0|1|0|0|0|0|0|1|1|
|1|0|0|1|0|0|0|0|0|1|0|1|
|1|0|1|0|0|0|0|0|0|1|1|0|
|1|1|0|0|0|0|0|0|0|1|1|1|

## BLACK BOX
![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/2b8b5625-392f-4bdc-a4a4-b8303732f22a)


## verilog code
```
//DESIGN FILE
module  encoder_8x2(i,y);
input [7:0]i;
output reg [2:0]y;
always@(*)
begin
case(i)
8'b00000001 : y=3'b000;
8'b00000010 : y=3'b001;
8'b00000100 : y=3'b010;
8'b00001000 : y=3'b011;
8'b00010000 : y=3'b100;
8'b00100000 : y=3'b101;
8'b01000000 : y=3'b110;
8'b10000000 : y=3'b111;
default : y=3'b000;

endcase
end
endmodule
```
```
//TESTBENCH FILE
`timescale 1ns / 1ps
module tb_encoder();
reg [7:0]i;
wire [2:0]y;
integer file_handle;
encoder_8x2 dut(i,y);
task write_to_file;
$fwrite(file_handle,"@time %gns i=%b y=%b\n",$time,i,y);
endtask
initial 
begin
file_handle=$fopen("C:/Users/SRUJAN/Desktop/dicdesign/encoder_8x2/encoder.txt","w");
$monitor("@time %gns i=%b y=%b",$time,i,y);

i=8'b0000_0000;
#1;
write_to_file;
#5
i=8'b0000_0001;
#1;
write_to_file;
#5
i=8'b0000_0010;
#1;
write_to_file;
#5
i=8'b0000_0100;
#1;
write_to_file;
#5
i=8'b0000_1000;
#1;
write_to_file;
#5
i=8'b0001_0000;
#1;
write_to_file;
#5
i=8'b0010_0000;
#1;
write_to_file;
#5
i=8'b0100_0000;
#1;
write_to_file;
#5
i=8'b1000_0000;
#1;
write_to_file;
#5
$fclose(file_handle);
#5 
$finish();
end
endmodule
```
## RTL SCHEMATIC
![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/69c6374a-b9c9-447d-a0e0-68e3b93d7048)


## BEHAVORIAL SIMULATION
![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/33ef803a-74ad-45b2-a5f0-f7236d92b95b)


## SYNTHESIS SCHEMATIC
![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/2ad0bdd7-b478-42f6-88fe-49810fed6d92)


[EDAPLAYGROUND LINK](https://www.edaplayground.com/x/ESzK) 
