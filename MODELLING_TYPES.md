# digital_ic_design_workshop
This repository is to present my learning of digital ic  design based on FPGA and ASIC. 

[My week1 activities](https://github.com/ASHREDD/digital_ic_design_workshop/tree/main/Week-1%20Activities)

### WEEK 1 ACTIVITIES: Learning Verilog HDL
-- Language fundamentals
-- Types of modelling
<ol>
  <li>Switch level modelling</li>
    <li>Gate level modelling</li>
    <li>Dataflow level modelling</li>
    <li>Behavorial level modelling</li>
    <li>Structural level modelling</li>
</ol>

-- Switch level modelling
<p allign="justify">In this we have switch level primitives such as nmos, pmos, for power supply we have keywords such as supply1,supply0. This modelling is used only for simulation purposes. This is not supported by the synthesizer tools.</p> 

-- Gate level modelling
<p allign="justify">In this modelling designer is supposed to be having the logic circuit idea, without logic circuit it is not possible to use this type of modelling because in this we primarly use gate primitives
such as and, nand, or, nor, xor, xnor, not, buf, notif0, notif1, bufif0, bufif1. Among these primitives some are single output and multiple input gates and some are multiple output single input gates</p>

-- Examples using Gate level modelling

1. Half adder

![image](https://github.com/ASHREDD/digital_ic_design_workshop/assets/168950588/f26f9e3d-3ba6-4e01-9668-d4a65eec3619)

<br>The truth-table of Half adder<br>

|a|b|sum|co|
|-|-|---|--|
|0|0|0|0|
|0|1|1|0|
|1|0|1|0|
|1|1|0|1|

```
// Design file ha.v

module ha(a,b,sum,co);
input a,b;
output sum,co;

and(co,a,b);
xor(sum,a,b);

endmodule

//Testbench

`timescale 1ns/1ps
module tb_ha;

reg a,b;
wire sum,co;

ha  dut(a,b,sum,co);

initial
begin
a=0;b=0;
#5 b=1;
#5 a=1; b=0;
#5 b=1;
#5 $stop;   //$stop is a system task which stops the ongoing simulation
end
endmodule
```
EDAplayground link for half adder: [Half adder using gates](https://www.edaplayground.com/x/8rjq)

