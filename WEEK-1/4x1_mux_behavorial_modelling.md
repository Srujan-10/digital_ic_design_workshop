## 4x1 multiplexer using behavorial modelling
In tnis I will demonstrate how to implement 4x1 multiplexer using behavorial modelling
## verilog code
```

module mux_4x1_behavorial(a,b,c,d,s1,s0,y);
  
  input a,b,c,d; // input ports
  input s1,s0; // select lines
  output reg y; // output port output keyword belongs to wire data type
  
  always@(*) //always@* or always@(a,b,c,d,s1,s0)
    begin
    case({s1,s0})
      2'b00:y=a;
      2'b01:y=b;
      2'b10:y=c;
      2'b11:y=d;
    endcase
    end
  
endmodule
  
```
```
`timescale 1ns/1ps
module tb_mux;
  reg a,b,c,d; // input ports
  reg s1,s0; // select lines
  wire y; // output
  
   mux_4x1_behavorial dut(a,b,c,d,s1,s0,y);
  
  initial 
    begin
      a=0; b=1; c=0; d=1; s1=0; s0=0;
      #5 s0=1;
      #5 s1=1; s0=0;
      #5 s0=1;
      #5 $stop;     
      end
  
  initial
   begin
    $monitor("@time %gns a=%b,b=%b,c=%b,d=%b,s1=%b,s0=%b,y=%b",$time, a,b,c,d,s1,s0,y);
    end
   
endmodule
```
## RTL schematic
![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/fa0da792-3d52-431e-b068-161fd4671ca1)


## BEHAVORIAL SIMULATION
![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/bd693d0b-2f55-4797-827c-2ac95f5b6ba4)


## Synthesis schematic
![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/08f8cb7c-2db7-4534-b9eb-48e63d1108e2)


EDAPLAGROUND LINK(https://www.edaplayground.com/x/rgZn)
