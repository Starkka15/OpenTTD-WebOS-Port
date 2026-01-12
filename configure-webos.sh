#!/bin/bash
# Configure script for OpenTTD 1.8 webOS build with CodeSourcery toolchain

TOOLCHAIN_ROOT=/home/stark/arm-2011.03
PDK_ROOT=/home/stark/HPwebOS/PDK

./configure \
    --os=UNIX \
    --prefix-dir=/media/internal/openttd \
    --personal-dir=/media/internal/openttd \
    --without-liblzma \
    --without-liblzo2 \
    --without-xdg-basedir \
    --without-fontconfig \
    --without-icu \
    --without-freetype \
    --without-png \
    --disable-strip \
    --pkg-config="$PWD/webos-pkg-config" \
    --cc-host="${TOOLCHAIN_ROOT}/bin/arm-none-linux-gnueabi-gcc" \
    --cxx-host="${TOOLCHAIN_ROOT}/bin/arm-none-linux-gnueabi-g++" \
    --with-sdl \
    CFLAGS="-mcpu=cortex-a9 -mfpu=neon -mfloat-abi=softfp -U_FORTIFY_SOURCE -I${PDK_ROOT}/include -I${PDK_ROOT}/include/SDL -DWEBOS -DUNIX" \
    CXXFLAGS="-mcpu=cortex-a9 -mfpu=neon -mfloat-abi=softfp -U_FORTIFY_SOURCE -I${PDK_ROOT}/include -I${PDK_ROOT}/include/SDL -DWEBOS -DUNIX" \
    LDFLAGS="-L${PDK_ROOT}/device/lib -Wl,-rpath-link,${PDK_ROOT}/device/lib -Wl,--dynamic-linker=/lib/ld-linux.so.3 -lpdl -static-libgcc -static-libstdc++"
