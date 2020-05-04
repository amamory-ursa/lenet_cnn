# generate executable for the host machine
all : float
 

float :
	gcc -Wall -g main.c neural_network.c -o main -lm
short : 
	gcc -Wall -g main.c neural_network.c -o main_short -lm -D_SHORT_WEIGHT_
char : 
	gcc -Wall -g main.c neural_network.c -o main_char -lm -D_CHAR_WEIGHT_
conv : 
	gcc -Wall -g main.c -o main_conv -lm -D_CONV_WEIGHTS_
	./main_conv
	rm main_conv
	
.PHONY: clean

clean : 
	rm main short_weight.h char_weight.h *.a  *.o image.*
	rm -rf logs
