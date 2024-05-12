#### IMPLEMENTATION OF HALF ADDER USING DATA FLOW MODELLING
In this I  will demonstrate the implementation of half adder using data flow modelling. 

<br> Lets consider a,b as the input variables and sum,carry as the output variables.
As we knoe the general truth table of half adder is given as

|a|b|sum|carry|
|-|-|---|-----|
|0|0|0|0|
|0|1|1|0|
|1|0|1|0|
|1|1|0|1|

### BLOCK DIAGRAM/BLACK BOX OF HALF ADDER

![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/db72229f-424a-4227-b8c9-23d47b7246b0)

### Verilog code
```
module orgate(input a,b,
          output y);
  
  or(y,a,b);
    
  
endmodule
```
```
module HF_tb;
  reg a,b;
  wire sum,carry;
  HF uut(sum,carry,a,b);
  initial 
    begin
      $display("a b sum carry");
      $monitor(a," ",b," ",sum," ",carry);
      a=0;b=0;
      #10 b=1;
      #10 a=1;b=1;
      #10 b=1;
    end 

  
endmodule

```
### BEHAVORIAL SIMULATION OF HALF ADDER
![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/fef4992e-b6d3-4f7b-8d20-5e36cd57a0dc)

### RTL ANALYSIS :SCHEMATIC 
![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/8ef56418-1326-4e48-8cf5-4992cb3eb0a0)

### SYSNTHESIS:SCHEMATIC
![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/24f6e6fa-684f-4aa7-a41b-c06ebffe82e0)





     
      



