## 3:8 DECODER
In this I will implement 3:8 decoder using  behavoria modelling.

## Truth table

|enable|A|B|C|D0|D1|D2|D3|D4|D5|D6|D7|
|------|-|-|-|--|--|--|--|--|--|--|--|
|1|0|0|0|1|0|0|0|0|0|0|0|
|1|0|0|1|0|1|0|0|0|0|0|0|
|1|0|1|0|0|0|1|0|0|0|0|0|
|1|0|1|1|0|0|0|1|0|0|0|0|
|1|1|0|0|0|0|0|0|1|0|0|0|
|1|1|0|1|0|0|0|0|0|1|0|0|
|1|1|1|0|0|0|0|0|0|0|1|0|
|1|1|1|1|0|0|0|0|0|0|0|1|

## BLACK BOX/BLOCK DIAGRAM
![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/44cc5d1d-d93f-49aa-9713-397d6373811f)


## Verilog code
```
//design file
`timescale 1ns / 1ps
module decoder_3_8(i,y);
input [2:0]i;
output reg [0:7]y;
always@(*)
begin
case(i)
3'b000 : y=8'b1000_0000;
3'b001 : y=8'b0100_0000;
3'b010 : y=8'b0010_0000;
3'b011 : y=8'b0001_0000;
3'b100 : y=8'b0000_1000;
3'b101 : y=8'b0000_0100;
3'b110 : y=8'b0000_0010;
3'b111 : y=8'b0000_0001;
default : y=8'b0000_0000;
endcase
end
endmodule
```
```
//test bench file
`timescale 1ns / 1ps
module tb_decoder();
reg [2:0]i;
wire [0:7]y;
integer file_handle1;
decoder_3_8 dut(i,y);
task write_to_file1;
$fwrite(file_handle1,"@time %gns i=%b y=%b\n",$time,i,y);
endtask
initial 
begin
file_handle1=$fopen("C:/Users/SRUJAN/Desktop/dicdesign/decoder_3_8/decoder.txt","w");
$monitor("@time %gns i=%b y=%b",$time,i,y);

i=3'b000 ;
#1;
write_to_file1;
#5
i=3'b001;
#1;
write_to_file1;
#5
i=3'b010;
#1;
write_to_file1;
#5
i=8'b011;
#1;
write_to_file1;
#5
i=8'b100;
#1;
write_to_file1;
#5
i=8'b101;
#1;
write_to_file1;
#5
i=8'b110;
#1;
write_to_file1;
#5
i=8'b111;
#1;
write_to_file1;
#5
$fclose(file_handle1);
#5 
$finish();
end
endmodule
```

## RTL SCHEMATIC

![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/f6c6d21b-87a0-4a4c-b4e2-f1b351df433f)

## BEHAVORIAL SIMULATION

![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/530a6a5a-a1d1-4aba-9351-0ac0c91b6ad6)


## SYNTHESIS SCHEMATIC

![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/7678042e-cbb1-49f3-a58d-4c766b688742)


[EDAPLAYGROUND]().







```
