// SV Module to display one copy of alien_A through the VGA port
// Module includes two 12 bit registers to store row and column
// addresses.  Future improvements will utilize the registers
// to implement automated motion for the SPACE INVADERS!
//
// Created by Alexander Maso PSU ECE-Winter 2023
//
// Alien2 does not move on its own yet.  Will in future 
// implementation
//
///////////////////////////////////////////////////////////////

module alien2(
    input  wire                clk, rst,
    input  wire    [11:0]      pixel_row, pixel_column, 
	output wire    [3:0]	   alien2_output,
    output wire                alien2_active
    );

// Internals
logic   [11:0]              sprite_row;
logic   [11:0]              sprite_column;
logic   [11:0]              sprite_row_ff;
logic   [11:0]              sprite_column_ff;
logic   [3:0]               alien2_pix;
logic   [11:0]              sprite_row_next;
logic   [11:0]              sprite_column_next;
logic                       active; 
logic   [23:0]              motion_counter;
logic                       move_left;
logic                       move_left_ff;
logic                       move_left_next;

    
initial begin
    active = 1'b0;
    alien2_pix = 4'b0000;
    // Initializing Alien2 20 rows from the top of the screen. Rows 21 <-> 36
    // and close to centered as possible. Columns: 313 <-> 328
    sprite_column_ff = 312;
    sprite_row_ff = 20;
    sprite_column = 312;
    sprite_row = 20;
    motion_counter = 0;
    move_left = 1'b0;
end

always_comb begin
    // Enable output of the player's sprite when in the proper region
    // Alien2's Sprite is 16 rows by 16 columns of pixels   
   
    // Are we in the Sprite Region???
    // ***** TURN THIS INTO AN ASSIGN STATEMEN WITH TERNARY OPERATOR *****
    active = ((sprite_row < pixel_row) && (pixel_row < sprite_row + 17) && (sprite_column < pixel_column) && (pixel_column < sprite_column + 17));
    
    
    // Sprite data for Alien2....  I can make this logic much simpler, if needed
    // Row one & two of Alien2's Sprite    
    if ((sprite_row < pixel_row) && (pixel_row < sprite_row  + 3) && (sprite_column + 6 < pixel_column) && (pixel_column < sprite_column + 11))
        begin
            alien2_pix = 4'b1111;
        end   
    // Row 3 & 4 of Alien2's Sprite
    else if ((sprite_row + 2 < pixel_row) && (pixel_row < sprite_row  + 5) && (sprite_column + 4 < pixel_column) && (pixel_column < sprite_column + 13))
        begin
            alien2_pix = 4'b1111;
        end   
    // Row 5 & 6 of Alien2's Sprite
    else if ((sprite_row + 4 < pixel_row) && (pixel_row < sprite_row  + 7) && (sprite_column + 2 < pixel_column) && (pixel_column < sprite_column + 15))
        begin
            alien2_pix = 4'b1111;
        end
    // Row 7 & 8 of Alien2's Sprite
    else if ((sprite_row + 6 < pixel_row) && (pixel_row < sprite_row  +  9) && (pixel_column != sprite_column + 5) && (pixel_column != sprite_column + 6) && (pixel_column != sprite_column + 11) && (pixel_column != sprite_column + 12))
        begin
            alien2_pix = 4'b1111;
        end
    // Row 9 & 10 of Alien2's Sprite
    else if ((sprite_row + 8 < pixel_row) && (pixel_row < sprite_row + 11) && (sprite_column < pixel_column) && (pixel_column < sprite_column + 17))
        begin
            alien2_pix = 4'b1111;
        end
    // Row 11 & 12 of Alien2's Sprite
    else if ((sprite_row + 10 < pixel_row) && (pixel_row < sprite_row  + 13) && ((sprite_column + 5 == pixel_column) || (sprite_column + 6 == pixel_column) || (pixel_column == sprite_column + 11) || (pixel_column == sprite_column + 12)))
        begin
            alien2_pix = 4'b1111;
        end
    // Row 13 & 14 of Alien2's Sprite
    else if ((sprite_row + 12 < pixel_row) && (pixel_row < sprite_row  + 15) && (pixel_column != sprite_column + 1) && (pixel_column != sprite_column + 2) && (pixel_column != sprite_column + 5) && (pixel_column != sprite_column + 6) && (pixel_column != sprite_column + 11) && (pixel_column != sprite_column + 12) && (pixel_column != sprite_column + 15) && (pixel_column != sprite_column + 16))
        begin
            alien2_pix = 4'b1111;
        end
    // Row 15 & 16 of Alien2's Sprite
    else if ((sprite_row + 14 < pixel_row) && (pixel_row < sprite_row  + 17) && (pixel_column == sprite_column + 1) && (pixel_column == sprite_column + 2) && (pixel_column == sprite_column + 5) && (pixel_column == sprite_column + 6) && (pixel_column == sprite_column + 11) && (pixel_column == sprite_column + 12) && (pixel_column == sprite_column + 15) && (pixel_column == sprite_column + 16))
        begin
            alien2_pix = 4'b1111;
        end 
    else
        begin
            alien2_pix = 4'b0000;
        end
end

// Additional combinational block for FSM used in implemention of motion for Alien2
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

assign move_left = move_left_ff;
assign sprite_row = sprite_row_ff;
assign sprite_column = sprite_column_ff;
assign alien2_output = alien2_pix;
assign alien2_active = active; 

endmodule
