# Data-Sniffer-Circuit-Design
SystemVerilog For Data Sniffer Circuit Design

The Circuit was design for a transmission protocol that is a synchronous serial data transfer protocol with a header data of “101” and a footer data of “000”. It is also known that within the data there is no three consecutive low bits. There is no error detection features for this protocol and a led to indicate the data is begin recorded.

The circuit was simulated on a Sipeed Tang Nano 1K FPGA which is the reason of the .gprj file as the software for the FPGA was a proprietary software developed by the manufacture :GOWIN semiconductor. The board was selected as a testbench due to its low cost.
