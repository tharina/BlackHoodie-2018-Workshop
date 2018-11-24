CC=gcc
CFLAGS=-Wall -O1

.PHONY: default
default:
	$(error No target specified.)



.PHONY: chall0
chall0: chall0/server

chall0/server: server.c chall0/chall0.so
	$(CC) -no-pie -DPORT=12345 -DLIB=\"./chall0.so\" -o ./chall0/server server.c $(CFLAGS) -ldl
	cp server.c chall0/server.c
	
chall0/chall0.so: chall0.c
	$(CC) -o ./chall0/chall0.so -shared -fPIC chall0.c $(CFLAGS)




.PHONY: chall1
chall1: chall1/server

chall1/server: server.c chall1/chall1.so
	$(CC) -no-pie -fno-stack-protector -z execstack -D_FORTIFY_SOURCE=0 -DPORT=22222 -DLIB=\"./chall1.so\" -o ./chall1/server server.c $(CFLAGS) -ldl
	cp server.c chall1/server.c

chall1/chall1.so: chall1.c
		$(CC) -fno-stack-protector -z execstack -D_FORTIFY_SOURCE=0 -o ./chall1/chall1.so -shared -fPIC chall1.c $(CFLAGS)




.PHONY: chall1c
chall1c: chall1c/server

chall1c/server: server.c chall1c/chall1c.so
	$(CC) -no-pie -fno-stack-protector -z execstack -D_FORTIFY_SOURCE=0 -DPORT=22223 -DLIB=\"./chall1c.so\" -o ./chall1c/server server.c $(CFLAGS) -ldl
	cp server.c chall1c/server.c

chall1c/chall1c.so: chall1c.c
		$(CC) -fno-stack-protector -z execstack -D_FORTIFY_SOURCE=0 -o ./chall1c/chall1c.so -shared -fPIC chall1c.c $(CFLAGS)




.PHONY: chall1d
chall1d: chall1d/server

chall1d/server: server.c chall1d/chall1d.so
	$(CC) -no-pie -fno-stack-protector -D_FORTIFY_SOURCE=0 -DPORT=22224 -DLIB=\"./chall1d.so\" -o ./chall1d/server server.c $(CFLAGS) -ldl
	cp server.c chall1d/server.c

chall1d/chall1d.so: chall1d.c
		$(CC) -fno-stack-protector -D_FORTIFY_SOURCE=0 -o ./chall1d/chall1d.so -shared -fPIC chall1d.c $(CFLAGS)
