/*
 * This file is part of LDrawParser. It is subject to the license terms in
 * the LICENSE file found in the top-level directory of this distribution.
 * You may not use this file except in compliance with the License.
 */
 
parser grammar LDrawParser;

options {
tokenVocab = LDrawLexer; 
}

@header {
package de.dfki.resc28.LDraw.Parser ;
}

@members {
    boolean once = true;
    public boolean once() {
        if (once) {
            once = false;
            return true;
        }
        return false;
    }
}

/*
 * File Format
 */
file
  : title row+ INT? EOF
  ;

title 
  : INT free_text EOL { once() }? 
  ; 



row 
  : author_row 
  | bfc_row 
  | category_row 
  | clear_row 
  | cmdline_row 
//  | colour_row 
  | help_row 
  | history_row 
  | keywords_row 
  | ldraw_row 
  | license_row 
  | name_row 
  | pause_row 
  | print_row 
  | save_row 
  | step_row 
  | write_row 
  | reference_row 
  | line_row 
  | triangle_row 
  | quadrilateral_row 
  | optional_row
  | comment_row 
  | EOL+
  ;


author_row 
  : AUTHOR_CMD realname? username? EOL
  ;


  
bfc_row 
  : BFC_CMD ( NOCERTIFY | CERTIFY | CERTIFY CW? | CERTIFY CCW? ) EOL 
  | BFC_CMD ( (CW | CCW ) | ( CLIP (CW | CCW )? ) | NOCLIP | INVERTNEXT ) EOL
  ;

category_row 
  : CATEGORY_CMD category EOL
  ;

clear_row 
  : CLEAR_CMD EOL
  ;

cmdline_row
  : CMDLINE_CMD free_text EOL
  ;

//colour_row 
//  : LINE_TYPE_0 COLOUR_CMD NAME CODE_X VALUE_V EDGE e [ALPHA a] [LUMINANCE l] [ CHROME | PEARLESCENT | RUBBER | MATTE_METALLIC | METAL | MATERIAL <params> ] 
//  ;

comment_row
  : COMMENT_CMD free_text EOL
  | INT STRING+ EOL
  ;
  
help_row 
  : HELP_CMD free_text EOL
  ;

history_row 
  : HISTORY_CMD YYYY_MM_DD ( username | realname ) free_text EOL
  ;
  
keywords_row 
  : KEYWORDS_CMD free_text EOL
  ;

ldraw_row 
  : LDRAW_ORG_CMD type qualifiers* ( ORIGINAL | UPDATE ) YYYY_RR? EOL
  ;
  
license_row 
  : LICENSE_CMD free_text EOL
  ;

name_row 
  : NAME_CMD FILENAME EOL
  ;

pause_row 
  : PAUSE_CMD EOL
  ;

print_row 
  : PRINT_CMD free_text EOL
  ;

save_row 
  : SAVE_CMD EOL
  ;

step_row 
  : STEP_CMD EOL
  ;

write_row 
  : WRITE_CMD free_text EOL
  ;

reference_row 
  : INT colour point matrix ( subPart | hiResPrimitive | subFile ) EOL
  ;

line_row 
  : INT colour point point EOL
  ;

triangle_row 
  : INT colour point point point EOL
  ;

quadrilateral_row 
  : INT colour point point point point EOL
  ;

optional_row
  : INT colour point point point point EOL
  ;
 

 
realname
  : LCURLY? STRING+ RCURLY?
  ;

username
  : LBRACK STRING RBRACK
  ;

free_text
   : ~EOL*
   ;

category
  : STRING+
  ;

colour
  : INT
  | DIRECTCOLOUR
  ;

point
  : (FLOAT | INT) (FLOAT | INT) (FLOAT | INT)  
  ;

matrix
  : (FLOAT | INT) (FLOAT | INT) (FLOAT | INT) (FLOAT | INT) (FLOAT | INT) (FLOAT | INT) (FLOAT | INT) (FLOAT | INT) (FLOAT | INT)
  ;

subFile
  : FILENAME
  ;
  
subPart
  : SUBPART FILENAME
  ;

hiResPrimitive
  : HIRESPRIMITIVE FILENAME
  ;

qualifiers
  : ALIAS
  | PHYSICAL_COLOUR
  ;
  
type
  : TYPE
  ;