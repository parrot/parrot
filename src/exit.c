/*  exit.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Parrot's version of exit(), on_exit(), and friends.
 *  Data Structure and Algorithms:
 *
 *  History:
 *     Initial version by Josh Wilmes
 *  Notes:
 *  References:
 */

#include <stdlib.h>

#include <parrot/parrot.h>

typedef struct {
    void (*function)(int , void *);
    void *arg;

    void *next;        
} handler_node_t;

typedef struct {
    handler_node_t *first;
    handler_node_t *last;
} handler_list_t;

static handler_list_t exit_handler_list = { NULL, NULL};


int
Parrot_on_exit(void (*function)(int , void *), void *arg) {
    /* XXX  we might want locking around the list access.   I'm sure this
     * will be the least of the threading issues. */
    
    handler_node_t* new_node = mem_sys_allocate(sizeof(handler_node_t));
    new_node->function = function;
    new_node->arg = arg;
    new_node->next = NULL;
    
    if (exit_handler_list.first == NULL) {
        exit_handler_list.first = new_node;
    }

    if (exit_handler_list.last == NULL) {
        exit_handler_list.last = new_node;
    }
    else {
        exit_handler_list.last->next = new_node;
        exit_handler_list.last = new_node;

    }
    
    return 0;
}


void Parrot_exit(int status) {
    handler_node_t *node, *next_node;

    /* call all the exit handlers */
    for (node = exit_handler_list.first; node != NULL; node = next_node) {
        (node->function)(status, node->arg);        
        next_node = node->next;

        mem_sys_free(node);
    }

    exit(status);
}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
