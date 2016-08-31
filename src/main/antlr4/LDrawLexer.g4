/*
 * This file is part of LDrawParser. It is subject to the license terms in
 * the LICENSE file found in the top-level directory of this distribution.
 * You may not use this file except in compliance with the License.
 */
 
lexer grammar LDrawLexer;

@ header {
package de.dfki.resc28.LDrawParser ;
 }


AUTHOR_CMD
  : '0 Author:'
  ;
  
BFC_CMD
  : '0 BFC'
  ;
  
CATEGORY_CMD
  : '0 !CATEGORY'
  ;

CLEAR_CMD
  : '0 CLEAR'
  ;

CMDLINE_CMD
  : '0 !CMDLINE'
  ;

COLOUR_CMD
  : '0 !COLOUR'
  ;

COMMENT_CMD
  : '0 //'
  | '0 --'
  ;
  
HELP_CMD
  : '0 !HELP'
  ;

HISTORY_CMD
  : '0 !HISTORY'
  ;

KEYWORDS_CMD
  : '0 !KEYWORDS'
  ;

LDRAW_ORG_CMD
  : '0 !LDRAW_ORG'
  ;

LICENSE_CMD
  : '0 !LICENSE'
  ;

NAME_CMD
  : '0 Name:'
  ;

PAUSE_CMD
  : '0 PAUSE'
  ;

PRINT_CMD
  : '0 PRINT'
  ;
  
SAVE_CMD
  : '0 SAVE'
  ;

STEP_CMD
  : '0 STEP'
  ;
  
WRITE_CMD
  : '0 WRITE'
  ;

/*
 * 
 */
 
FILENAME 
  : [a-zA-Z0-9_-]+ '.' ( DAT | LDR | MPD ) 
  ;

SUBPART
  : 's\\'
  | 'S\\'
  ; 

HIRESPRIMITIVE
  : '48\\'
  ; 

NOCERTIFY
  : 'NOCERTIFY'
  ;

CERTIFY
  : 'CERTIFY'
  ;

CW
  : 'CW'
  ;

CCW
  : 'CCW'
  ;

CLIP
  : 'CLIP'
  ;

NOCLIP
  : 'NOCLIP'
  ;

INVERTNEXT
  : 'INVERTNEXT'
  ;
  

YYYY_MM_DD
  : '0'..'9' '0'..'9' '0'..'9' '0'..'9' '-' '0'..'9' '0'..'9' '-' '0'..'9' '0'..'9'
  ;

YYYY_RR
  : '0'..'9' '0'..'9' '0'..'9' '0'..'9' '-' '0'..'9' '0'..'9'
  ;

TYPE
  : 'Part'
  | 'Subpart'
  | 'Primitive'
  | '48_Primitive'
  | 'Shortcut'
  | 'File'
  | 'Model'
  | 'Submodel'
  | 'Element'
  | 'Sub-part'
  | 'Hi-Res Primitive'
  | 'Cross-reference'
  ;

ORIGINAL 
  : 'ORIGINAL' 
  ;

UPDATE 
  : 'UPDATE' 
  ;

ALIAS
  : 'Alias' 
  ;
PHYSICAL_COLOUR
  : 'Physical_Colour'
  ;

DIRECTCOLOUR
  : '0' 'x' '2' HEXDIGIT HEXDIGIT HEXDIGIT HEXDIGIT HEXDIGIT HEXDIGIT
  ; 

INT 
  : '-'? DIGIT+ [Ll]? 
  ;

//FLOAT:  '-'? DIGIT+ '.' DIGIT+ EXP? [Ll]?
//    |   '-'? '.' DIGIT+ EXP? [Ll]?
//    ;

FLOAT
  : '-'? DIGIT* '.' DIGIT+ [Ll]?
  | '-'? DIGIT* '.' DIGIT+ EXP? [Ll]?
  | '-'? DIGIT+ EXP? [Ll]?
  ;

COMMA 
  : ',' 
  ;
  
LBRACK 
  : '[' 
  ;
  
RBRACK 
  : ']' 
  ;

LCURLY 
  : '{' 
  ;
  
RCURLY 
  : '}' 
  ;



/*
 * FRAGMENT LEXER RULES
 */

STRING
  : CHAR+ 
  ;


fragment CHAR
  : 'A' .. 'Z' 
  | 'a' .. 'z'
  | '0' .. '9'
  | 'ü'
  | 'Ü'
  | 'ä'
  | 'Ä'
  | 'ö'
  | 'Ö'
  | '@' 
  | '*' 
  | ',' 
  | '-' 
  | '_' 
  | '~' 
  | '(' 
  | ')' 
  | '%' 
  | '#' 
  | '<' 
  | '>' 
  | '#' 
  | '=' 
  | '/' 
  | '.' 
  | ':' 
  | ( '"' { skip(); } )
  | ';' 
  | '+' 
  | '!' 
  | '\'' 
  | '&' 
  | 'é' 
  | 'É' 
  | '?' 
  ;


fragment DIGIT
  : '0'..'9' 
  ;

fragment HEXDIGIT
  : ( DIGIT | 'A'..'F' )
  ;

fragment EXP
  :  ('E' | 'e') ('+' | '-')? INT 
  ;

fragment DAT
  : 'dat'
  | 'DAT'
  | 'dAT'
  ;

fragment LDR
  : 'ldr'
  | 'LDR'
  ;

fragment MPD
  : 'mpd'
  | 'MPD'
  ;



EOL 
  : [\r\n]+ 
  ;

WS 
  : [ \t\u000C]+-> skip
  ;