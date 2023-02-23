#! /bin/bash
#-------------------------------------
export	file_base="Metroid Fusion"
export  out_folder=out
export	patches_folder=patches
export  base_rom=rom/"Metroid Fusion (Japan).gba"
export  clean_rom=rom/"FusionRedux.gba"
export  patched_rom=$out_folder/$file_base.gba
export  asm_file=main.asm
export	checksum=5d21c668baa84da4a5b745be56809bb277f947a3
#-------------------------------------
# Create a new function called "jumpto"
function jumpto
{
    label=$1
    cmd=$(sed -n "/$label:/{:a;n;p;ba};" $0 | grep -v ':$')
    eval "$cmd"
    exit
}

#-------------------------------------
start=${1:-"start"}
jumpto $start

#-------------------------------------
start:
# Verify the base ROM's name
if [ -e "$base_rom" ]; then
	echo "ROM detected. Verifying name..."; else
	export error="ROM name is incorrect. Please, rename the ROM to '$base_rom' for the patching process to begin." && jumpto ERROR; fi

# Copy the base ROM to a new one for compilation
#cd rom/ && cp "$base_rom" "$clean_rom" && cd ..
cp "$base_rom" "$clean_rom"
test ! -d "$out_folder" && mkdir "$out_folder"
test -f "$patched_rom" && rm "$patched_rom"

# Detected the proper name, begin SHA-1 checksum verification
if [ -f "$clean_rom" ]; then
	echo "Base ROM detected with proper name. Checking SHA-1..."; else
	export error="Base ROM was not found. Place the '$base_rom' ROM inside the 'rom' folder." && jumpto ERROR; fi

# Export the SHA-1 checksum 
export sha1=$(sha1sum "$clean_rom" | awk '{ print $1 }')

# SHA-1 checksum passed, begin compilation
if [ "$sha1" == "$checksum" ]; then
	echo "Base ROM SHA-1 checksum verified. Patching Redux..."; else
	export error="Base ROM checksum is incorrect. Use a Metroid Fusion (J) ROM with the proper SHA-1 checksum for patching." && jumpto ERROR; fi

#-------------------------------------
# Copy the base ROM 
cp "$clean_rom" "$patched_rom"
bin/armips "$asm_file"
bin/flips --create --ips "$clean_rom" "$patched_rom" "$patches_folder/Metroid Fusion Redux.ips"

jumpto END

#-------------------------------------
ERROR:
	echo "ERROR: $error"

#-------------------------------------

END:
	rm $clean_rom
	sleep 1
	exit

