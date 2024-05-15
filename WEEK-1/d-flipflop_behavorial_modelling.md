## D flip flop
In this I will demonstrate implementation of d flip flop using behavorial modelling.

## verilog code
```
module dff_pc_sr(clk,rst,d,q);
  
  input clk,rst; // control input signals
  input d; // data input signal
  output reg q;
  
  always@(posedge clk) //always@* //level sensitive
    if(rst)
      q<=1'b0;
  else
    q<=d;
  
endmodule
  
```
```
//test bench
`timescale 1ns/1ps
module tb_dff();
  
  reg clk,rst; // control input signals
  reg d; // data input signal
  wire q;
  
  dff_pc_sr dut(clk,rst,d,q);
  
  initial
    begin
      clk=0; 
      rst=0;
      #5 rst=1;
      #1 rst=0;
    end
  
  always #5 clk=~clk;
  
  initial begin
    
    d=1;
    @(posedge clk);
    #1;
    
    d=0;
    @(posedge clk);
    #1;
    
    d=1;
    @(posedge clk);
    #1;
    
    $stop;
    
  end
    
endmodule
    
    
```

## RTL SCHEMATIC
![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/f49fbf0f-3126-4df8-b1bf-6efe3f0241b1)


## Behavorial simulation
![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/c70eb157-0f28-49af-be35-eef3658c1a7e)


## Synthesis schematic
![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/2ac9ac97-bf3e-4a3b-bf3d-1de96c71cdb4)



[EDA PLAYGROUND LINK](https://www.edaplayground.com/x/rgZn).
