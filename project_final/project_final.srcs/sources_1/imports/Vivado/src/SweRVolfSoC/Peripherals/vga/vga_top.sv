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
    

// Internals for Alien Model A Sprites
logic               alienA1_active;
logic               alienA2_active;
logic               alienA3_active;
logic               alienA4_active;
logic               alienA5_active;
logic   [3:0]       alienA_output;
logic               player_active;
logic   [3:0]       player_output;


    
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


initial begin
video_on = 0;
vga_output = 0;
alienA1_active = 0;
alienA2_active = 0;
alienA3_active = 0;
player_active = 0;
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

alienA five(
	.clk    	       (vga_clk_i),
	.rst	  	       (vga_rst_i),
    .pixel_row         (pixel_row),
	.pixel_column      (pixel_column),
	.alienA_output     (alienA_output),
	.alienA1_active    (alienA1_active),
	.alienA2_active    (alienA2_active),
	.alienA3_active    (alienA3_active),
	.alienA4_active    (alienA4_active),
	.alienA5_active    (alienA5_active)	
);

player dfnder(
	.clk    	       (vga_clk_i),
	.rst	  	       (vga_rst_i),
    .pixel_row         (pixel_row),
	.pixel_column      (pixel_column),
	.btn_col           (btn_col),
	.player_output     (player_output),
	.player_active     (player_active)	
);		

always_comb begin
// Are we in a region that contains a Sprite???
// Check active signals and output appropriate data

    if (alienA1_active || alienA2_active || alienA3_active || alienA4_active || alienA5_active) 
        begin
            vga_output = alienA_output;
        end
    else if (player_active)
        begin
            vga_output = player_output;
        end
    else 
        begin
            vga_output = doutb;
        end
end


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

// *** Removing Player Sprite in order to test Alien2 Sprite***

/*
always_ff @ (posedge vga_clk_i, posedge vga_rst_i)
begin
   if (vga_rst_i) 
        begin
        sprite_row_ff <= 0;
        sprite_column_ff <= 0;
        end
    else
        begin   
        sprite_row_ff <= btn_row;
        sprite_column_ff <= btn_col;
        end        
end
*/
assign vga_r = vga_r_reg;
assign vga_g = vga_g_reg;
assign vga_b = vga_b_reg;

// Removed Player Sprite for now... See above
//assign sprite_row = sprite_row_ff;
//assign sprite_column = sprite_column_ff;

endmodule
