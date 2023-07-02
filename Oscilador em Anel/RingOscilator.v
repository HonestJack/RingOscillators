module RingOscilator (
   input  en,
   output reg not_3 /*synthesis keep*/,
				  not_1 /*synthesis keep*/,
              not_2 /*synthesis keep*/,
              and_1 /*synthesis keep*/
);

/*
input en;
output not_3;  //RTL
*/


/*
assign and_1 = en & not_3;
assign not_1 = ~ and_1;
assign not_2 = ~ not_1;
assign not_3 = ~ not_2;
*/

always @ (*)
begin
    and_1 <= en & not_3;
    not_1 <= ~and_1;
    not_2 <= ~not_1;
    not_3 <= ~not_2;
end

endmodule


/*
module ringosi(enable, not_1, not_2, not_3, and_1);
    input enable;
    output not_1, not_2, not_3, and_1;

    and u1(and_1, enable, not_3);
    not #5 u2(not_1, and_1); //Gate_level
    not #5 u3(not_2, not_1);
    not #5 u4(not_3, not_2);
endmodule



module top(en,not_1,not_2,not_3,and_1);
input en;
output not_1,not_2,not_3,and_1;
RingOscilator  c1 (en, not_1, not_2, not_3, and_1);
ringosi  c2 (enable, not_1,not_2, not_3,and_1);
endmodule 
*/
