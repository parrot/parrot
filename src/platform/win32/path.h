#ifndef PARROT_WIN32_PATH_H_
#define PARROT_WIN32_PATH_H_
#ifdef __MSYS__

PARROT_CAN_RETURN_NULL
LPWSTR
Parrot_platform_msys_str_to_path(PARROT_INTERP, ARGIN(STRING *path));

PARROT_CAN_RETURN_NULL
STRING *
Parrot_platform_msys_path_to_str(PARROT_INTERP, ARGIN(LPWSTR path));

#define PARROT_WIN32_PATH(interp, path) \
    Parrot_platform_msys_str_to_path(interp, path)

#define PARROT_WIN32_FREE_PATH(path) \
    mem_sys_free(path)

#else

#define PARROT_WIN32_PATH(interp, path) \
    ((LPWSTR)Parrot_str_to_encoded_cstring( \
        interp, path, Parrot_utf16_encoding_ptr))

#define PARROT_WIN32_FREE_PATH(path) \
    Parrot_str_free_cstring(path)

#endif
#endif
