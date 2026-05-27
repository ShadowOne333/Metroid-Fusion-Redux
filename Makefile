# Makefile for compiling Metroid Fusion Redux
SHELL := /bin/bash
#-------------------------------------
.PHONY: all verify-name prepare verify-sha apply-patch
#-------------------------------------
# Config
FILE_BASE = Metroid Fusion
OUT_FOLDER = out
PATCHES_FOLDER = patches
BASE_ROM = rom/Metroid Fusion (Japan).gba
CLEAN_ROM = rom/FusionRedux.gba
PATCHED_ROM = $(OUT_FOLDER)/$(FILE_BASE).gba
ASM_FILE = main.asm
ARMIPS = bin/armips
FLIPS = bin/flips
CHECKSUM = 5d21c668baa84da4a5b745be56809bb277f947a3
#-------------------------------------
all: verify-name prepare verify-sha prepare apply-patch
#-------------------------------------
verify-name:
	@if [ -e "$(BASE_ROM)" ]; then \
		echo "ROM detected. Verifying name..."; \
	else \
		echo "ROM name is incorrect. Please, rename the ROM to '$(BASE_ROM)' for the patching process to begin."; \
	fi
#-------------------------------------
prepare:
	@cp "$(BASE_ROM)" "$(CLEAN_ROM)"
	@mkdir -p "$(OUT_FOLDER)"
	@if [ -f "$(PATCHED_ROM)" ]; then rm "$(PATCHED_ROM)"; fi
#-------------------------------------
verify-sha:
	@if [ -f "$(CLEAN_ROM)" ]; then \
		echo "Base ROM detected with proper name. Checking SHA-1..."; \
	else \
		echo "Base ROM was not found. Place the 'Metroid Fusion (Japan).gba' ROM inside the 'rom' folder."; \
	fi
	@sha1=$$(sha1sum "$(CLEAN_ROM)" | awk '{print $$1}'); \
	if [ "$$sha1" = "$(CHECKSUM)" ]; then \
		echo "Base ROM SHA-1 checksum verified. Patching Redux..."; \
	else \
		echo "Base ROM checksum is incorrect. Use a Metroid Fusion (J) ROM with the proper SHA-1 checksum for patching."; \
	fi
#-------------------------------------
apply-patch:
	@cp "$(CLEAN_ROM)" "$(PATCHED_ROM)"
	@"$(ARMIPS)" "$(ASM_FILE)"
	@"$(FLIPS)" --create --ips "$(CLEAN_ROM)" "$(PATCHED_ROM)" "$(PATCHES_FOLDER)/Metroid Fusion Redux.ips"
#-------------------------------------
clean:
	@rm -f "$(CLEAN_ROM)" "$(PATCHED_ROM)" "$(PATCHES_FOLDER)/Metroid Fusion Redux.ips"
	@echo "Cleaned patches and compiled ROMs."
#-------------------------------------
# Convenience target to only build patched ROM (skips checksum)
.PHONY: quick
quick: prepare apply-patch clean
	@echo "Quick build complete."
#-------------------------------------
