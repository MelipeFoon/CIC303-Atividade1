/**
* Analisador léxico para A1
*/
package atv1;

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

%{
// Macros
%}

delim = [\ \t\n]
ws = {delim}+
letter = [A-Z]
id = {letter}
true = "true"
false = "false"
or = "or"
and = "and"
not = "not"
implies = "implies"
paren_e = "("
paren_d = ")"

%%
/* Regras e ações */
{ws} { /* ignorar */ }
{or} { return new Token(Tag.OR); }
{and} { return new Token(Tag.AND); }
{not} { return new Token(Tag.NOT); }
{implies} { return new Token(Tag.IMPLIES); }
{id} { return new Token(Tag.ID); }
{paren_e} { return new Relop(Tag.PE);}
{paren_d} { return new Relop(Tag.PD);}
{true} { return new Relop(Tag.TRUE);}
{false} { return new Relop(Tag.FALSE);}


/* Qualquer outro - gerar erro */
. { throw new Error("Símbolo ilegal <" + yytext()); }