#!/usr/bin/env python3


from sys import argv
from struct import pack, unpack
from time import sleep
import socket
import re

from binascii import hexlify, unhexlify
# Example usage:
# unhexlify(b'41414141') = b'AAAA'
# hexlify(b'AAAA') = b'41414141'




################### Helper methods #####################################################


def log(buf):
    try:
        print(buf.decode())
    except:
        print(bytes(buf) + b'\n')


# Return a number d packed as a 64 bit unsigned integer (little endian)
def p64(d):
    return pack('<Q', d)



# Read exactly n bytes from the socket
def receive(n):
    buf = bytearray()
    while not len(buf) >= n:
        buf += s.recv(1)
    log(buf)
    return bytes(buf)


# Read from socket until the character sequence delimiter is read
def receive_until(delimiter):
    buf = bytearray()
    while not delimiter in buf:
        buf += s.recv(1)
    log(buf)
    return bytes(buf)


# Send data
def send(data):
    log(data)
    s.sendall(data)

# Send data + newline
def sendline(data):
    send(data + b'\n')


# Extract all hexadecimal numbers from a string s
# Returns an array containing all matches
def extract_hexstr(s):
    return re.findall(r'0x[0-9A-F]+',s.decode() , re.I)

# Convert hexstring (e.g. "1ab4ff") to integer
def hexstr2int(s):
    return int(s, 16)





################### Create connection to target ########################################


if len(argv) < 3:
    print("Usage:\npython3 filename.py <host> <port>")
    exit()

host = argv[1]
port = int(argv[2])

s = socket.create_connection((host, port))




################### Put your exploit code here #########################################

receive_until(b'> ')
