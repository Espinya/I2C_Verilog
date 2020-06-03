/*
	Autor: Albert Espi�a Rojas
	Modulo: I2C_SLAVE_MEMORY
	Modulo de memoria. Podemos acceder y guardar datos. 
	El modulo tiene como parametro, el tama�o de la direcci�n de memoria, el n�mero de direcci�nes ,es decir el n�mero de datos
	y el n�mero de bytes en los datos

*/

module I2C_SLAVE_ADDRESS_MATCH #( parameter ADDRESSLENGTH, parameter LENGTH, parameter ADDRESSNUM, parameter NBYTES)(Clk, Rst, RoW, Enable, AddressWant, AddressList, Data, Buffer);
	input Clk;
 	input Rst; 
	input Enable; 
	input Mode;
	input [LENGTH - 1: 0]InputAddress;

	integer LocalAddressID;
	output reg [LENGTH - 1: 0]AddressFound;
	reg [(LENGTH - 1)*MaxAddress: 0]AddressList;

	input [LENGTH - 1: 0]AddressWant;//Direcci�n de memoria que est� solicitando el master


always @(AddressWant) begin //Cada vez que cambia la direcci�n de mem�ria, comprovamos si est� disponible
	
end

always @(posedge Enable)//Si se activa el enable, es cuando transferimos los datos del buffer a la memoria
begin
	if (Mode) begin //Modo transferencia, intercambiamos datos entre el buffer y los datos de la memoria
		if (RorW) Buffer <= Data[ByteCounter*(8 + 1):ByteCounter*8];//modo escritura, cargamos datos en el buffer
		else Data[LocalAddressID*8*NBYTES + ByteCounter*(8 + 1):LocalAddressID*8*NBYTES*ByteCounter*8] <= Buffer;
		if (ByteCounter < NBYTES - 1) ByteCounter = ByteCounter + 1;
	end
	else begin //El enable tambi�n puede ser para ver si se dispone de una direcci�n de memoria
		AddressFound = 1'b0;
		for(LocalAddressID = 0; (LocalAddressID < ADDRESSNUM) ||  !AddressFound; i++) begin
			if (AddressList[ADDRESSLENGTH*(LocalAddressID+1):ADDRESSLENGTH*(LocalAddressID) == AddressWant) AddressFound = 1'b1;
		end
	end
end

endmodule