## FULL ADDER 
In this I will demontrate the implementation of full adder using sructural modelling

<br>As we know to build a full adder we need two half adder and an OR gate.
So the module instance include two half adder and an OR gate.<br>

## Truth table of Full adder

|A|B|Cin|SUM|CARRY|
|-|-|---|---|-----|
|0|0|0|0|0|
|0|0|1|0|1|
|0|1|0|0|1|
|0|1|1|1|0|
|1|0|0|0|1|
|1|0|1|1|0|
|1|1|0|1|0|
|1|1|1|1|1|

```
module fa(input a,b,c,
          output sum,co);
  
  ha ins1(a,b,s1,c1);
  ha ins2(s1,c,sum,c2);
  orgate ins3(c1,c2,co);
    
  
endmodule

//half ader
module ha(input a,b,
          output sum,co);
  
  assign sum=a^b,
         co=a&b;
    
  
endmodule
///or gate
module orgate(input a,b,
          output y);
  
  or(y,a,b);
    
  
endmodule

```
```
//TEST_BENCH
// Code your testbench here
// or browse Examples
`timescale 1ns/1ps

module tb_fa;
  
  reg a,b,c;
  wire sum,co;
  integer i;
  
  fa dut(a,b,c,sum,co); //Instantiation; here dut is called instantiation name
  
  initial
    begin
      for(i=0; i<8; i=i+1)
        begin
          {a,b,c}=i;  //i=0,1,2,3,4,5,6,7      (5)d=(101)b
          #5;
        end
      
      #5 $stop;      
      
    end
  
endmodule
```
### Behavorial simulation
![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/c8b887b9-d91d-4bee-88b8-5508d33bb6ac)

### RTL SCHEMATIC
![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/49449d86-e900-4ea6-94a7-b074731c39f0)


### SYSNTHESIS SCHEMATIC
![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/72140fe4-dea8-4579-9938-f0279d9f9aed)


### EDAPLAYGROUND LINK:(https://www.edaplayground.com/x/UuFd)


