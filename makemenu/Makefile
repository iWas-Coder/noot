APP = makemenu
DESC = a TUI menu system to make shell scripts prettier

PPO_MKDIR = MKDIR
PPO_CLEAN = CLEAN
PPO_CC = CC
PPO_LD = LD

SRC_DIR = src
HDR_DIR = include
BUILD_DIR = build

SRCS := $(wildcard $(SRC_DIR)/*.c)
OBJS := $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SRCS))

CC = gcc
CPPFLAGS = -I $(HDR_DIR)
CFLAGS = -Wall -Wextra -pedantic -std=gnu2x -O3
LDFLAGS = -lslang -lpopt

.PHONY: all clean mrproper


all: $(APP)

$(APP): $(OBJS)
	@printf "  $(PPO_LD)\t$@\n"
	@$(CC) $^ $(LDFLAGS) -o $@

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@if [ ! -d $(BUILD_DIR) ]; then            \
		printf "  $(PPO_MKDIR)\t$(BUILD_DIR)\n"; \
		mkdir $(BUILD_DIR);                      \
	fi
	@printf "  $(PPO_CC)\t$@\n"
	@$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@


clean:
	@if [ -d $(BUILD_DIR) ]; then              \
		printf "  $(PPO_CLEAN)\t$(BUILD_DIR)\n"; \
		rm -r $(BUILD_DIR);                      \
	fi

mrproper: clean
	@if [ -e $(APP) ]; then              \
		printf "  $(PPO_CLEAN)\t$(APP)\n"; \
		rm $(APP);                         \
	fi
