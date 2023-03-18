// 
// 
// 
// 
//
// Created by Alexander Maso PSU ECE-Winter 2023
///////////////////////////////////////////////////////////////

module player(
    input  wire                clk, rst,
    input  wire    [11:0]      pixel_row, pixel_column, 
    input  wire    [11:0]      btn_col, 
    output wire                player_active, 
    output wire    [3:0]	   player_output
    );

// Internals
logic   [3:0]               player_pix;
logic   [11:0]              player_row;
logic   [11:0]              player_column;
logic                       player_active_reg;
//logic   [11:0]              missle_row_ff;
//logic   [11:0]              missle_column_ff;
//logic   [11:0]              missle_row_next;
//logic   [11:0]              missle_column_next;
//logic   [23:0]              motion_counter;

    
initial begin
    player_pix = 4'b0000;
    // Initializing Player 20 rows from the bottom of the screen. Rows 451 <-> 460
    // and close to centered as possible. Columns: 313 <-> 328
    player_row = 460;
    player_column = 312;
end

always_comb begin
    // Enable output of the player's sprite when in the proper region
    // Alien2's Sprite is 16 rows by 16 columns of pixels   
   
    // Are we in the Sprite Region???
    // ***** TURN THIS INTO AN ASSIGN STATEMEN WITH TERNARY OPERATOR *****
    player_active_reg = ((player_row < pixel_row) && (pixel_row < player_row + 11) && (player_column < pixel_column) && (pixel_column < player_column + 16));
    
    
    // Sprite data for Player....  I can make this logic much simpler, if needed
    // Row one and two of the player's sprite            
    if ((player_row < pixel_row) && (pixel_row < player_row  + 3) && (pixel_column == player_column + 8))
        begin
            player_pix = 4'b1111;
        end    
    // Row three of the player's sprite
    else if ((player_row + 3 == pixel_row) && (player_column + 2 < pixel_column) && (pixel_column < player_column + 14))
        begin
            player_pix = 4'b1111;
        end
    // Row four of the player's sprite
    else if ((player_row + 4 == pixel_row) && (player_column + 1 < pixel_column) && (pixel_column < player_column + 15))
        begin
            player_pix = 4'b1111;
        end
    // Row five through 10 of the player's sprite
    else if (((player_row + 4 < pixel_row) && (pixel_row < player_row  + 11)) && (player_column < pixel_column) && (pixel_column < player_column + 16))
        begin
            player_pix = 4'b1111;
        end
    else
        begin
            player_pix = 4'b0000;
        end
end

// Additional comb and ff block for FSM used in implemention of motion
// Do not need this yet, first moving player sprite to a separate module
// Next I will implement the missle logic here
/*
always_comb begin

// Every 16 M clocks (31.5 MHz clk -> ~0.5 sec) move alien left or right by 4 pixels.
// Sprite moves down 8 rows of pixels and changes direction at edge of display 
// 680 - 8 pix wide = 672... 1 + 8 = 9
// ***** Might want to try ---> if (sprite_column > 670) so condition is a multiple of 4
// ***** I believe I can remove _ff from comb block. Use sprite_row instead for example
    if (move_left) begin
        if (sprite_column < 21) 
            begin
                sprite_row_next = (sprite_row_ff + 24);
                sprite_column_next = sprite_column_ff;
                move_left_next = 1'b0;
            end
        else
            begin
                sprite_row_next = sprite_row_ff;
                sprite_column_next = (sprite_column_ff - 12);
                move_left_next = 1'b1; 
            end      
    end
    else begin
        if (sprite_column > 620) 
            begin
                sprite_row_next = (sprite_row_ff + 24);
                sprite_column_next = sprite_column_ff;
                move_left_next = 1'b1;
            end
        else
            begin
                sprite_row_next = sprite_row_ff;
                sprite_column_next = (sprite_column_ff + 12);
                move_left_next = 1'b0; 
            end  
    end
    
end


always_ff @ (posedge clk) begin
    if (motion_counter < 16000000) 
        begin
            sprite_row_ff <= sprite_row_ff;
            sprite_column_ff <= sprite_column_ff;
            motion_counter <= (motion_counter + 1);
            move_left_ff <= move_left_ff;
        end
   else 
        begin
            sprite_row_ff <= sprite_row_next;
            sprite_column_ff <= sprite_column_next;
            motion_counter <= 0;
            move_left_ff <= move_left_next;
        end

end
*/


assign player_active = player_active_reg;
assign player_column = btn_col;
assign player_output = player_pix;

endmodule

