APP = noot
DESC = a GNU system distribution

DEPS = makemenu download

PPO_MKDIR = MKDIR
PPO_CLEAN = CLEAN

SRC_DIR = src

.PHONY: all $(APP) $(DEPS) clean clean-makemenu clean-download mrproper mrproper-makemenu


all: $(APP)

$(APP): $(DEPS)

makemenu:
	@cd $@; make

download:
	@printf "  $(PPO_MKDIR)\t$(SRC_DIR)\n"
	@mkdir $(SRC_DIR)
	@./scripts/part-0/download


clean: clean-makemenu clean-download

clean-makemenu:
	@cd makemenu; make clean

clean-download:
	@if [ -d $(SRC_DIR) ]; then              \
		printf "  $(PPO_CLEAN)\t$(SRC_DIR)\n"; \
		rm -r $(SRC_DIR);                      \
	fi

mrproper: mrproper-makemenu clean-download

mrproper-makemenu:
	@cd makemenu; make mrproper

