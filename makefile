.DEFAULT_GOAL := all
.PHONY: all clean install uninstall sstv-enc rebuild

RM      ?= rm
INSTALL ?= install
CC      ?= gcc
CFLAGS  ?= -O2 -Wall -Wextra
LDFLAGS ?= -lm
PREFIX  ?= /usr/local

SRC = SSTV_Modulator.c WAV_Encapsulation.c
BIN = sstv-enc

all: $(BIN)
rebuild: clean all

clean:
	@echo "Cleaning $(BIN) build..."
	$(RM) -f $(BIN)

$(BIN):
	@echo "Making $(BIN)..."
	@echo "Compiling with: $(CC)"
	$(CC) $(CFLAGS) $(SRC) -o $(BIN) $(LDFLAGS)

install: $(BIN)
	@echo "Installing $(BIN)..."
	$(INSTALL) -d $(DESTDIR)/$(PREFIX)/bin
	$(INSTALL) -Dm755 $(BIN) $(DESTDIR)/$(PREFIX)/bin/$(BIN)
	@echo "Install done."

uninstall:
	@echo "Uninstalling $(BIN)..."
	$(RM) -f $(DESTDIR)/$(PREFIX)/bin/$(BIN)

