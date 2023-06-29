APP = noot
DESC = a GNU system distribution

DEPS = makemenu mkdir-src get-sources kernel
DEPS_CLEAN = clean clean-makemenu clean-src
DEPS_MRPROPER = mrproper mrproper-makemenu

PPO_MKDIR = MKDIR
PPO_CLEAN = CLEAN

SRC_DIR = src

.PHONY: all $(APP) $(DEPS) $(DEPS_CLEAN) $(DEPS_MRPROPER)


all: $(APP)

$(APP): $(DEPS)

mkdir-src:
	@printf "  $(PPO_MKDIR)\t$(SRC_DIR)\n"
	@if [ ! -d $(SRC_DIR) ]; then \
		mkdir $(SRC_DIR);           \
	fi

makemenu:
	@cd $@; make

get-sources: mkdir-src
		@./scripts/get-sources

kernel: mkdir-src get-sources
		@./scripts/kernel


clean: clean-makemenu clean-src

clean-makemenu:
	@cd makemenu; make clean

clean-src:
	@if [ -d $(SRC_DIR) ]; then              \
		printf "  $(PPO_CLEAN)\t$(SRC_DIR)\n"; \
		rm -r $(SRC_DIR);                      \
	fi

mrproper: mrproper-makemenu clean-src

mrproper-makemenu:
	@cd makemenu; make mrproper

