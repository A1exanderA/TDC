

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity serDes is
    Port ( pin_in : in  STD_LOGIC;
           pin_out : out  STD_LOGIC;
           clk100 : in  STD_LOGIC;
           clk100_90 : in  STD_LOGIC;
           ISER_BITS : out STD_LOGIC_VECTOR (3 downto 0));
end serDes;

architecture RTL of serDes is

signal clk100B, clk100B_90: STD_LOGIC;

begin

clk100B<=not clk100; 
clk100B_90<=not clk100_90;

ISERDES_1 : ISERDESE2
   generic map (
      DATA_RATE => "DDR",           -- DDR, SDR
      DATA_WIDTH => 4,              -- Parallel data width (2-8,10,14)
      DYN_CLKDIV_INV_EN => "FALSE", -- Enable DYNCLKDIVINVSEL inversion (FALSE, TRUE)
      DYN_CLK_INV_EN => "FALSE",    -- Enable DYNCLKINVSEL inversion (FALSE, TRUE)
      -- INIT_Q1 - INIT_Q4: Initial value on the Q outputs (0/1)
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      INIT_Q3 => '0',
      INIT_Q4 => '0',
      INTERFACE_TYPE => "OVERSAMPLE",   -- MEMORY, MEMORY_DDR3, MEMORY_QDR, NETWORKING, OVERSAMPLE
      IOBDELAY => "NONE",           -- NONE, BOTH, IBUF, IFD
      NUM_CE => 1,                  -- Number of clock enables (1,2)
      OFB_USED => "FALSE",          -- Select OFB path (FALSE, TRUE)
      SERDES_MODE => "MASTER",      -- MASTER, SLAVE
      -- SRVAL_Q1 - SRVAL_Q4: Q output values when SR is used (0/1)
      SRVAL_Q1 => '0',
      SRVAL_Q2 => '0',
      SRVAL_Q3 => '0',
      SRVAL_Q4 => '0'  )
   port map ( 
        O => pin_out, 
        Q1 => ISER_BITS(0), 
        Q2 => ISER_BITS(1), 
        Q3 => ISER_BITS(2),
        Q4 => ISER_BITS(3),
        Q5 => open, 
        Q6 => open, 
        Q7 => open, 
        Q8 => open, 
        SHIFTOUT1 => open, 
        SHIFTOUT2 => open, 
        BITSLIP => '0',
        CE1 => '1', 
        CE2 => '1', 
        CLKDIVP => '0',
		CLK => clk100, 
		CLKB => CLK100B,
        CLKDIV => '0',
        OCLK => CLK100_90, 
        OCLKB => CLK100B_90, 
        DYNCLKDIVSEL => '0',  
        DYNCLKSEL => '0',
        D => pin_in,
        DDLY => '0',  
        OFB => '0',             
        RST => '0', 
        SHIFTIN1 => '0',  
        SHIFTIN2 => '0');

end RTL;


