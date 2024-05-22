## fsm 1100 mealy

## State diagram

## Verilog code
```
// Code your design he
// Code your design here
module fsm1100mealy(clk,rst,data_in,data_out);
  
  
  input clk,rst;  //control signals
  input data_in;  //data signal
  
  output reg data_out;
  
  parameter s0=0,s1=1,s2=2,s3=3;
  
  reg [1:0]cs,ns;
  
  //SL
  
  always@(posedge clk)
    if(rst)
      cs<=0;
  else
    cs<=ns;
  
  // cl1 and cl2
  
  always@(data_in,cs)
    case(cs)
      s0: if(data_in) 
            begin
              ns=s1;
              data_out=0;
            end
      		else
              begin
              ns=s0;
              data_out=0;
            end
              
        s1:if(data_in) 
            begin
              ns=s2;
              data_out=0;
            end
      		else
              begin
              ns=s0;
              data_out=0;
            end
        s2:if(data_in) 
            begin
              ns=s2;
              data_out=0;
            end
      		else
              begin
              ns=s3;
              data_out=0;
            end
        s3:if(data_in) 
            begin
              ns=s1;
              data_out=0;
            end
      		else
              begin
              ns=s0;
              data_out=1;
            end
        default: begin
                    ns=s0;
                    data_out=0;
                 end
      		
    endcase
  
endmodule
```
```
// Code your testbench here
// or browse Examples
`timescale 1ns/1ps

module tb;
  
    
  reg clk,rst;  //control signals
  reg data_in;  //data signal
  
  wire data_out;
  
  fsm1100mealy dut(clk,rst,data_in,data_out);
  
  initial begin
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
      #8 data_in=1;
      @(posedge clk);
      #1;
      
      data_in=1;
      @(posedge clk);
      #1;
      
      data_in=0;
      @(posedge clk);
      #1;
      
      
      data_in=0;
      @(posedge clk);
      #1;
      
      data_in=1;
      @(posedge clk);
       #1;
      
      data_in=1;
      @(posedge clk);
      #1;
      
      data_in=0;
      @(posedge clk);
      #1;
      
        data_in=0;
      @(posedge clk);
       #1;
      
      data_in=1;
      @(posedge clk);
      #1;
      
      data_in=1;
      @(posedge clk);
      #1;
      
      $stop;
      
      
    end
  
 
  
endmodule
```
## Behavorial simulation

## RTL schematic

## Synthesis schematic


https://www.edaplayground.com/x/RHyA
