#include <string.h>
#include <stdarg.h>
#include "bcg_logger_private.h"

void
bcg_throw_exception(BCG_info * bcg_info, const int code, const char *format,
                    ...)
{
    char *message;
    va_list ap_list;

    message = mem_sys_allocate(sizeof(char) * MAX_MESSAGE_SIZE);

    va_start(ap_list, format);
    vsnprintf(message, MAX_MESSAGE_SIZE, format, ap_list);
    va_end(ap_list);

    bcg_info->error_msg = message;
    bcg_info->error_code = code;
    BCG_THROW(bcg_info, code);
}
