# FPGA simple ALU

Simple ALU implementation as first FPGA project. Goal is to build a 8-bit ALU with Carry, Half-Carry and Overflow flags on Digilent Basys3.

## Inputs map

label|description
--|--
btnU|Trigger SUM output from A and B. Show ACR, AVR and HC flags.
btnL|Trigger AND output from A and B.
btnR|Trigger OR output from A and B.
btnD|Trigger XOR output from A and B.
btnC|Trigger logical right shift output from B. Show ACR flags.
a|8 bits input bus. SW0:7 on physical board.
b|8 bits input bus. SW8:15 on physical board.

## Outputs map

label|description
--|--
led|Output of the ALU using led LD0 to LD7 on physical board.
acr|Carry flag. Trigger if sum output a carry or if bit shifted is one. LD15 on physical board.
avr|Overflow flag. After a signed sum verify that result has not overflow signed range. LD13 on physical board.
hc|Half carry flag. Carry of 4 bits sum of a(0:3) and b(0:3). LD14 on physical board.

## Logisim Evolution implementation

Implementation using Logisim Evolution (v3.9.0 Nightly). Program has same behavior as written with VHDL. But, undefined (floating) signal can result in unexpected behavior.

Seems to have no optimization on Logisim side. All components are recreated and wired as draw. May take much more resources than manual VHDL writing.
