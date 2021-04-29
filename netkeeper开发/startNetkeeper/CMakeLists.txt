cmake_minimum_required(VERSION 3.1)

project(startNetkeeper C)
set(CMAKE_C_COMPILER "/home/yx/openwrt/staging_dir/toolchain-mipsel_24kc_gcc-8.4.0_musl/bin/mipsel-openwrt-linux-musl-gcc")
include_directories(include)
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
aux_source_directory(src src)

add_compile_options(-std=c17 -Wall -Werror -Wextra -pedantic -Wimplicit-fallthrough -Wsequence-point -Wswitch-default -Wswitch-unreachable -Wswitch-enum -Wstringop-truncation -Wbool-compare -Wtautological-compare -Wfloat-equal -Wshadow=global -Wpointer-arith -Wpointer-compare -Wcast-align -Wcast-qual -Wwrite-strings -Wdangling-else -Wlogical-op -Wconversion -Wno-pedantic-ms-format)

add_executable(startNetkeeper ${src})