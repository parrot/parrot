#! nqp
# Copyright (C) 2011, Parrot Foundation.

# Handcrafted definitions of structs used.
# TODO: Generate this file from original headers

# Each definition is hash of field to index.

module Ops::Compiler;

our %STRUCT;

INIT {
    %STRUCT<struct.parrot_interp_t> := hash(
        ctx                     => 0,
        gc_sys                  => 1,
        gc_registry             => 2,
        class_hash              => 3,
        vtables                 => 4,
        n_vtable_max            => 5,
        n_vtable_alloced        => 6,
        piodata                 => 7,
        evc_func_table          => 8,
        evc_func_table_size     => 9,
        n_libs                  => 10,
        all_op_libs             => 11,
        flags                   => 12,
        debug_flags             => 13,

        run_core                => 14,
        cores                   => 15,
        num_cores               => 16,

        resume_flag             => 17,
        resume_offset           => 18,

        code                    => 19,
        current_pf              => 20,

        op_hash                 => 21,

        pdb                     => 22,
        lo_var_ptr              => 23,
        parent_interpreter      => 24,
        world_inited            => 25,
        hash_seed               => 26,
        iglobals                => 27,

        HLL_info                => 28,
        HLL_namespace           => 29,

        root_namespace          => 30,
        scheduler               => 31,

        op_mmd_cache            => 32,

        caches                  => 33,

        const_cstring_table     => 34,
        const_cstring_hash      => 35,

        task_queue              => 36,
        exit_handler_list       => 37,
        sleeping                => 38,

        current_runloop         => 39,
        runloop_jmp_free_list   => 40,

        current_runloop_level   => 41,
        current_runloop_id      => 42,

        thread_data             => 43,

        recursion_limit         => 44,

        current_cont            => 45,
        api_jmp_buf             => 46,
        final_exception         => 47,
        exit_code               => 48,
    )
};

# Local Variables:
#   mode: perl6
#   fill-column: 100
# End:
# vim: expandtab ft=perl6 shiftwidth=4:
