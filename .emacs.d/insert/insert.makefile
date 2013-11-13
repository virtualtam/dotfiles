# Author: VirtualTam	<virtualtam@myopera.com>
# Makefile for 
CC      = gcc
CFLAGS  = -W -Wall -Wextra -ansi -pedantic
DEBUG   = -g -pg -DNDEBUG

.PHONY  = all clean distclean archive

BIN     = ./bin
OBJ	= ./obj
INC	= ./include
LIB	= ./lib
SRC     = ./src

all : clean

clean :
	rm -rf $(OBJ)/* $(INC)/*~ $(INC)/*# $(SRC)/*~ $(SRC)/*#
distclean : clean
	rm -f $(BIN)/*
archive : distclean
	cd .. ; tar cvfz PROJECT.tgz PROJECT/

# Compilation
