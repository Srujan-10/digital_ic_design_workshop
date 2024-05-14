### Behavorial modelling:
<br>Behavioral modeling in Verilog refers to describing the functionality or behavior of a digital circuit using high-level constructs rather than explicitly detailing the hardware implementation. In behavioral modeling, you focus on what the circuit should do rather than how it should be implemented at a lower level.ere are mainly two types of behavioral modeling in Verilog:

1. Procedural Blocks: Procedural blocks in Verilog, such as `always` and `initial` blocks,
 allow you to describe the behavior of the circuit using sequential or concurrent statements.
These blocks can be used to model state machines, data paths, control logic, etc.
 Verilog provides constructs like `if-else`, `case`, `for` loops, etc., to describe the desired behavior in a more theoretical way.

3. Functions and Tasks: Verilog also allows you to define reusable blocks of code using functions and tasks.
   Functions return a single value, while tasks can perform a sequence of operations without returning a value.

Behavioral modeling is particularly useful during the early stages of design when you are focusing on the functionality and overall behavior of the circuit 
rather than its specific implementation details.
It allows for easier verification, simulation, and debugging of the design before moving on to more detailed modeling or synthesis.

In Verilog, blocking and non-blocking assignment operators are used to describe how values are assigned to variables within procedural blocks like `always` blocks. 
Understanding the difference between these two types of assignments is crucial for correctly modeling digital circuits.

1. Blocking Assignment (=):
   -- With blocking assignments, statements are executed sequentially, and each assignment is completed before moving on to the next statement in the block.
   -- The right-hand side (RHS) expression is evaluated immediately, and the assignment is completed before proceeding to the next statement.
   -- Blocking assignments are used when you want to model behavior where statements need to be executed in a specific order,and the result of 
      each assignment is required before moving to the next statement.

Example of blocking assignment:
```
always @ (posedge clk)
    a = b; // 'a' is assigned the value of 'b' in this clock cycle
```

2. Non-blocking Assignment (<=):
-- Non-blocking assignments are used to model concurrent behavior where all assignments within the block occur simultaneously.
-- The right-hand side (RHS) expression is evaluated for all assignments within the block,
-- and the assignments are scheduled to take effect concurrently after the entire block has been executed.
-- Non-blocking assignments are commonly used to model synchronous digital circuits, such as flip-flops,
-- where inputs are sampled concurrently and outputs are updated simultaneously at the rising edge of the clock.

Example of non-blocking assignment:
```verilog
always @ (posedge clk)
    a <= b; // 'a' will be assigned the value of 'b' in the next clock cycle
```

Overall, blocking assignments are used for sequential behavior, where each statement depends on the result of the previous one, 
while non-blocking assignments are used for concurrent behavior, where all statements can be evaluated simultaneously.
Understanding when to use each type of assignment is essential for accurately modeling digital circuits in Verilog.<br>
