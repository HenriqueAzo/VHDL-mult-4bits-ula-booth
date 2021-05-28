library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity main is port(
A: in std_logic_vector(3 downto 0) ;
B: in std_logic_vector(3 downto 0) ;
Start: in std_logic ;
Reset: in std_logic;
Output: out std_logic_vector(7 downto 0)
);
end main;

architecture funcionamento of main is

--palavra sobre a qual se farao operacoes
signal palavra: std_logic_vector(7 downto 0);

--bit extra para o algoritmo de booth
signal q1: std_logic;

--sinais que representam os vetores
signal aa: std_logic_vector(3 downto 0);
signal bb: std_logic_vector(3 downto 0);

--start e reset
signal stt: std_logic;
signal rst: std_logic;

--clock
signal clk: std_logic;

--declaracao do periodo de clock
constant PERIODO : time := 10 ns;



--sinal entra
--é armazenado
--se julga o que tem que ser feito
--se faz, conta-se uma iteraçao
--repete o processo
--apos 4 iteracoes o output eh dado
begin
process(A, B, Start, Reset, Output)


--variavel para contar iteracoes
variable ite: integer :=0;
variable final: integer range 0 to 7;



begin

--produzindo o sinal de clock
Clk <= not Clk after PERIODO/2;


aa <= A;
bb <= B;


palavra(0) <= aa(0);
palavra(1) <= aa(1);
palavra(2) <= aa(2);
palavra(3) <= aa(3);
palavra(4) <= bb(0);
palavra(5) <= bb(1);
palavra(6) <= bb(2);
palavra(7) <= bb(3);

report "palavra total: " & integer'image(to_integer(unsigned(palavra)));




end process;
end funcionamento;
