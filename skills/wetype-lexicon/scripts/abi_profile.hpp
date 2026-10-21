#pragma once
#include <cstdint>
// Recovered from the exact arm64 3.0.0 (670) artifact; not offsets guessed by delta.
static constexpr uintptr_t kInitialize=0x101696f10;
static constexpr uintptr_t kResourceInstance=0x101c453b4;
static constexpr uintptr_t kDictManagerVptr=0x1033fe488;
static constexpr uintptr_t kGetByKind=0x1017eccf8;
static constexpr uintptr_t kUserDictVptr=0x1033fbd48;
// Vtable address point (symbol base + two pointer entries), confirmed in the
// exact artifact and isolated native construction.
static constexpr uintptr_t kCleanMakerVptr=0x1034111c0;
static constexpr uintptr_t kLookUpPair=0x1017b07f8;
static constexpr uintptr_t kAdd=0x1017aefa0;
static constexpr const char*kAbi="WeType-3.0.0-670-arm64-UserDictV2-kind128-v1";
