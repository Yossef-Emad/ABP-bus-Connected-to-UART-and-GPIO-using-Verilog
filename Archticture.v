module finiteStateMachine(reset,taken,clk,predict);
output predict;
input taken,clk,reset;
reg predict;
reg[1:0]state,currentState;
parameter stateA=2'b00,stateB=2'b01,stateC=2'b10,stateD=2'b11;
always@(posedge clk)begin
  if(reset)
    state<=stateA;
  else 
    state<=currentState;
  
always@(state)begin
    case(state)
      stateA: if(taken)
            currentState<=stateA;
            else currentState<=stateB;
              
      stateB: 
            if(taken)currentState<=stateA;
            else currentState<=stateC;
    stateC: 
            if(taken)currentState<=stateD;
            else currentState<=stateC;
    stateD: 
            if(taken)currentState<=stateA;
            else currentState<=stateC;
        endcase
      end
  always@(state)begin
    case(state)
     stateA:  predict=1'b1;   
      stateB: predict=1'b1;
      stateC: predict=1'b0;
      stateD: predict=1'b0;
    endcase
  end 

  endmodule 
        
        
        