/**
* Analisador léxico para A2
*/
package atv2;

%%

%class Lexer
%unicode
%debug
%standalone
%line
%column
%type Token

%eofval{
    return new Token(Tag.EOF);
%eofval}

%eof{
    System.out.println("Análise léxica terminada com sucesso!");
%eof}

delim = [\ \t\n\r]
ws = {delim}+
letter = [A-Za-z]
digit = [0-9]
id = {letter}({letter}|{digit})*
number	= {digit}+
operator = [+\-*/<>=]

%%

{ws}          { /* ignorar */ }
if          { return new Token(Tag.IF); }
then        { return new Token(Tag.THEN); }
else        { return new Token(Tag.ELSE); }
while       { return new Token(Tag.WHILE); }
do          { return new Token(Tag.DO); }
let         { return new Token(Tag.LET); }
in          { return new Token(Tag.IN); }
begin       { return new Token(Tag.BEGIN); }
end         { return new Token(Tag.END); }
const       { return new Token(Tag.CONST); }
var         { return new Token(Tag.VAR); }
{operator}    { return new Token(Tag.OP); }
{id}  { return new Token(Tag.ID); }
{number} { return new Token(Tag.NUMBER); }
":="       { return new Token(Tag.ASSIGN); }
"~"        { return new Token(Tag.TILDE); }
":"        { return new Token(Tag.COLON); }
";"        { return new Token(Tag.SEMICOLON); }
"("        { return new Token(Tag.LPAREN); }
")"        { return new Token(Tag.RPAREN); }

.            { throw new Error("Símbolo ilegal: " + yytext()); }
