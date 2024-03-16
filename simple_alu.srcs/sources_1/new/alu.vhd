----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.03.2024 23:25:50
-- Design Name: 
-- Module Name: alu - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           btnU: in STD_LOGIC; 
           btnL: in STD_LOGIC; 
           btnR: in STD_LOGIC; 
           btnD: in STD_LOGIC; 
           led : out STD_LOGIC_VECTOR (7 downto 0));
end alu;

architecture Behavioral of alu is

begin
    led <= std_logic_vector(unsigned(a) + unsigned(b)) when btnU = '1' else 
           std_logic_vector(unsigned(a) and unsigned(b)) when btnL = '1' else
           std_logic_vector(unsigned(a) or unsigned(b)) when btnR = '1' else
           std_logic_vector(unsigned(a) xor unsigned(b)) when btnD = '1' else
           (others => 'L');
end Behavioral;
