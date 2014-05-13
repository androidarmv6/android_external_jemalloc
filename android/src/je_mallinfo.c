/*
 * Copyright (C) 2014 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "jemalloc/internal/jemalloc_internal.h"

// This is a very simple implementation that only gives information for
// the main thread's arena.
struct mallinfo je_mallinfo() {
  struct mallinfo mi;
  memset(&mi, 0, sizeof(mi));

  arena_t* arena = choose_arena(NULL);
  if (arena != NULL) {
    mi.arena = arena->stats.mapped;
    mi.uordblks = arena->stats.allocated_large;
    mi.fordblks = mi.arena - mi.ordblks;
  }
  return mi;
}
