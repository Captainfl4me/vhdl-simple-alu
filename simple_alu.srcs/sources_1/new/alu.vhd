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
           btnU: in STD_LOGIC; -- Sum
           btnL: in STD_LOGIC; -- And 
           btnR: in STD_LOGIC; -- Or 
           btnD: in STD_LOGIC; -- Xor 
           btnC: in STD_LOGIC; -- Shift 
           led : out STD_LOGIC_VECTOR (7 downto 0);
           acr: out STD_LOGIC; -- Carry flag
           hc: out STD_LOGIC; -- Half-Carry flag
           avr: out STD_LOGIC); -- Overflow flag
end alu;

architecture Behavioral of alu is
    signal half_sum_low: STD_LOGIC_VECTOR (4 downto 0) := (others => '0');
    signal half_sum_high: STD_LOGIC_VECTOR (4 downto 0) := (others => '0');
begin
    -- Extend a from 4 to 5 bits to match half_sum_low size
    half_sum_low <= std_logic_vector('0'&unsigned(a(3 downto 0)) + unsigned(b(3 downto 0)));
    half_sum_high <= std_logic_vector('0'&unsigned(a(7 downto 4)) + unsigned(b(7 downto 4)) + unsigned'('0' & half_sum_low(4)));
    
    led <= (half_sum_high(3 downto 0) & half_sum_low(3 downto 0)) when btnU = '1' else 
           std_logic_vector(a and b) when btnL = '1' else
           std_logic_vector(a or b) when btnR = '1' else
           std_logic_vector(a xor b) when btnD = '1' else
           '0'&b(7 downto 1) when btnC = '1' else
           (others => 'L');
    
    hc <= half_sum_low(4) when btnU = '1' else '0';
    avr <= (a(7) and b(7) and not half_sum_high(3)) or (not a(7) and not b(7) and half_sum_high(3)) when btnU = '1' else '0';
    acr <= half_sum_high(4) when btnU = '1' else
           b(0) when btnC = '1' else '0';
end Behavioral;
