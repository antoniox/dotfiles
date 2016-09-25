# This file is NOT licensed under the GPLv3, which is the license for the rest
# of YouCompleteMe.
#
# Here's the license text for this file:
#
# This is free and unencumbered software released into the public domain.
#
# Anyone is free to copy, modify, publish, use, compile, sell, or
# distribute this software, either in source code form or as a compiled
# binary, for any purpose, commercial or non-commercial, and by any
# means.
#
# In jurisdictions that recognize copyright laws, the author or authors
# of this software dedicate any and all copyright interest in the
# software to the public domain. We make this dedication for the benefit
# of the public at large and to the detriment of our heirs and
# successors. We intend this dedication to be an overt act of
# relinquishment in perpetuity of all present and future rights to this
# software under copyright law.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
#
# For more information, please refer to <http://unlicense.org/>

import os
import tempfile
import subprocess as sb

BASIC_CPP_FLAGS = [
    '-Wall',
    '-Wextra',
    '-Werror',
    '-Wno-c++98-compat',
    '-Wno-long-long',
    '-fexceptions',
    '-std=c++11',
    '-x', 'c++',
    '-I', '.',
]


def gcc_include_pathes():
    cppfile = tempfile.NamedTemporaryFile(suffix=".cpp")
    command_args = ['g++', '-Wp,-v', '-fsyntax-only', cppfile.name, ]
    gcc_call = sb.Popen(command_args, stderr=sb.PIPE, universal_newlines=True)

    gcc_stdlib_pathes = []
    include_pathes_founded = False
    for line in (line.rstrip() for line in gcc_call.stderr):
        if line == "#include <...> search starts here:":
            include_pathes_founded = True
            continue
        elif include_pathes_founded and line.startswith(' '):
            gcc_stdlib_pathes.extend(["-isystem", line.lstrip(), ])

    return gcc_stdlib_pathes


def FlagsForFile(filename, **kwargs):
    final_flags = BASIC_CPP_FLAGS[:]

    dirname, file = os.path.split(filename)

    while dirname != '/':
        if os.path.exists(os.path.join(dirname, 'include')):
            final_flags.extend(['-I', os.path.join(dirname, 'include')], )
        dirname, _ = os.path.split(dirname)

    final_flags.extend(gcc_include_pathes())
    return {
        'flags': final_flags,
        'do_cache': True
    }
