# Circular-synchronous-FIFO-RTL-to-GDS-
## Circular fifo
Circular FIFO is a data structure used to store and process data in First-In, First-Out order, but arranged in a circular memory layout.
Unlike conventional FIFOs it doesn't end at the end of memory block,instead it loops back at the starting point.
#### How `full` and `empty` are implemented
- When read pointer catches upto write pointer `empty` is asserted.
- When write pointer catches upto read pointer `full` is asserted.

#### The full/empty ambiguity problem
- In circular fifo when `wr_ptr==rd_ptr` it becomes an ambiguity whether fifo is full or empty i.e. did write pointer caught upto read pointer or read pointer caught upto write pointer.
- To solve this problem,the provided code uses `looped` flag.When `looped` is high,this means write pointer will catch upto read pointer and equality means full.
- When `looped` is low that means read pointer will catch upto write pointer and equality means empty.
- `looped` flag is asserted when write pointer loops back to 0 and deasserted when read pointer loop backs.

## RTL to GDS flow
This design uses OpenLane for complete flow.
Refer to online tutorials for installation.

After successful installation run the following commands:

```
cd OpenLane
make mount 
```
Wait for the docker environment to activate.
now go into designs and run:
```
mkdir fifo
cd fifo
```
Place `config.json` here.
 **DO NOT CHANGE `config.json`**
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

You will find your gds file in `designs/fifo/\<Your latest run\>/results/final/gds` if your flow was successfully completed.
To open gds run:
```
klayout -e *
```
> `-e` is to open klayout in editor mode.
