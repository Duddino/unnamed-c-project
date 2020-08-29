.PHONY := all clean main

CC := gcc

LINKERFLAG := -lm

MAIN := src/main.c
SRC := $(shell find src/ -type f -name '*.c')
OBJECTS := $(SRC:%.c=%.o)
BINS := main

all: ${OBJECTS} ${BINS}

main: ${OBJECTS} 
	${CC} ${LINKERFLAG} $(OBJECTS) -o $@

$(OBJECTS): %.o : %.c
	$(CC) -c $< -o $(<:%.c=%.o)

clean:
	find src/ -type f -name '*.o' -exec rm -f {} +
	rm -f $(BINS)
