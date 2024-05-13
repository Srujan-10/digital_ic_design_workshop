### 2X1 MULTIPLEXER
In this I will demonstrate the implementation of 2X1 multiplexer using gate_level and data_flow level modelling.

## Verilog code
```
//design file:implementation using data flow level modelling
module MUX_2X1(input a,b,s,output y);
assign sbar=~s;
assign Y1=a&sbar;
assign Y2=b&s;
assign y=Y1^Y2;
endmodule

```
```
//design file:implementation using gate level modelling
module MUX_2X1(input a,b,s,output y);
not(sbar,s);
and(Y1,a,sbar);
and(Y2,b,s);
or(y,Y1,Y2);
```
```
///test bench
`timescale 1ns / 1ps
module tb_mux_2x1;
reg a,b,s;
wire y;
MUX_2X1 dut(a,b,s,y);
initial 
begin
a=0;b=1;s=0;
#5 a=1;b=0;s=1;
#5 b=1;s=0;
#5 s=1; 
#5 $stop;
end

endmodule

```
### RTL SCHEMATIC

![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/b2398be9-7d60-4d25-8691-204cb77dc2bf)


### BEHAVORIAL SIMULATION

![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/7af0010e-d90a-4182-9eb2-b99bc306a877)


### SYNTHESIS SCHEMATIC
![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/9442078f-0a0a-4906-8610-1ad2d1326f46)

## EDAPLAYGROUND LINK:
[GATE_LEVEL link](https://www.edaplayground.com/x/X2sD)  
[data_flow link]:(https://www.edaplayground.com/x/pm_B)
