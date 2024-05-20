## Finite state machine
In this  I will demonstrate the finite state machine using behavirial modelling.
example:detection of binary 101 in two cases such as overlapping(10101) and non-overlapping(101101).

## BLACK BOX

![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/43011139-6ce2-44e5-be36-4c62335ad7fe)




##  State diagram

![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/cf9907f1-4d13-41df-8e6c-2f159b22ce06)

## VERILOG CODE
```
// DESIGN FILE
module fsm101no(clk,rst,in,out);
  
  input clk,rst;
  input in;
  output out;
  
  reg [1:0]cs,ns;
  
  parameter s0=0, s1=1, s2=2, s3=3;
  
  
  always@(posedge clk)
    if(rst)
      cs<=0;
  else
    cs<=ns;
  
  always@(cs,in)
    case(cs)
      s0: if(in) ns=s1; else ns=s0;
      s1: if(in) ns=s1; else ns=s2;
      s2: if(in) ns=s3; else ns=s0;
      s3: if(in) ns=s1; else ns=s0;
      default: ns=s0;
    endcase
  
  assign out = (cs==s3) ? 1'b1 : 1'b0;
  
endmodule
    
```
```
module tb_fsm;
  
  
  reg clk,rst;
  reg in;
  wire out;
  
   fsm101no dut(clk,rst,in,out);
  
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
      
      #7 in=1;
      @(posedge clk);
      #1;
      
      
      #7 in=0;
      @(posedge clk);
      #1;
      
      
      #7 in=1;
      @(posedge clk);
      #1;
      
      
      
      #7 in=1;
      @(posedge clk);
      #1;
      
      
      
      #7 in=0;
      @(posedge clk);
      #1;
      
      
      #7 in=1;
      @(posedge clk);
      #1;
      
      
      #7 in=0;
      @(posedge clk);
      #1;
      
      #7 in=1;
      @(posedge clk);
      #1;
      
      #7 in=1;
      @(posedge clk);
      #1;
      
      #5 $stop;
      end
  endmodule
```

## BEHAVORIAL SIMULATION

![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/9f6556ba-5d27-419a-9d8b-4ababbbed587)

## RTL SCHEMATIC

![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/d68534ce-aa7f-4d44-a6a9-a69be0056a29)

## SYNTHESIS SCHEMATIC

![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/f09bb42b-ce5d-4c26-bba0-25a4d72eb3d0)

[EDAPLAGROUND LINK](https://www.edaplayground.com/x/RGXQ).

