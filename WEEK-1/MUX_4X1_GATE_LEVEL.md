## 4X1 MULTIPLEXER
In this I will demonstrate the implementation of 4X1 multiplexer using gate level modelling.

### verilog code
```
module mux4x1(a,b,c,d,s1,s0,y);
  
  input a,b,c,d,s1,s0;
  output y;
  
  
  not(s1bar,s1);
  not(s0bar,s0);
  
  and(y0, a,s0bar,s1bar);
  and(y1,b, s0,s1bar);
  and(y2,c,s0bar,s1);
  and(y3,d,s0,s1);
  
  or(y,y0,y1,y2,y3);
  
endmodule
```
```
//test bench
`timescale 1ns/1ps
module tb_mux4x1;
  
   reg a,b,c,d,s1,s0;
   wire y;
  
  mux4x1 dut(a,b,c,d,s1,s0,y);
  
  //unit undet test -uut
  //cut - component under test
  //cut - circuit under test
  //dut - design under test
  
  initial
    begin
      a=0; b=1; c=0; d=1; s1=0; s0=0;
      #5 s0=1;
      #5 s1=1; s0=0;
      #5 s0=1;
      #5 $stop;//$stop is system task
    end
endmodule
```
### RTL SCHEMATIC
![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/819ae2e4-f43d-45e6-bf13-5d86320da7a9)

### Behavorial simulation
![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/e49f402a-9fe9-4ea0-8e07-22c20137d9bb)

### SYSNTHESIS SCHEMATIC
![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/4260d0d6-7c1b-4f02-923e-5cc98a3e2624)

### EDAPLAYGROUND LINK:(https://www.edaplayground.com/x/qffn)






