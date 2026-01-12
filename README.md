# OpenTTD webOS Port

OpenTTD 1.8.0 ported to HP TouchPad running webOS 3.0.5.

## Requirements

- CodeSourcery GCC 4.5.2 toolchain (arm-2011.03)
- HP webOS PDK

## Building

1. Extract OpenTTD 1.8.0 source
2. Copy these modified files over the original source:
   - `src/sdl.cpp` - PDL initialization
   - `src/thread/thread_pthread.cpp` - GLIBC 2.5 compatibility
   - `src/table/settings.ini` - Touch scrolling enabled by default
   - `src/fileio.cpp` - Save path handling
3. Copy `configure-webos.sh` and `webos-pkg-config` to root
4. Edit paths in `configure-webos.sh` to match your toolchain locations
5. Run `./configure-webos.sh`
6. Edit generated `Makefile` to remove `-D_FORTIFY_SOURCE=2` from CFLAGS
7. Run `make`

## Installation on Device

1. Copy the `openttd` binary to `/media/internal/openttd/`
2. Copy `bin/lang/` directory to `/media/internal/openttd/share/games/openttd/lang/`
3. Copy OpenTTD game data files to `/media/internal/openttd/share/games/openttd/baseset/`
4. Run with `./openttd -g` to skip intro (LZMA not supported)

## Changes from Upstream

- Added PDL_Init()/PDL_Quit() calls around SDL for webOS compatibility
- Disabled pthread_setname_np (requires GLIBC 2.12, webOS has 2.5)
- Enabled left mouse button scrolling by default for touchscreen
- Static linked libgcc/libstdc++ to avoid GLIBCXX version issues

## Known Issues

- Save directory defaults to `/home/root//media/internal/openttd` - use manual browse to select correct path
- LZMA compression not supported - use `-g` flag to skip intro

## Credits

Based on OpenTTD 1.8.0 - https://www.openttd.org/
