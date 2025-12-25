# Circular-synchronous-FIFO-RTL-to-GDS-
## Circular fifo
Circular FIFO is a data structure used to store and process data in First-In, First-Out order, but arranged in a circular memory layout.
Unlike conventional FIFOs it doesn't end at the end of memory block,instead it loops back at the starting point.
#### How `full` and `empty` are implemented
- When read pointer catches upto write pointer `empty` is asserted.
- When write pointer catches upto read pointer `full` is asserted.
- To decide which one catches upto whom a special flag is used in the code that is `looped` flag.
- `looped` flag is asserted when write pointer loops back to 0 and deasserted when read pointer loop backs.
- 
  
This design uses OpenLane for complete flow.
Install docker and openlane to verify the run.
Run the following:
```
cd OpenLane
make mount 
```
Go into designs and run:
```
mkdir fifo
cd fifo
```
Place `config.json` here.
 **DO NOT CHANGE `config.json` **
Now do:
```
mkdir src
cd src
```
place systemverilog file here.
Now do:
```
cd ~/openlane
./flow.tcl -design fifo
```

## RTL
