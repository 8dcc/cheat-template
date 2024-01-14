
CC=gcc
CFLAGS=-Wall -Wextra -m32 -fPIC
LDFLAGS=

MAIN_OBJS=main.c.o
OBJS=$(addprefix obj/, $(MAIN_OBJS))

BIN=libPROJECT-NAME.so

.PHONY: clean all inject

# -------------------------------------------

all: $(BIN)

clean:
	rm -f $(OBJS)
	rm -f $(BIN)

inject: $(BIN)
	bash ./inject.sh

# -------------------------------------------

$(BIN): $(OBJS)
	$(CC) $(CFLAGS) -shared -o $@ $(OBJS) $(LDFLAGS)

$(OBJS): obj/%.c.o : src/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c -o $@ $<
