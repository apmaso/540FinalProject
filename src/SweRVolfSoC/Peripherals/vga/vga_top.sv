module vga_top(
    input wire            vga_clk_i,
    input wire            vga_rst_i,
    output wire   [3:0]   vga_r,
	output wire   [3:0]   vga_g,
	output wire   [3:0]   vga_b,
	output wire		      vga_hs,
	output wire			  vga_vs,
	input  wire   [11:0]  btn_row,
	input  wire   [11:0]  btn_col
    );
    

    
// Internals for VGA and ROM/RAM image
reg  [3:0]      vga_r_reg;
reg  [3:0]      vga_g_reg; 
reg  [3:0]      vga_b_reg;
wire [31:0]     pix_num;
wire [3:0]      doutb;
logic           video_on;
logic [3:0]     vga_output;

// Internals for Sprite
logic [11:0]        pixel_row;
logic [11:0]        pixel_column;
logic [11:0]        sprite_row;
logic [11:0]        sprite_row_ff;
logic [11:0]        sprite_column;
logic [11:0]        sprite_column_ff;



initial begin
video_on = 0;
vga_output = 0;
sprite_row_ff = 460;
sprite_column_ff = 312;
sprite_row = 460;
sprite_column = 312;
end

dtg dtg(
	.clock    	   (vga_clk_i),
	.rst	  	   (vga_rst_i),
	.video_on 	   (video_on),
	.horiz_sync	   (vga_hs),
	.vert_sync	   (vga_vs),
	.pixel_row     (pixel_row),
	.pixel_column  (pixel_column),
	.pix_num	   (pix_num)
);
	
image_ram img_ram(
  .clka            (vga_clk_i),     // input wire clka
  .wea             (1'b0),          // input wire [0 : 0] wea
  .addra           (1'b0),          // input wire [18 : 0] addra
  .dina            (1'b0),          // input wire [3 : 0] dina
  .clkb            (vga_clk_i),     // input wire clkb
  .addrb           (pix_num),       // input wire [18 : 0] addrb
  .doutb           (doutb)          // output wire [3 : 0] doutb
);


always_comb begin
    // Sprite is centered in the upper left corner | Row x Col / (0,0)  <--> (0,3)
    // Sprite orientation mimics pix row and col   |   (y,x)   / (3,0) <--> (3,3)
      // Enable output of the player's sprite when in the proper region
    // Player's Sprite is 10 rows by 15 columns of pixels
    // *** Still unsure on the implementation of this active signal....
    // ...Do I want to just use two assignments with a ternary operator instead?
    // 
    // assign active =  ((sprite_row < pixel_row) && (pixel_row < sprite_row + 11)...
    // ... && (sprite_column < pixel_column) && (pixel_column < sprite_column + 16))
    // 
    // assign player_active = active ? 1'b1 : 1'b0;         
    if ((sprite_row < pixel_row) && (pixel_row < sprite_row  + 3) && (pixel_column == sprite_column + 8))
        begin
            vga_output = 4'b1111;
        end    
    // Row three of the player's sprite
    else if ((sprite_row + 3 == pixel_row) && (sprite_column + 2 < pixel_column) && (pixel_column < sprite_column + 14))
        begin
            vga_output = 4'b1111;
        end
    // Row four of the player's sprite
    else if ((sprite_row + 4 == pixel_row) && (sprite_column + 1 < pixel_column) && (pixel_column < sprite_column + 15))
        begin
            vga_output = 4'b1111;
        end
    // Row five through 10 of the player's sprite
    else if (((sprite_row + 4 < pixel_row) && (pixel_row < sprite_row  + 11)) && (sprite_column < pixel_column) && (pixel_column < sprite_column + 16))
        begin
            vga_output = 4'b1111;
        end
    else
        begin
            vga_output = doutb;
        end
end

// We kept pix_num as wires, no register to hold value.... try the other way if it doesnt work
always_ff @ (posedge vga_clk_i)
begin
    if (video_on)
        begin
        vga_r_reg <= vga_output;
        vga_g_reg <= vga_output;
        vga_b_reg <= vga_output;
        end
    else   
        begin 
        vga_r_reg <= 4'b0000;
        vga_g_reg <= 4'b0000;
        vga_b_reg <= 4'b0000;
        end        
end        


// Extra FF to latch the data coming from Button Module.
// Timing differences between button module and and vga module

// *** I removed the reset here. Hoping to fix: Sprite initializing at (0,0) not (460, 312)... ***

always_ff @ (posedge vga_clk_i) /*posedge vga_rst_i*/
begin
/*    if (vga_rst_i) 
        begin
        sprite_row_ff <= 0;
        sprite_column_ff <= 0;
        end
    else
        begin   */
        sprite_row_ff <= btn_row;
        sprite_column_ff <= btn_col;
       // end        
end

assign vga_r = vga_r_reg;
assign vga_g = vga_g_reg;
assign vga_b = vga_b_reg;

assign sprite_row = sprite_row_ff;
assign sprite_column = sprite_column_ff;

endmodule
