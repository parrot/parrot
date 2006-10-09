#if !defined(PARROT_STM_INTERNAL_H_GAURD)
#define PARROT_STM_INTERNAL_H_GAURD

#include <parrot/parrot.h>
#include <parrot/stm/backend.h>
#include "stm_waitlist.h"

#if STM_PROFILE

#  define CYCLE_BUCKETS 20
#  define TIME_BUCKETS 20
#  define PROFILE(log) log->profile
#  define PROFILE_WAIT(log, time, cycles) \
    do { \
        FLOATVAL the_time = (time); \
        int time_bucket = ceil(the_time * 200.0); \
        int cycle_bucket = cycles - 1; \
        struct STM_profile_data *profile = &PROFILE(log); \
        if (cycles == 0) { \
            ++profile->num_non_waits; \
        } \
        else { \
            if (time_bucket >= TIME_BUCKETS) { \
                time_bucket = TIME_BUCKETS - 1; \
            } else if (time_bucket == 0) { \
                abort(); \
                time_bucket = 0; \
            } \
            if (cycle_bucket >= CYCLE_BUCKETS) { \
                cycle_bucket = CYCLE_BUCKETS - 1; \
            } \
            ++profile->num_waits; \
            ++profile->wait_cycles[cycle_bucket]; \
            ++profile->wait_time[time_bucket]; \
            profile->total_wait_time += the_time; \
            profile->total_wait_cycles += cycles; \
        } \
    } while (0)

#  define PROFILE_TRIED_COMMIT(log) \
    ++PROFILE(log).attempted_commits
#  define PROFILE_FAILED_COMMIT(log) \
    ++PROFILE(log).failed_commits
#  define PROFILE_ABORTED(profile) \
    ++PROFILE(log).num_aborts
        
struct STM_profile_data {
    long attempted_commits;
    long failed_commits;
    long num_aborts;
    long num_non_waits;
    long num_waits;
    long wait_cycles[CYCLE_BUCKETS];
    long wait_time[TIME_BUCKETS];
    double total_wait_time;
    long total_wait_cycles;
};

#else

#  define PROFILE(x) 
#  define PROFILE_TRIED_COMMIT(x)
#  define PROFILE_FAILED_COMMIT(x)
#  define PROFILE_ABORTED(x)
#  define PROFILE_WAIT(x,y,z)

#endif

struct Parrot_STM_PMC_handle_data {
    Buffer buf;
    Parrot_atomic_pointer owner_or_version;
    void * volatile last_version;
    PMC *value;
    STM_waitlist change_waitlist;
};

struct STM_tx_log;

typedef struct STM_tx_log STM_tx_log;

struct STM_write_record {
    Parrot_STM_PMC_handle handle;
    void *saw_version;
    PMC *value;
};

struct STM_read_record {
    Parrot_STM_PMC_handle handle;
    void *saw_version;
    PMC *value;
};

typedef struct STM_write_record STM_write_record;
typedef struct STM_read_record STM_read_record;

enum {
    STM_STATUS_ACTIVE = 0,
    STM_STATUS_ABORTED = 1,
    STM_STATUS_COMMITTED = 2,
    STM_STATUS_INVALID = 3
};

#define STM_START_RECORDS 32

#define STM_MAX_TX_DEPTH 32 /* TODO: remove limitation */

struct STM_tx_log_sub;

typedef struct STM_tx_log_sub STM_tx_log_sub;

/* log for a sub transaction */
struct STM_tx_log_sub {
    Parrot_atomic_integer status;
    /* for poor man's deadlock detection; based on Ennals' implementation */
    Parrot_atomic_integer wait_length;
    int first_write;
    int first_read;
};

struct STM_tx_log {
    int depth;

#if STM_PROFILE
    struct STM_profile_data profile;
#endif

    STM_tx_log_sub inner[STM_MAX_TX_DEPTH];

    int last_write;
    int last_read;
    /* TODO: probably better to make these a list of hashes (one for each tx) */
    STM_write_record *writes;
    int writes_alloced;
    STM_read_record *reads;
    int reads_alloced;
    
    struct waitlist_thread_data *waitlist_data;
};

struct STM_saved_tx_log {
    int num_reads;
    int num_writes;
    STM_read_record *reads;
    STM_write_record *writes;
};
typedef struct STM_saved_tx_log STM_saved_tx_log;

STM_tx_log *Parrot_STM_tx_log_get(Interp *interp);

#endif

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
