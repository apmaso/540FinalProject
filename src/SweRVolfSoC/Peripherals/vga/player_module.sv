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
    // Initializing Player 30 rows from the bottom of the screen. Rows 431 <--> 450
    // and close to centered as possible. Columns: 306 <-> 335
    player_row = 440;
    player_column = 305;
end

always_comb begin
    // Enable output of the player's sprite when in the proper region
    // Player sprite is 20 rows by 30 columns (measured in pixels)
    // Are we in the Sprite Region???
    player_active_reg = ((player_row < pixel_row) && (pixel_row < player_row + 21) && (player_column < pixel_column) && (pixel_column < player_column + 31));
    
    
    // Sprite data for Player....  I can make this logic much simpler, if needed
    // Rows 1 - 4 of the player's sprite            
    if ((player_row < pixel_row) && (pixel_row < player_row  + 5) && (player_column + 14 < pixel_column) && (pixel_column < player_column + 17))
        begin
            player_pix = 4'b1111;
        end    
    // Rows 5 & 6 of the player's sprite
    else if ((player_row + 4 < pixel_row) && (pixel_row < player_row  + 7) && (player_column + 4 < pixel_column) && (pixel_column < player_column + 27))
        begin
            player_pix = 4'b1111;
        end
    // Rows 7 & 8
    else if ((player_row + 6 < pixel_row) && (pixel_row < player_row  + 9) && (player_column + 2 < pixel_column) && (pixel_column < player_column + 29))
        begin
            player_pix = 4'b1111;
        end
    // Rows 9 - 20
    else if ((player_row + 8 < pixel_row) && (pixel_row < player_row  + 21) && (player_column < pixel_column) && (pixel_column < player_column + 31))
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

