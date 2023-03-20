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
    // and close to centered as possible. Columns: 181 <-> 460
    sprite_column = 181;
    sprite_row = 400;
end

always_comb begin
    // Barrier Sprite's are 32 rows by 40 columns of pixels 
    // There are 40 pixels between each barrier sprite --> Offsets are multiples of 40 
    // First sprite --> Offset of 0
    active1 = ((sprite_row < pixel_row) && (pixel_row < sprite_row + 33) && (sprite_column < pixel_column) && (pixel_column < sprite_column + 41));
    // Second sprite --> Offset of 80 
    active2 = ((sprite_row < pixel_row) && (pixel_row < sprite_row + 33) && (sprite_column + 80 < pixel_column) && (pixel_column < sprite_column + 121));    
    // Third sprite --> Offset of 160 
    active3 = ((sprite_row < pixel_row) && (pixel_row < sprite_row + 33) && (sprite_column + 160 < pixel_column) && (pixel_column < sprite_column + 201));
    // Fourth sprite --> Offset of 240
    active4 = ((sprite_row < pixel_row) && (pixel_row < sprite_row + 33) && (sprite_column + 240 < pixel_column) && (pixel_column < sprite_column + 281));
   
   
    // Row 1 & 2 of Barrier1's Sprite    
    if ((sprite_row < pixel_row) && (pixel_row < sprite_row + 3) && (sprite_column + 4 < pixel_column) && (pixel_column < sprite_column + 37))
        begin
            barrier_pix = 4'b1111;
        end   
    // Row 3 & 4 
    else if ((sprite_row + 2 < pixel_row) && (pixel_row < sprite_row + 5) && (sprite_column + 2 < pixel_column) && (pixel_column < sprite_column + 39))
        begin
            barrier_pix = 4'b1111;
        end   
    // Rows 5 - 18 
    else if ((sprite_row + 4 < pixel_row) && (pixel_row < sprite_row  + 19) && (sprite_column < pixel_column) && (pixel_column < sprite_column + 41))
        begin
            barrier_pix = 4'b1111;
        end
    // Row 19 & 20
    else if ((sprite_row + 18 < pixel_row) && (pixel_row < sprite_row + 21) && (((sprite_column < pixel_column) && (pixel_column < sprite_column + 15)) || ((sprite_column + 26 < pixel_column) && (pixel_column < sprite_column + 41))))
        begin
            barrier_pix = 4'b1111;
        end
    // Row 21 & 22
    else if ((sprite_row + 20 < pixel_row) && (pixel_row < sprite_row + 23) && (((sprite_column < pixel_column) && (pixel_column < sprite_column + 13)) || ((sprite_column + 28 < pixel_column) && (pixel_column < sprite_column + 41))))
        begin
            barrier_pix = 4'b1111;
        end
    // Rows 23 - 26
    else if ((sprite_row + 22 < pixel_row) && (pixel_row < sprite_row + 27) && (((sprite_column < pixel_column) && (pixel_column < sprite_column + 11)) || ((sprite_column + 30 < pixel_column) && (pixel_column < sprite_column + 41))))
        begin
            barrier_pix = 4'b1111;
        end
    // Rows 27 - 32
    else if ((sprite_row + 26 < pixel_row) && (pixel_row < sprite_row + 33) && (((sprite_column < pixel_column) && (pixel_column < sprite_column + 9)) || ((sprite_column + 32 < pixel_column) && (pixel_column < sprite_column + 41))))
        begin
            barrier_pix = 4'b1111;
        end


    // Row 1 & 2 of Barrier2's Sprite (Offset = 80 pix)   
    else if ((sprite_row < pixel_row) && (pixel_row < sprite_row + 3) && (sprite_column + 84 < pixel_column) && (pixel_column < sprite_column + 117))
        begin
            barrier_pix = 4'b1111;
        end   
    // Row 3 & 4 
    else if ((sprite_row + 2 < pixel_row) && (pixel_row < sprite_row + 5) && (sprite_column + 82 < pixel_column) && (pixel_column < sprite_column + 119))
        begin
            barrier_pix = 4'b1111;
        end   
    // Rows 5 - 18 
    else if ((sprite_row + 4 < pixel_row) && (pixel_row < sprite_row  + 19) && (sprite_column + 80 < pixel_column) && (pixel_column < sprite_column + 121))
        begin
            barrier_pix = 4'b1111;
        end
    // Row 19 & 20
    else if ((sprite_row + 18 < pixel_row) && (pixel_row < sprite_row + 21) && (((sprite_column + 80 < pixel_column) && (pixel_column < sprite_column + 95)) || ((sprite_column + 106 < pixel_column) && (pixel_column < sprite_column + 121))))
        begin
            barrier_pix = 4'b1111;
        end
    // Row 21 & 22
    else if ((sprite_row + 20 < pixel_row) && (pixel_row < sprite_row + 23) && (((sprite_column + 80 < pixel_column) && (pixel_column < sprite_column + 93)) || ((sprite_column + 108 < pixel_column) && (pixel_column < sprite_column + 121))))
        begin
            barrier_pix = 4'b1111;
        end
    // Rows 23 - 26
    else if ((sprite_row + 22 < pixel_row) && (pixel_row < sprite_row + 27) && (((sprite_column + 80 < pixel_column) && (pixel_column < sprite_column + 91)) || ((sprite_column + 110 < pixel_column) && (pixel_column < sprite_column + 121))))
        begin
            barrier_pix = 4'b1111;
        end
    // Rows 27 - 32
    else if ((sprite_row + 26 < pixel_row) && (pixel_row < sprite_row + 33) && (((sprite_column + 80 < pixel_column) && (pixel_column < sprite_column + 89)) || ((sprite_column + 112 < pixel_column) && (pixel_column < sprite_column + 121))))
        begin
            barrier_pix = 4'b1111;
        end


    // Row 1 & 2 of Barrier3's Sprite (Offset = 160 pix)   
    else if ((sprite_row < pixel_row) && (pixel_row < sprite_row + 3) && (sprite_column + 164 < pixel_column) && (pixel_column < sprite_column + 197))
        begin
            barrier_pix = 4'b1111;
        end   
    // Row 3 & 4 
    else if ((sprite_row + 2 < pixel_row) && (pixel_row < sprite_row + 5) && (sprite_column + 162 < pixel_column) && (pixel_column < sprite_column + 199))
        begin
            barrier_pix = 4'b1111;
        end   
    // Rows 5 - 18 
    else if ((sprite_row + 4 < pixel_row) && (pixel_row < sprite_row  + 19) && (sprite_column + 160 < pixel_column) && (pixel_column < sprite_column + 201))
        begin
            barrier_pix = 4'b1111;
        end
    // Row 19 & 20
    else if ((sprite_row + 18 < pixel_row) && (pixel_row < sprite_row + 21) && (((sprite_column + 160 < pixel_column) && (pixel_column < sprite_column + 175)) || ((sprite_column + 186 < pixel_column) && (pixel_column < sprite_column + 201))))
        begin
            barrier_pix = 4'b1111;
        end
    // Row 21 & 22
    else if ((sprite_row + 20 < pixel_row) && (pixel_row < sprite_row + 23) && (((sprite_column + 160 < pixel_column) && (pixel_column < sprite_column + 173)) || ((sprite_column + 188 < pixel_column) && (pixel_column < sprite_column + 201))))
        begin
            barrier_pix = 4'b1111;
        end
    // Rows 23 - 26
    else if ((sprite_row + 22 < pixel_row) && (pixel_row < sprite_row + 27) && (((sprite_column + 160 < pixel_column) && (pixel_column < sprite_column + 171)) || ((sprite_column + 190 < pixel_column) && (pixel_column < sprite_column + 201))))
        begin
            barrier_pix = 4'b1111;
        end
    // Rows 27 - 32
    else if ((sprite_row + 26 < pixel_row) && (pixel_row < sprite_row + 33) && (((sprite_column + 160 < pixel_column) && (pixel_column < sprite_column + 169)) || ((sprite_column + 192 < pixel_column) && (pixel_column < sprite_column + 201))))
        begin
            barrier_pix = 4'b1111;
        end

    
    // Row 1 & 2 of Barrier4's Sprite (Offset = 240 pix)   
    else if ((sprite_row < pixel_row) && (pixel_row < sprite_row + 3) && (sprite_column + 244 < pixel_column) && (pixel_column < sprite_column + 277))
        begin
            barrier_pix = 4'b1111;
        end   
    // Row 3 & 4 
    else if ((sprite_row + 2 < pixel_row) && (pixel_row < sprite_row + 5) && (sprite_column + 242 < pixel_column) && (pixel_column < sprite_column + 279))
        begin
            barrier_pix = 4'b1111;
        end   
    // Rows 5 - 18 
    else if ((sprite_row + 4 < pixel_row) && (pixel_row < sprite_row  + 19) && (sprite_column + 240 < pixel_column) && (pixel_column < sprite_column + 281))
        begin
            barrier_pix = 4'b1111;
        end
    // Row 19 & 20
    else if ((sprite_row + 18 < pixel_row) && (pixel_row < sprite_row + 21) && (((sprite_column + 240 < pixel_column) && (pixel_column < sprite_column + 255)) || ((sprite_column + 266 < pixel_column) && (pixel_column < sprite_column + 281))))
        begin
            barrier_pix = 4'b1111;
        end
    // Row 21 & 22
    else if ((sprite_row + 20 < pixel_row) && (pixel_row < sprite_row + 23) && (((sprite_column + 240 < pixel_column) && (pixel_column < sprite_column + 253)) || ((sprite_column + 268 < pixel_column) && (pixel_column < sprite_column + 281))))
        begin
            barrier_pix = 4'b1111;
        end
    // Rows 23 - 26
    else if ((sprite_row + 22 < pixel_row) && (pixel_row < sprite_row + 27) && (((sprite_column + 240 < pixel_column) && (pixel_column < sprite_column + 251)) || ((sprite_column + 270 < pixel_column) && (pixel_column < sprite_column + 281))))
        begin
            barrier_pix = 4'b1111;
        end
    // Rows 27 - 32
    else if ((sprite_row + 26 < pixel_row) && (pixel_row < sprite_row + 33) && (((sprite_column + 240 < pixel_column) && (pixel_column < sprite_column + 249)) || ((sprite_column + 272 < pixel_column) && (pixel_column < sprite_column + 281))))
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
