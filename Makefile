#################################################################
## This Makefile Exported by MinGW Developer Studio
## Copyright (c) 2002-2004 by Parinya Thipchart
#################################################################

PROJECT = geodesic
SOVER = 1
SRCS = src
CC = gcc
CFLAGS = -Wall -Wextra -std=c99 -O2
LDFLAGS = -lm -s
AR = ar
RM = rm -f

ifeq ($(OS),Windows_NT)
  NULL =
  PLIBSTATIC = $(PROJECT).a
  PLIBSHARED = $(PROJECT).dll
  WINDRES = windres
  RESS = $(SRCS)/geodesic.res
else
  NULL = nul
  PLIBSTATIC = lib$(PROJECT).a
  PLIBSHARED = lib$(PROJECT).so.$(SOVER)
endif
PLIBS = $(PLIBSTATIC) $(PLIBSHARED)
PTEST = geodtest

OBJS = $(SRCS)/geodesic.o

.PHONY: all clean

all: $(PLIBS) $(PTEST)

$(PLIBSTATIC): $(OBJS)
	$(AR) rcs $@ $(OBJS)

$(PLIBSHARED): $(OBJS)
	$(CC) -shared $(CFLAGS) $^ -o $@ $(LDFLAGS)

$(PTEST): $(SRCS)/$(PTEST)/$(PTEST).c $(PLIBSTATIC)
	$(CC) $(CFLAGS) -I$(SRCS) $^ -o $@ $(LDFLAGS)

$(OBJS): $(SRCS)/geodesic.c
	$(CC) -c $(CFLAGS) $< -o $@ $(LDFLAGS)

clean:
	$(RM) $(OBJS) $(PLIBS) $(PTEST)
