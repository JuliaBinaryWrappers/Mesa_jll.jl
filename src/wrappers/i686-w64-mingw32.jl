# Autogenerated wrapper script for Mesa_jll for i686-w64-mingw32
export opengl32sw

using Zlib_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "PATH"
LIBPATH_default = ""

# Relative path to `opengl32sw`
const opengl32sw_splitpath = ["bin", "opengl32sw.dll"]

# This will be filled out by __init__() for all products, as it must be done at runtime
opengl32sw_path = ""

# opengl32sw-specific global declaration
# This will be filled out by __init__()
opengl32sw_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const opengl32sw = "opengl32sw.dll"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"Mesa")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (Zlib_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (Zlib_jll.LIBPATH_list,))

    global opengl32sw_path = normpath(joinpath(artifact_dir, opengl32sw_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global opengl32sw_handle = dlopen(opengl32sw_path)
    push!(LIBPATH_list, dirname(opengl32sw_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ';')
    global LIBPATH = join(vcat(LIBPATH_list, [Sys.BINDIR, joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ';')

    
end  # __init__()

