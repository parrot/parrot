/*
 * memalign related stuff
 */

#include <mach/vm_map.h>
#include <mach/mach_init.h>

static unsigned log2int(unsigned x) { return (x<2) ? 0 : log2int (x>>1)+1; };

static unsigned roundDownPowerOf2(unsigned x) { return (1 << log2int(x)); };
static unsigned roundUpPowerOf2(unsigned x)
{
    static unsigned one = 1;
    unsigned log2Int = log2int(x);
    
    return ((one << log2Int) == x) ? x : (one << (log2Int + 1));
};

static unsigned roundUpToPageBoundary(unsigned x)
{
    unsigned roundedDown = trunc_page(x);
    
    return (roundedDown == x) ? x : (roundedDown + vm_page_size);
};

typedef struct _memalign_marker_t {
                    vm_address_t start; 
                    vm_size_t size; } memalign_marker_t;

void *
Parrot_memalign(size_t align, size_t size)
{
    size_t effectiveAlign = align;
    size_t padding = 0;
    size_t amountToAllocate = 0;
    
    if( effectiveAlign < sizeof(void *) )
    {
        effectiveAlign = roundUpPowerOf2(sizeof(void *));
    }
    else
    {
        effectiveAlign = roundUpPowerOf2(effectiveAlign);
    }
    
    if( effectiveAlign < sizeof(memalign_marker_t) )
    {
        padding = sizeof(memalign_marker_t);
    }
    else
    {
        padding = effectiveAlign;
    }
    
    amountToAllocate = roundUpToPageBoundary(size + padding);
    
    {
        vm_address_t p = NULL;
        kern_return_t status = vm_allocate(mach_task_self(), &p, 
                                                amountToAllocate, 1);
        
        if( status != KERN_SUCCESS )
        {
            return NULL;
        }
        else
        {
            vm_size_t logEffectiveAlign = log2int(effectiveAlign);
            vm_address_t lowestAvaliableAddress = 
                                p + sizeof(memalign_marker_t);
            vm_address_t roundedDownAddress = 
                            ((lowestAvaliableAddress >> logEffectiveAlign) 
                                                        << logEffectiveAlign);
            vm_address_t returnAddress = 
                            (roundedDownAddress == lowestAvaliableAddress) ? 
                                lowestAvaliableAddress : 
                                    (roundedDownAddress + effectiveAlign);
            vm_address_t firstUnneededPage = 0;
            
            memalign_marker_t *marker = 
                                (memalign_marker_t *)returnAddress - 1;
                                
            /* lowest address used, then round down to vm_page boundary */
            vm_address_t usedPageBase = trunc_page((vm_address_t)marker);
            marker->start = usedPageBase;
            marker->size = returnAddress + size - usedPageBase;
            
            if( usedPageBase > p )
            {
                status = vm_deallocate(mach_task_self(), p, usedPageBase - p);
            
                if( status != KERN_SUCCESS )
                {
                    fprintf(stderr, "Parrot_memalign(%zx, %zx) failed to deallocate extra header space.\n", align, size);
                }
            }
            
            firstUnneededPage = roundUpToPageBoundary(returnAddress + size);
            
            if( firstUnneededPage < p + amountToAllocate )
            {
                status = vm_deallocate(mach_task_self(), firstUnneededPage, 
                                    p + amountToAllocate - firstUnneededPage);
            
                if( status != KERN_SUCCESS )
                {
                    fprintf(stderr, "Parrot_memalign(%zx, %zx) failed to deallocate extra footer space.\n", align, size);
                }
            }
            
            return (void *)returnAddress;
        }
    }
}

void
Parrot_free_memalign(void *p)
{
    memalign_marker_t *marker = (memalign_marker_t *)p - 1;

    kern_return_t status = vm_deallocate(mach_task_self(), 
                                            marker->start, marker->size);

    if( status != KERN_SUCCESS )
    {
        fprintf(stderr, "Parrot_free_memalign(%p) failed!\n", p);
    }
}
