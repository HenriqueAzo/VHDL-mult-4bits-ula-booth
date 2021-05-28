library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity tb is end;

architecture testbench of tb is
	--declara-se primeiro as entradas e saidas do dispositivo testado;
	
	component main
		port(
	A: 		in std_logic_vector(3 downto 0) ;
	B: 		in std_logic_vector(3 downto 0) ;
	Start: 	in std_logic ;
	Reset: 	in std_logic;
	Output: 	out std_logic_vector(7 downto 0)
		);
		
		end component main;
		
	--aqui ainda tem-se que instanciar os sinais ou variaveis a serem usados no teste
	signal aa: 		std_logic_vector (3 downto 0);
	signal bb:		std_logic_vector (3 downto 0);
	signal stt: 	std_logic;
	signal rst: 	std_logic;
	signal outp: 	std_logic_vector (7 downto 0);
    signal palavra: std_logic_vector (7 downto 0);
	
begin

--aqui, poderia se gerar um clock com a atribuiçao de valor do sinal a ele mesmo, so que negado.
--
--agora, se indicam para que sinais vao as entradas e saidas do dispositivo (na ordem entrada/saida => sinal)

	dut: main port map(A 			=> aa,
							B 			=> bb,
							Start 	=> stt,
							Reset 	=> rst,
							output	=> outp
							);
                            
--agora, se injetam os sinais para se começarem os testes na simulação
	inc: process is
    begin
    
    	wait for 100 ns;
        aa  <= "0001";
        bb  <= "0001";
        
		wait for 10 ns;
          
        palavra(0) <= aa(0);
		palavra(1) <= aa(1);
		palavra(2) <= aa(2);
		palavra(3) <= aa(3);
		palavra(4) <= bb(0);
		palavra(5) <= bb(1);
		palavra(6) <= bb(2);
		palavra(7) <= bb(3);  
        
        wait for 10 ns;
        
        report "palavra total: " & integer'image(to_integer(unsigned(palavra)));
        
        wait for 20 ns;
        
    end process;
    
							
end testbench;