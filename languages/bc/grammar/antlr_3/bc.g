/* $Id$
 *
 */
grammar BcParser;

program
    :   INT 
    ;

INT :	('0'..'9')+
    ;
