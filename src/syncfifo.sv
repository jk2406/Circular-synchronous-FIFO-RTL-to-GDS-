
module syncfifo (
    input logic we,
    input logic[31:0] din,
    input logic re,
    input logic clk,
    input logic rstn,
    output logic[31:0] dout,
    output logic full,
    output logic empty
);

logic[31:0] mem[0:63];
logic[5:0] wr_ptr;
logic[5:0] rd_ptr;

logic looped;
always_ff @( posedge clk or negedge rstn ) begin 
    if (!rstn) begin
        wr_ptr<=0;
        rd_ptr<=0;
        dout <=0;
        full<=0;
        empty<=0;
        looped<=0;
    end
    else begin
        full<=0;
         empty<=0;
        if (we) begin
            if (wr_ptr==rd_ptr&&looped) begin
                    full<=1;
                    empty<=0;
            end
            else if (wr_ptr==63) begin
                looped<=1;
                wr_ptr<=0;
                mem[wr_ptr]<=din;
            end
            else begin
                mem[wr_ptr]<= din;
                wr_ptr<=wr_ptr+1;
            end
        end
        if (re) begin
                if (rd_ptr==wr_ptr) begin
                    if (!looped) begin
                        empty<=1;
                        full<=0;
                    end
                    else begin
                        dout<=mem[rd_ptr];
                        if (rd_ptr==63) begin
                            rd_ptr<=0;
                            looped<=0;
                        end
                        else rd_ptr<=rd_ptr+1;
                    end 
                end
                else if (rd_ptr==63) begin
                        dout<=mem[rd_ptr];
                        looped<=0;
                        rd_ptr<=0;
                end
                else begin
                    dout<=mem[rd_ptr];
                    rd_ptr<=rd_ptr+1;
                end
            end
    end
end
    


endmodule