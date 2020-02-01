library IEEE;
use IEEE.std_logic_1164.all;

package aes_pkg is
	-- A column of 4 bytes
	type blockcol is array(3 downto 0) of std_logic_vector(7 downto 0);
	constant zero_col: blockcol := (X"00", X"00", X"00", X"00");
	-- A datablock of 16 bytes
	type datablock is array(3 downto 0, 3 downto 0) of std_logic_vector(7 downto 0);
	type datablocks is array(1 downto 0, 1 downto 0) of datablock;
	type datablocky is array(1 downto 0) of datablock;
	constant zero_data: datablock := ((X"00", X"00", X"00", X"00"),(X"00", X"00", X"00", X"00"), (X"00", X"00", X"00", X"00"), (X"00", X"00", X"00", X"00"));
	-- Vector of columns
	type colnet is array(natural range<>) of blockcol;
	-- Vector of blocks
	type datanet is array(natural range<>) of datablock;
	-- the 10 rcon bytes
	type rconarr is array(9 downto 0) of std_logic_vector(7 downto 0);
	constant rcon: rconarr := (X"36", X"1b", X"80", X"40", X"20", X"10", X"08", X"04", X"02", X"01");
end package aes_pkg;
