# METROID FUSION REDUX

## **Index**

* [**Metroid Fusion Redux Info**](#metroid-fusion-redux)

* [**Changelog**](#changelog)

* [**Optional Patches**](#optional-patches)

* [**To-Do**](#to-do)

* [**Compilation**](#compilation)

* [**Patch & Use Instructions**](#instructions)

* [**Credits**](#credits)

* [**Project Licence**](#license)


-------------------

## Metroid Fusion Redux

“Metroid Fusion Redux” is a personal mod of Metroid Fusion (J) that has a few QoL features ported over from other QoL available on the US version of Metroid Fusion, and also adds some map changes, some of which are based on Metroid Fusion: Special Edition.

Follow the GitHub repository for the full source code of the project:
https://github.com/ShadowOne333/Metroid-Fusion-Redux


-------------------

## Changelog

* Language Selection hack (by biospark), reworked to properly translate the Game Over screen and the "Start Over" text as well
* Main game is in English, while each file can have a specific language available for selection (thanks to the hack above from biospark)
* Modify the Morph Ball so its rolling animation stops when Samus is static or not moving at all. The rolling animation only works as normal when moving left or right.
* Modify Samus' suit palettes to have a better colour palette based on the In-Game cutscenes and official artwork (specifically for the Varia Suit, so it better matches its artwork colours). This is a further improved hack of this: https://www.romhacking.net/hacks/7473/
* Charge Beam is no longer cancelled when doing walljumps
* Equipment Screen fix
* Faster Door Transitions 
* Fixes a glitched frame in Samus when doing a Walljump to the left
* Fixes to the endame ship OAM
* Fixes the arm cannon palette to update accordingly with the suit colours
* IBJ (Infinite Bomb Jump) is now possible like in Super Metroid and Zero Mission. Several Demos have also been fixed manually to account for the new bomb timings.
* Horizontal speed is now maintained when landing after a jump, instead of being reset to 0 on each land.
* More accurate In-Game clock (a second each 60 frames instead of 64 frames)
* Single Wall walljump is now possible, like in Super Metroid and Zero Mission. Several Demos have also been fixed manually to account for the new walljumping mechanic.
* It's now possible to skip the Introduction cutscene by pressing Start, even if the current save file hasn't been completed. 
* Stage palettes have been modified to have a better selection of non-saturated colours. This also modifies the red outlines that many assets of Fusion had.
* Restored an unused Dock room in the original Metroid Fusion, just above the starting area. (It might hold a newly added item).
* Zazabi (the elongated jellyfish one-eyed boss) was only vulnerable to the normal Missile and the Normal beam in the vanilla game. Zazabi's code has been reworked to make it vulnerable to all kinds of beams (Wave and above) and Missiles (Super Missiles, Ice and Diffusion). 


-------------------

## Optional patches

1. **Disable Low Health Alarm** - Self-explanatory. Disables the alarm that you get when Samus is on low health
2. **Normal Beam Chargeable** - Allows the small Normal beam to be chargeable
3. **Permanent Debug Menu** - Enable the Debug menu In-Game. This replaces the Status screen for Samus.

-------------------

## To-Do

1. Implement "Sequence Breaking Fusion" hack into the Japanese ROM. 
There's an on-going disassembly for this, but it is far from being compilable in any form, there's too many inconsistencies between the subroutines and I'm also not that adept in ARM assembly to know if some of the hex codes I disassembled properly work with ARMIPS.
2. There might be other things that might be added, but it's still uncertain whether or not I'd want to do more after Sequence Break, since that's the only thing missing in Fusion for me to make it perfect.
3. Possibly more optional patches.

-------------------

## Compilation

### Windows

For compilation on Windows, you need to download and install [CygWin](https://www.cygwin.com/).

When installing Cygwin, be sure to also install `git` from the list of packages available, or you won't be able to clone the repository from the source.

Once you have it installed, browse to the directory where you downloaded the source code, and start the same steps as the Linux compilation.

(I recompiled the scompress Windows EXE in Cygwin so it works properly with the Windows compilation)


### Linux

The source code was developed entirely on Linux (32bit), with armips being compiled from source to create the binary, same for FLIPS.

* Compiling the ROM:

1. Either download the source code as ZIP, or clone the repository by opening terminal and running `git clone https://github.com/ShadowOne333/Metroid-Fusion-Redux`. Put the downloaded files anywhere in your PC.

2. Grab your Metroid Fusion (J) ROM with the name "Metroid Fusion (Japan).gba" inside the "/rom/" folder.

3. Open terminal in your Linux distribution, browse to the same folder as the "make.sh" file, and modify its permissions to be an executable script file by doing the following:
	`sudo chmod +x make.sh`

4. If you want specific optional patches to be applied in your complation, open the `optional.asm` file inside /code/ and uncomment the `.include "xxxx"` file of the optional patch you desire to include during compilation.

5. Enjoy the hack!


----

## Instructions

To play Metroid Fusion Redux, the following is required:

* mGBA 0.8.1 or above (any recent version of it should work)
* Metroid Fusion (J) GBA ROM:

	Metroid Fusion (Japan).gba
	No-Intro: Game Boy Advance (v. 20210227-023848)
	File/ROM SHA-1: 5D21C668BAA84DA4A5B745BE56809BB277F947A3
	File/ROM CRC32: 817A7E9E

* Lunar IPS
* Metroid-Fusion-Redux.ips patch

Grab the patches from inside the /patches/ folder from the GitHub page, or alternatively, download the .zip file from the Releases page (once a proper release is out) and apply the patch over your Metroid Fusion ROM with Lunar IPS.
If you want to apply any of the optional patches, you can use each Optional patch individually from inside the /patches/optional folder depending on your liking over your already patched Metroid Fusion Redux ROM, or you can either compile them manually from the source code, although this is not recommended if you are not familiar with compilations or ARMIPS assembly.


-------------------

## Credits

* **biospark** - For his incredible work on the original coding for the MF_J Language Selector, as well as a lot of help regarding other specifics of the hack.
* **Raygun** - For the Keep Speed/Smooth Landing, Single Walljump, Walljump Frame fix, Walljump Charge beam, Arm Cannon Palette updates hacks, which were ported over to MF_J by me.
* **Kazuto** - For the wide array of hacks, like Equipment Screen and Zazabi fixes, and for the Sequence Breaking hack as well.
* **LostGlaceon** - For the original "Metroid Fusion: Special Edition" hack, which was the base inspiration to start working on Fusion (J) and start porting other hacks to it.
* **FelixWright** - For his original "Project ZM" hack, which also served as inspiration for this hack, and for his help and support towards certain hacks and porting them.
* **somerando(caauyjdp)** - For all the help and the fix for the Faster Door Transitions hack
* **yohann** - For helping me find the proper X-Pos value for Samus on the Game Over screen, and also finding the value which allows for the Skip Intro hack.
* **Captain Glitch** - For the original Better Morph Ball hack, which was ported over to MF_J by me.
* **Jumzhu** - For the original Faster Door Transitions hack, which got a subsequent fix and then ported over to MF_J by me.
* **interdpth** - For the original End Game Ship OAM fix, which was ported over to MF_J by me.
* **Amaroq the Kitsune** - For the In-Game Timer fix.
* **Metroid Construction** overall for all the great resources, forums and help towards this hack.


-------------------

## License

Metroid Fusion Redux is a project licensed under the terms of the GPLv3, which means that you are given legal permission to copy, distribute and/or modify this project, as long as:

1. The source for the available modified project is shared and also available to the public without exception.
2. The modified project subjects itself different naming convention, to differentiate it from the main and licensed Metroid Fusion Redux project.

You can find a copy of the license in the LICENSE file.
