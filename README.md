# FPGA_Lab_9

Project Description:
This project focuses on designing, testing, and implementing two different 4-bit multipliers on an FPGA: a sequential multiplier and a combinational multiplier. The sequential multiplier uses a shift-and-add algorithm controlled by a finite state machine, producing the product over several clock cycles with minimal hardware resources. In contrast, the combinational multiplier generates the product in a single cycle using parallel logic, offering faster performance at the cost of increased circuit complexity. Both designs are written in Verilog, simulated using corresponding testbenches, and synthesized in Vivado. Proper XDC pin assignments are created to interface the inputs and outputs with FPGA switches, LEDs, or seven-segment displays. After programming the board, the results of both multipliers are visually observed and compared. Through this process, the project demonstrates the trade-offs between sequential and combinational hardware architectures and strengthens practical skills in digital logic design and FPGA development.

Instructions for Simulation and FPGA Implementation

1. Create Project in Vivado:
   Open Vivado and create a new RTL project. Add the Verilog files for the sequential and combinational multipliers along with their testbenches.

2. Run Behavioral Simulation:
   Set the testbench as the top module and run the behavioral simulation. Verify that the waveform output matches the expected product for different input combinations.

3. Synthesize the Design:
   Switch back to the multiplier module as the top. Run Synthesis and check for any errors or warnings. Review the synthesized schematic to ensure correctness.

4. Implement the Design:
   After successful synthesis, run Implementation. Confirm that timing constraints are met and the design is ready for device programming.

5. Assign FPGA Pins (XDC File):
   Open the XDC constraints file and assign appropriate pins for inputs (switches or buttons), outputs (LEDs or 7-segment pins), and the clock. Validate pin mappings with the FPGA board’s reference manual.

6. Generate Bitstream:
   Once implementation is complete, generate the bitstream file. This will create the binary configuration used to program the FPGA.

7. Program the FPGA Board:
   Connect the FPGA board, power it on, and use Vivado’s Hardware Manager to upload the bitstream. Verify that the board detects the device, and press *Program Device*.

8. Test on Hardware:
   Provide input values using switches or buttons and observe results on LEDs or 7-segment displays. Compare the sequential and combinational multiplier outputs, confirming correct operation on real hardware.

9. Debug and Validate:
   If outputs do not match expectations, re-check XDC assignments, input stability, clock setup, and any potential logic issues. Adjust, regenerate the bitstream, and reprogram as needed.

