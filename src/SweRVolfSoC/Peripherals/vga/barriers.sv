// SV Module to display 4 barriers through the VGA port so that
// our player has somewhere to hide from the SPACE INVADERS!
//
// Created by Alexander Maso PSU ECE-Winter 2023
///////////////////////////////////////////////////////////////

module barriers(
    input  wire                clk, rst,
    input  wire    [11:0]      pixel_row, pixel_column, 
	output wire    [3:0]	   barrier_output,
    output wire                barrier1_active,
    output wire                barrier2_active,
    output wire                barrier3_active,
    output wire                barrier4_active
    );

// Internals
logic   [11:0]              sprite_row;
logic   [11:0]              sprite_column;
logic   [3:0]               barrier_pix;
logic                       active1; 
logic                       active2;
logic                       active3; 
logic                       active4;

    
initial begin
    active1 = 1'b0;
    active2 = 1'b0;
    active3 = 1'b0;
    active4 = 1'b0;
    barrier_pix = 4'b0000;
    // Initializing barriers 30 rows above the player sprite
    // and close to centered as possible. Columns: 251 <-> 390
    sprite_column = 250;
    sprite_row = 430;
end

always_comb begin
    // Barrier Sprite's are 16 rows by 20 columns of pixels 
    // There are 20 pixels between each barrier sprite --> Offsets are multiples of 40 
    // First sprite --> Offset of 0
    active1 = ((sprite_row < pixel_row) && (pixel_row < sprite_row + 17) && (sprite_column < pixel_column) && (pixel_column < sprite_column + 21));
    // Second sprite --> Offset of 40 
     active2 = ((sprite_row < pixel_row) && (pixel_row < sprite_row + 17) && (sprite_column + 40 < pixel_column) && (pixel_column < sprite_column + 61));    
    // Third sprite --> Offset of 80 
     active3 = ((sprite_row < pixel_row) && (pixel_row < sprite_row + 17) && (sprite_column + 80 < pixel_column) && (pixel_column < sprite_column + 101));
    // Fourth sprite --> Offset of 80
     active4 = ((sprite_row < pixel_row) && (pixel_row < sprite_row + 17) && (sprite_column + 120 < pixel_column) && (pixel_column < sprite_column + 141));
   
   
    // Row one of Barrier1's Sprite    
    if ((pixel_row == sprite_row  + 1) && (sprite_column + 2 < pixel_column) && (pixel_column < sprite_column + 19))
        begin
            barrier_pix = 4'b1111;
        end   
    // Row 2 
    else if ((sprite_row + 2 == pixel_row) && (sprite_column + 1 < pixel_column) && (pixel_column < sprite_column + 20))
        begin
            barrier_pix = 4'b1111;
        end   
    // Rows 3 - 9 
    else if ((sprite_row + 2 < pixel_row) && (pixel_row < sprite_row  + 10) && (sprite_column < pixel_column) && (pixel_column < sprite_column + 21))
        begin
            barrier_pix = 4'b1111;
        end
    // Row 10
    else if ((sprite_row + 10 == pixel_row) && (((sprite_column < pixel_column) && (pixel_column < sprite_column + 8)) || ((sprite_column + 13 < pixel_column) && (pixel_column < sprite_column + 21))))
        begin
            barrier_pix = 4'b1111;
        end
    // Row 11 
    else if ((sprite_row + 11 == pixel_row) && (((sprite_column < pixel_column) && (pixel_column < sprite_column + 7)) || ((sprite_column + 14 < pixel_column) && (pixel_column < sprite_column + 21))))
        begin
            barrier_pix = 4'b1111;
        end
    // Rows 12 & 13
    else if ((sprite_row + 11 < pixel_row) && (pixel_row < sprite_row + 14) && (((sprite_column < pixel_column) && (pixel_column < sprite_column + 6)) || ((sprite_column + 15 < pixel_column) && (pixel_column < sprite_column + 21))))
        begin
            barrier_pix = 4'b1111;
        end
    // Row 14, 15 and 16 
    else if ((sprite_row + 13 < pixel_row) && (pixel_row < sprite_row + 17) && (((sprite_column < pixel_column) && (pixel_column < sprite_column + 5)) || ((sprite_column + 16 < pixel_column) && (pixel_column < sprite_column + 21))))
        begin
            barrier_pix = 4'b1111;
        end


    // Row one of Barrier2's Sprite (Offset = 40 pix)   
    else if ((pixel_row == sprite_row  + 1) && (sprite_column + 42 < pixel_column) && (pixel_column < sprite_column + 59))
        begin
            barrier_pix = 4'b1111;
        end   
    // Row 2 
    else if ((sprite_row + 2 == pixel_row) && (sprite_column + 41 < pixel_column) && (pixel_column < sprite_column + 60))
        begin
            barrier_pix = 4'b1111;
        end   
    // Rows 3 - 9 
    else if ((sprite_row + 2 < pixel_row) && (pixel_row < sprite_row  + 10) && (sprite_column + 40 < pixel_column) && (pixel_column < sprite_column + 61))
        begin
            barrier_pix = 4'b1111;
        end
    // Row 10
    else if ((sprite_row + 10 == pixel_row) && (((sprite_column + 40 < pixel_column) && (pixel_column < sprite_column + 48)) || ((sprite_column + 53 < pixel_column) && (pixel_column < sprite_column + 61))))
        begin
            barrier_pix = 4'b1111;
        end
    // Row 11 
    else if ((sprite_row + 11 == pixel_row) && (((sprite_column + 40 < pixel_column) && (pixel_column < sprite_column + 47)) || ((sprite_column + 54 < pixel_column) && (pixel_column < sprite_column + 61))))
        begin
            barrier_pix = 4'b1111;
        end
    // Rows 12 & 13
    else if ((sprite_row + 11 < pixel_row) && (pixel_row < sprite_row + 14) && (((sprite_column + 40 < pixel_column) && (pixel_column < sprite_column + 46)) || ((sprite_column + 55 < pixel_column) && (pixel_column < sprite_column + 61))))
        begin
            barrier_pix = 4'b1111;
        end
    // Row 14, 15 and 16 
    else if ((sprite_row + 13 < pixel_row) && (pixel_row < sprite_row + 17) && (((sprite_column + 40 < pixel_column) && (pixel_column < sprite_column + 45)) || ((sprite_column + 56 < pixel_column) && (pixel_column < sprite_column + 61))))
        begin
            barrier_pix = 4'b1111;
        end


    // Row one of Barrier3's Sprite (Offset = 80 pix)   
    else if ((pixel_row == sprite_row  + 1) && (sprite_column + 82 < pixel_column) && (pixel_column < sprite_column + 99))
        begin
            barrier_pix = 4'b1111;
        end   
    // Row 2 
    else if ((sprite_row + 2 == pixel_row) && (sprite_column + 81 < pixel_column) && (pixel_column < sprite_column + 100))
        begin
            barrier_pix = 4'b1111;
        end   
    // Rows 3 - 9 
    else if ((sprite_row + 2 < pixel_row) && (pixel_row < sprite_row  + 10) && (sprite_column + 80 < pixel_column) && (pixel_column < sprite_column + 101))
        begin
            barrier_pix = 4'b1111;
        end
    // Row 10
    else if ((sprite_row + 10 == pixel_row) && (((sprite_column + 80 < pixel_column) && (pixel_column < sprite_column + 88)) || ((sprite_column + 93 < pixel_column) && (pixel_column < sprite_column + 101))))
        begin
            barrier_pix = 4'b1111;
        end
    // Row 11 
    else if ((sprite_row + 11 == pixel_row) && (((sprite_column + 80 < pixel_column) && (pixel_column < sprite_column + 87)) || ((sprite_column + 94 < pixel_column) && (pixel_column < sprite_column + 101))))
        begin
            barrier_pix = 4'b1111;
        end
    // Rows 12 & 13
    else if ((sprite_row + 11 < pixel_row) && (pixel_row < sprite_row + 14) && (((sprite_column + 80 < pixel_column) && (pixel_column < sprite_column + 86)) || ((sprite_column + 95 < pixel_column) && (pixel_column < sprite_column + 101))))
        begin
            barrier_pix = 4'b1111;
        end
    // Row 14, 15 and 16 
    else if ((sprite_row + 13 < pixel_row) && (pixel_row < sprite_row + 17) && (((sprite_column + 80 < pixel_column) && (pixel_column < sprite_column + 85)) || ((sprite_column + 96 < pixel_column) && (pixel_column < sprite_column + 101))))
        begin
            barrier_pix = 4'b1111;
        end


    // Row one of Barrier4's Sprite (Offset = 120 pix)   
    else if ((pixel_row == sprite_row  + 1) && (sprite_column + 122 < pixel_column) && (pixel_column < sprite_column + 139))
        begin
            barrier_pix = 4'b1111;
        end   
    // Row 2 
    else if ((sprite_row + 2 == pixel_row) && (sprite_column + 121 < pixel_column) && (pixel_column < sprite_column + 140))
        begin
            barrier_pix = 4'b1111;
        end   
    // Rows 3 - 9 
    else if ((sprite_row + 2 < pixel_row) && (pixel_row < sprite_row  + 10) && (sprite_column + 120 < pixel_column) && (pixel_column < sprite_column + 141))
        begin
            barrier_pix = 4'b1111;
        end
    // Row 10
    else if ((sprite_row + 10 == pixel_row) && (((sprite_column + 120 < pixel_column) && (pixel_column < sprite_column + 128)) || ((sprite_column + 133 < pixel_column) && (pixel_column < sprite_column + 141))))
        begin
            barrier_pix = 4'b1111;
        end
    // Row 11 
    else if ((sprite_row + 11 == pixel_row) && (((sprite_column + 120 < pixel_column) && (pixel_column < sprite_column + 127)) || ((sprite_column + 134 < pixel_column) && (pixel_column < sprite_column + 141))))
        begin
            barrier_pix = 4'b1111;
        end
    // Rows 12 & 13
    else if ((sprite_row + 11 < pixel_row) && (pixel_row < sprite_row + 14) && (((sprite_column + 120 < pixel_column) && (pixel_column < sprite_column + 126)) || ((sprite_column + 135 < pixel_column) && (pixel_column < sprite_column + 141))))
        begin
            barrier_pix = 4'b1111;
        end
    // Row 14, 15 and 16 
    else if ((sprite_row + 13 < pixel_row) && (pixel_row < sprite_row + 17) && (((sprite_column + 120 < pixel_column) && (pixel_column < sprite_column + 125)) || ((sprite_column + 136 < pixel_column) && (pixel_column < sprite_column + 141))))
        begin
            barrier_pix = 4'b1111;
        end
    else
        begin
            barrier_pix = 4'b0000;
        end
end



assign barrier_output = barrier_pix;
assign barrier1_active = active1; 
assign barrier2_active = active2; 
assign barrier3_active = active3; 
assign barrier4_active = active4; 


endmodule
