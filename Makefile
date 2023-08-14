APP = noot
DESC = a GNU system distribution

DEPS = makemenu mkdir-src get-pkgs get-kernel
DEPS_CLEAN = clean clean-makemenu clean-src
DEPS_MRPROPER = mrproper mrproper-makemenu

PPO_MKDIR = MKDIR
PPO_CLEAN = CLEAN

SRC_DIR = src

ifndef VERBOSE
MAKEFLAGS += --no-print-directory
endif

.PHONY: all $(APP) $(DEPS) $(DEPS_CLEAN) $(DEPS_MRPROPER) help


###################
# === TARGETS === #
###################
all: $(APP)

$(APP): $(DEPS)

makemenu:
	@cd $@; make

mkdir-src:
	@printf "  $(PPO_MKDIR)\t$(SRC_DIR)\n"
	@if [ ! -d $(SRC_DIR) ]; then \
		mkdir $(SRC_DIR);           \
	fi

get-pkgs: mkdir-src
		@./scripts/get-pkgs

get-kernel: get-pkgs
		@./scripts/get-kernel


#########################
# === CLEAN targets === #
#########################
clean: clean-makemenu clean-src

clean-makemenu:
	@cd makemenu; make clean

clean-src:
	@if [ -d $(SRC_DIR) ]; then              \
		printf "  $(PPO_CLEAN)\t$(SRC_DIR)\n"; \
		rm -r $(SRC_DIR);                      \
	fi


############################
# === MRPROPER targets === #
############################
mrproper: mrproper-makemenu clean-src

mrproper-makemenu:
	@cd makemenu; make mrproper


################
# === HELP === #
################
help:
	@printf "all\t\t- Build all targets marked with [*].\n"
	@printf "* makemenu\t\t- Build the 'makemenu' program.\n"
	@printf "* get-pkgs\t\t- Gets the source code of all packages defined in 'config.json'.\n"
	@printf "* get-kernel\t\t- Gets the kernel source code defined in 'config.json'.\n"
	@echo
	@printf "Execute 'make' or 'make all' to build all targets marked with [*].\n"
	@printf "For further info see the ./README file and the documentation generated.\n"
