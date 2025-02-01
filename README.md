# Penumbra

This project combines the open source releases of Frictional Games's Penumbra:
Overture, namely, [OAL Wrapper](https://github.com/FrictionalGames/OALWrapper),
[HPL1 Engine](https://github.com/FrictionalGames/HPL1Engine), and [Penumba:
Overture](https://github.com/FrictionalGames/PenumbraOverture) itself.

The goal of this project is to preserve this game so it remains playable on
modern systems. This effort is currently focused on the Linux platform as 1)
this is what the author currently uses, and 2) the Linux release of the game
that is available on Steam no longer works. Please consider contributing to the
project if you'd like to see this effort extended to other platforms.

Should Frictional Games ever open source the remaining games of the Penumbra
collection (Black Plague and Requiem), this project will endeavor to
incorporate those games into this preservation effort. Interested parties are
encouraged to contact Frictional Games and politely ask them to consider
open-sourcing those games.


## Requirements

Penumbra is currently only buildable as a 32-bit executable. This is because
the engine relies on a closed-source version of the Newton physics engine that
is only available in 32 bit. The Newton physics engine itself has gone open
source, beginning with version 2.31, but the HPL1 engine will need to be
updated to work with a newer version of Newton (or some other physics library)
that can be built in 64 bit.

Penumbra requires the following 32-bit libraries:
- Nvidia CG toolkit
- Ogg
- OpenAL
- SDL 1.2
- SDL_image 1.2
- SDL_ttf 1.2
- Vorbis

Penumbra uses CMake to manage the build process, so a supported generator will
also need to be installed, as well as a C and C++ compiler and associated
standard headers and libraries.


## Playing the Game

Although the game source code is open source, the game assets and data are not.
Therefore, a copy of Penumbra: Overture is needed in order for Penumbra to run.
Check [the Penumbra website](https://www.penumbragame.com/) for information on
obtaining the game.

1.  Change into the top-level Penumbra source directory.

2.  Copy all game assets into a directory named `redist`.

3.  Configure the build:

        $ cmake -B build -S . -DCMAKE_BUILD_TYPE=Release

    If building in step 4 fails due to not being able to find 32-bit versions
    of system libraries, you can specify this when configuring the build:

        $ cmake -B build -S . -DCMAKE_BUILD_TYPE=Release -DLIB32_PATH=</path/to/32-bit/libraries>

4.  Build the source:

        $ cmake --build build

5.  Run the game:

        $ cmake --build build --target run_overture

If your platform has [(GNU) Make](https://www.gnu.org/software/make/)
installed, you can do steps 3-5 all at once by executing the command:

    $ make run


## Contributing

If you wish to hack at the source, the process is very similar to running the
game, however you will want to make a Debug build to make debugging and
troubleshooting easier.

1.  Change into the top-level Penumbra source directory.

2.  Copy all game assets into a directory named `redist`.

3.  Configure the build:

        $ cmake -B build -S . -DCMAKE_BUILD_TYPE=Debug

    If building in step 4 fails due to not being able to find 32-bit versions
    of system libraries, you can specify this when configuring the build:

        $ cmake -B build -S . -DCMAKE_BUILD_TYPE=Debug -DLIB32_PATH=</path/to/32-bit/libraries>

4.  Build the source:

        $ cmake --build build

5.  To run the game in a debugger ([GDB](https://sourceware.org/gdb/) is
    currently required):

        $ cmake --build build --target debug_overture

If your platform has [(GNU) Make](https://www.gnu.org/software/make/)
installed, you can do steps 3-5 by executing the commands:

    $ make config-debug
    $ make debug
