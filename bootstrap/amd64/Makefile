PPO_CLEAN = CLEAN
PPO_SEED = SEED
PPO_HEX0 = HEX0
PPO_HEX1 = HEX1
PPO_HEX2 = HEX2

BIN_DIR = bin
SRC_DIR = src

SEED_NAME = hex0-seed
SEED = $(BIN_DIR)/$(SEED_NAME)

hex0 = $(BIN_DIR)/hex0
hex0_src = $(SRC_DIR)/hex0/hex0.hex0

hex1 = $(BIN_DIR)/hex1
hex1_src = $(SRC_DIR)/hex1/hex1.hex0

catm = $(BIN_DIR)/catm
catm_src = $(SRC_DIR)/catm/catm.hex0

hex2 = $(BIN_DIR)/hex2
hex2_src = $(SRC_DIR)/hex2/hex2.hex1

BUILD_T = $(hex0) $(hex1) $(catm) $(hex2)


.PHONY: all clean


all: $(SEED) $(BUILD_T)

$(hex0): $(hex0_src)
	@printf "  $(PPO_SEED)\t$@\n"
	@$(SEED) $^ $@

$(hex1): $(hex1_src)
	@printf "  $(PPO_HEX0)\t$@\n"
	@$(hex0) $^ $@

$(catm): $(catm_src)
	@printf "  $(PPO_HEX0)\t$@\n"
	@$(hex0) $^ $@

$(hex2): $(hex2_src)
	@printf "  $(PPO_HEX1)\t$@\n"
	@$(hex1) $^ $@


clean:
	@for i in $$(ls $(BIN_DIR) | grep -v '$(SEED_NAME)'); do \
		printf "  $(PPO_CLEAN)\t$(BIN_DIR)/$$i\n";         \
		rm $(BIN_DIR)/$$i;                                 \
	done

