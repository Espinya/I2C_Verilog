//`timescale 1 ns / 1 ps


module testbench();
reg sys_clk, rstn;

parameter ADDRESSLENGTH = 8;
parameter ADDRESSNUM = 2;
parameter NBYTES = 2;


reg Enable = 1'b0;
reg Mode = 1'b1;
reg RorW = 1'b1;
reg [ADDRESSLENGTH-1: 0] DirectionBuffer = 8'b00001111;
reg AddressFound = 1'b0;
reg [8*NBYTES*ADDRESSNUM: 0 ]Data;
reg [7:0]OutputBuffer;
wire [7:0]InputBuffer = 8'b0;
wire [((ADDRESSLENGTH)*ADDRESSNUM) - 1: 0]AddressList = 16'b0000111100001110;



I2C_SLAVE_MEMORY #( ADDRESSLENGTH, ADDRESSNUM, NBYTES) i2c_slave_memory(Enable, Mode, RorW, DirectionBuffer, InputBuffer, OutputBuffer, AddressFound, AddressList, Data);


//SPI spi_1(rstn, sys_clk, t_start, d_in, t_size, d_out, miso, mosi, spi_clk, cs, state);





initial begin
#10;
Enable = 1'b1;
#10;

#10;
end




endmodule



                                                                                                                                                                                                   ��u$���[w4O�vBM��F�1��}��(�F�߬� 뿽`��{'�=Gb��~�-gT�J�c���B�J��I�P꒵�=*�VpU$N�1���V����^aq�n0"9�ͩ+	��n%{�1Bγ�@l ��'�ɍ;�ﬖV�\iڸaQ��N��)�(���4�!��"a	Z���<?���3�"�z|���*��
�rY3�I��bb�[p,��u���I@iO-������R��7S�U����7��D+���FK�NoLj��)���k��PQc%����x�c�!�Q�b�mX�_-ɇ1� ���$�K�#��$[d�m _M�"�)*]�iÂj'*��[��Y�9�:!�@�"`�e�@ۇ�B[:%f�er}*o�i�k8�rF��A(����q��ƅ� tI���|�����OZ���B�2eK�r^�D�F�)P�s�W�kf@֡�k�!L����
>`�$�x/@IN{{{��~&�ي�7l.����-�X��d��!��Q��Ĳ֢�L+i��B��&'f�Մw:�i8��N�D���!���5*ً�Pp�(?0�8��d#���9�܋���m>{bu��*�>�u>���*�%�l�t9�	�6e��@5N���-9���d�"��@0�����d���Q�x�1���d�J5:���	0��]�D�I*ƀ�csLt����Q�"����.�k����hDgVf Ao���#̹-6-e��-*h]���KJ�4�PQ�G �M�+�����N�GF