/* Events.h
 *
 * Event header
 *
 */

#if !defined(PARROT_EVENT_H_GUARD)
#define PARROT_EVENT_H_GUARD

#define EXECUTE_OPCODE(x) interpreter->opcode_funcs[*(IV *)x]->(code, interpreter)

#define CHECK_EVENTS(x)

#endif
