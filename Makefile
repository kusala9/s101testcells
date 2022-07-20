#
# Makefile for S-101 test datasets.
#
CAT=S-101.xml
CC=8cc
CCFLAGS=-v y -c $(CAT)
SRC=src
OBJ=data
CELLS=cells/
SRC_FILES := $(wildcard $(SRC)/*.yaml)
OBJ_FILES := $(patsubst $(SRC)/%.yaml,$(OBJ)/%.000,$(SRC_FILES))

cells: $(OBJ_FILES) $(SRC_FILES)
	cp $(OBJ_FILES) $@

$(OBJ)/%.000: $(SRC)/%.yaml
	$(CC) $(CCFLAGS) -d $(OBJ) -f $<


