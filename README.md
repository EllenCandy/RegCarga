# RegCarga

Registrador com carga de 4 bits.
<br/>
>Um registrador em vhdl que armazena e movimenta dados.

Construção:
<br/>
FlipFLop tipo D,
Registrador com carga de 1 bit,
Registrador com carga de 4 bits.

Testes no tb:
<br/>
• Reset do circuito
<br/>
• Gravação do número 2
<br/>
• Gravação do número 12
<br/>
• Sem gravação por 1 ciclo (testar armazenamento)
<br/>
• Gravação do número 15 (testar byte)
<br/>
• Sem gravação por 1 ciclo
<br/>
• Gravação do número 0 (testar byte)
<br/>
• sem gravação por 1 ciclo
<br/>

Como testar: (gtkwave)
<br/>
--ghdl -a *.vhdl
<br/>
--ghdl -r <>tb --stop-time=ns --wave=<>.ghw
