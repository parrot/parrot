
#include "imc.h"
#include "string.h"

Set* set_make (int length) {
	Set *s = malloc(sizeof(Set));
	s->length = length;
	s->bmp = calloc(sizeof(char), length/8 + 1);

	return s;
}

Set* set_make_full (int length) {
	Set *s = malloc(sizeof(Set));
	int i;

	s->length = length;
	s->bmp = malloc(sizeof(char) * (length/8 + 1));

	for (i=0; i < (length/8) + 1; i++) {
		s->bmp[i] = 255;
	}

	return s;
}

void set_free (Set *s) {
	free (s->bmp);
	free (s);
}

Set* set_copy (Set *s1) {
	int i;
	Set *s = malloc(sizeof(Set));
	s->length = s1->length;
	s->bmp = malloc( sizeof(char) * (s->length/8 + 1));

	for (i=0; i < (s->length/8); i++) {
		s->bmp[i] = s1->bmp[i];
	}

	return s;
}


int set_equal (Set *s1, Set *s2) {
	int i;
	
	if (s1->length != s2->length) {
		fprintf(stderr, "INTERNAL ERROR: Sets don't have the same length in set_equal!\n");
	}

	for (i=0; i < (s1->length/8); i++) {
		if (s1->bmp[i] != s2->bmp[i]) { return 0; };
	}

	/* bug here: the tail of the bitmap is not compared */

	return 1;
}

void set_add (Set *s, int element) {
	s->bmp[element >> 3] |= (1 << (element & 7));
}

int set_contains(Set *s, int element) {
	return s->bmp[element >> 3] & (1 << (element & 7)); 
}

Set * set_union(Set *s1, Set *s2) {
	int i;
	
	Set *s = malloc(sizeof(Set));
	s->length = s1->length;
	s->bmp = malloc(sizeof(char) * (s1->length/8 + 1));
	
	if (s1->length != s2->length) {
		fprintf(stderr, "INTERNAL ERROR: Sets don't have the same length in set_union!\n");
		
	}
	for (i=0; i< (s1->length/8) + 1; i++) {
		s->bmp[i] = s1->bmp[i] | s2->bmp[i];
	}

	return s;
}

Set * set_intersec(Set *s1, Set *s2) {
	int i;
	
	Set *s = malloc(sizeof(Set));
	s->length = s1->length;
	s->bmp = malloc(sizeof(char) * (s->length/8 + 1));
	
	if (s1->length != s2->length) {
		fprintf(stderr, "INTERNAL ERROR: Sets don't have the same length in set_intersec!\n");
		
	}
	for (i=0; i< (s1->length/8) + 1; i++) {
		s->bmp[i] = s1->bmp[i] & s2->bmp[i];
	}

	return s;
}

void set_intersec_inplace(Set *s1, Set *s2) {
	int i;
	
	if (s1->length != s2->length) {
		fprintf(stderr, "INTERNAL ERROR: Sets don't have the same length in set_intersec_inplace!\n");
	}

	for (i=0; i< (s1->length/8) ; i++) {
		s1->bmp[i] &= s2->bmp[i];
	}
}
