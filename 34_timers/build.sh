#!/bin/bash

# Set the arguments of each of the options for compiling
# our source code.
# Assume by default this is for linux
COMPILER="g++"
ARGS="-g -std=c++17"
SRC="./src/*.cpp"
INCLUDE="./include"
BINARY="./bin/prog"
LIBS="-lSDL2 -lSDL2_ttf -lSDL2_mixer -ldl"

# Echo out the platform we are compilng on.
echo "Compiling on ${OSTYPE}"

# Build the compile string
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo ""
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Compilng on Mac"
    ARGS="-g -std=c++17 -D MAC"
    INCLUDE="./include -I/Library/Frameworks/SDL2.framework/Headers -I/Library/Frameworks/SDL2_ttf.framework/Headers -I/Library/Frameworks/SDL2_mixer.framework/Headers"
    LIBS="-F/Library/Frameworks -framework SDL2 -framework SDL2_ttf -framework SDL2_mixer"
    echo ""
elif [[ "$OSTYPE" == "mysys" ]] ; then
    echo "Compiling on Windows(mysys)"
    LIBS="-lmingw32 -lSDL2main -lSDL2 -lSDL2_ttf -lSDL2_mixer"
    echo ""
else
    echo "Not sure what operating system to build for?? Trying defaults"
    echo ""
fi

COMPILE="${COMPILER} ${ARGS} ${SRC} -I ${INCLUDE} -o ${BINARY} ${LIBS}"

# Write out the compile string for the user to see
echo ${COMPILE}

# Evaluate the compile string
eval $COMPILE
