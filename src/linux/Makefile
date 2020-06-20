SRCS = ../src/bit.c
TARGET_LIB = plugin.bit.so

CC = gcc
CFLAGS = -fPIC -Wall -Wextra -O2 -g0 -I"../Dependencies/CoronaEnterprise/shared/include"
LDFLAGS = -shared
RM = rm -f 

OBJS = $(SRCS:.c=.o)

.PHONY: all
all: ${TARGET_LIB}

$(TARGET_LIB): $(OBJS)
	$(CC) ${LDFLAGS} -o $@ $^

$(SRCS:.c=.d):%.d:%.c
	$(CC) $(CFLAGS) -MM $< >$@

include $(SRCS:.c=.d)

.PHONY: clean
clean:
	-${RM} ${TARGET_LIB} ${OBJS} $(SRCS:.c=.d)
