# Super Mario (x86 Assembly / MASM + Irvine32)

A console-based Super Mario–style game written in x86 Assembly (MASM) and built in Visual Studio 2022.  
It uses the Irvine32 library for console/game utilities and the Windows multimedia (WinMM) library for sound effects.

## Why this project is useful
Most people think Assembly is only for tiny programs. This project shows that you can still build a complete game loop with real gameplay logic in low-level x86 Assembly.

## Built with
- Visual Studio 2022 (MASM / x86)
- Irvine32 library
- Windows WinMM library (sound effects)

## Key features
- Main menu, instructions screen, and high scores screen
- Player name input and level selection
- Mario movement (left/right), jump + gravity-style physics
- Enemies update inside the game loop (so everything “moves together”)
- Collision handling (player vs enemies/coins/obstacles)
- Score, lives, and basic HUD
- High scores saved/loaded from a file (example: `highscores.txt`)
- Sound effects using Windows multimedia library (WinMM)

## How it works (simple explanation)
Even though Assembly executes one instruction at a time, the game feels parallel because it repeats a fast loop many times per second:

Input → Physics → Enemies → Collisions → Draw → Repeat

Each frame updates Mario and enemies step by step, so they appear to walk at the same time.

## Requirements
- Windows
- Visual Studio 2022 with MASM support (x86 / 32-bit)
- Irvine32 properly linked (Irvine32.inc + Irvine32.lib)
- WinMM linked for sound (Winmm.lib)
- If your sound uses .wav files, place them in the correct folder/path used in the code

## How to run (Visual Studio 2022)
1. Open the `.sln` in Visual Studio 2022.
2. Select **x86** platform (not x64).
3. Build and run.

If you get include/link errors, re-check:
- Include path contains the Irvine folder (for `Irvine32.inc`)
- Library path contains the Irvine folder (for `Irvine32.lib`)
- Linker includes `Winmm.lib` if you are calling sound functions

## Controls
(Replace with your exact controls)
- A / Left Arrow  → Move left
- D / Right Arrow → Move right
- Space           → Jump
- Esc             → Pause / Exit (if implemented)

## Known limitations / in progress
- Boss/castle part is still under development (if not fully completed).
- Graphics are console-based (character rendering).

## Project info
This was built as a semester / COAL-style Assembly project to practice low-level programming and game logic.

## Developer
**Muhammad Mesum Ali**  
BS (CS) Student at FAST NUCES Islamabad  
Contact: alimesum2005@gmail.com

