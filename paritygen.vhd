-- William Fan
-- 02/14/2011
-- Parity Gen RTL

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity paritygen is
	generic (N: positive := 7);
	port (x: in bit_vector(N-1 downto 0);
		  y: out bit_vector(N downto 0));
end entity;

architecture pg of paritygen is
	signal temp: bit_vector(n-1 downto 0);
	signal nparity: bit;
	begin
		temp(0) <= x(0);
		gen: for i in 1 to n-1 generate
			temp(i) <= temp(i-1) XOR x(i);
		end generate;
		nparity <= temp(N-1) NAND temp(N-1);
		y(N-1 downto 0) <= x;
		y(N) <= nparity;
end architecture;
