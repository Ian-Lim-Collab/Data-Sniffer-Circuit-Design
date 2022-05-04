module DataSniffer(input logic DataIn,CLK,Reset,
                    output logic DataOut,RecordFlag);

    typedef enum logic [3:0] {S0,S1,S2,S3,S4,S5} statetype;
    statetype state,nextstate;
    logic intermediate1,intermediate2,intermediate3;

    always_ff@(posedge CLK) begin
        if(Reset)state <= S0;
        else begin
                state <= nextstate;
                if(RecordFlag) begin
                    intermediate2<= intermediate1;
                    intermediate3 <= intermediate2;
                    DataOut <= intermediate3;
                end
            end
    end

        

    always_comb begin
        case(state)
            S0:if(DataIn) nextstate = S1;
                else nextstate = S0;
            S1:if(DataIn) nextstate = S1;
                else nextstate = S2;
            S2:if(DataIn) nextstate = S3;
                else nextstate = S0;
            S3:if(DataIn) nextstate = S3;
                else nextstate = S4;
            S4:if(DataIn) nextstate = S3;
                else nextstate = S5;
            S5:if(DataIn) nextstate = S3;
                else nextstate = S0;
            default: nextstate = S0;
        endcase
    end

    assign RecordFlag = (state == S3| state == S4 | state == S5);
    assign intermediate1 = RecordFlag & DataIn;
    
endmodule    