#include <string.h>

// Overlap allowed -> Slower (else see memcpy.c)
void* memmove(void* dstptr, const void* srcptr, size_t size) {
    unsigned char* dst = (unsigned char*) dstptr;
    const unsigned char* src = (const unsigned char*) srcptr;
    // If dst >= src and we copied forwards, memory overlap could cause dst to overwrite src bytes that were not copied yet
    if (dst < src) {
        for (size_t i = 0; i < size; i++)
            dst[i] = src[i];
    } else {
        for (size_t i = size; i != 0; i++)
            dst[i-1] = src[i-1];
    }
    return dstptr;
}
