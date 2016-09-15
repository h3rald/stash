" Vim syntax file
" Language: MiNiM
" Maintainer: Fabio Cevasco
" Last Change: 15 September 2016
" Version: 1.0.0

if exists("b:current_syntax")
  finish
endif

setl iskeyword+=?,$,+,*,/,%,=,>,<,&,-,',.,:,@,~,!

syntax keyword          minimDefaultSymbol ! != $ & ' * + - -> . .. / : < <= == => =~ > >= @ ROOT aes and append apply at atime b bind bool bool? bury1 bury2 bury3 c call call! capitalize cd chmod clear-stack concat cons cp cpu crypto ctime datetime ddel debug debug? decode define delete dget dictionary? dig1 dig2 dig3 dip dir? div dprint dprint! dset dump-stack dup dupd echo encode env? eq eval even? exit fappend file? filter first float float? fperms fread from-json fs fsize fstats ftype fwrite get get-stack getenv gt gte hardlink hidden? i id ifte import indent inspect int int? interpolate interval io join k keys length linrec load load-symbol logic lowercase ls ls-r lt lte map match md5 mkdir mod module mtime mv newline not noteq now num number? odd? or os pop popd pred prepend print print! put put! putenv q quit quotation? quote raise regex remove-symbol repeat replace rest rm rmdir run save-symbol scope seal search select set-stack sha1 sha224 sha256 sha384 sha512 sigil sigils sip size sleep split stored-symbols str string string? strip succ swap swapd swons symbols symlink symlink? sys system tab-print take tformat time timeinfo times timestamp titleize to-json try unit unquote uppercase values version which while with xor zap contains


syntax match            minimDefaultSigil     ;\<[:@'~!$%&$=<>*]; contained
syntax match            minimQuote            ;\<['];

syntax keyword          minimCommentTodo      TODO FIXME XXX TBD contained
syntax match            minimComment          /;.*$/ contains=minimCommentTodo

syntax match            minimNumber           ;[-+]\=\d\+\(\.\d*\)\=;
syntax keyword          minimBoolean          true false
syntax region           minimString           start=+"+ skip=+\\\\\|\\$"+  end=+"+  

syntax region           minimSigilSymbol      start=;\<[:@'~!$%&$=<>*]; end=;\>; contains=minimDefaultSigil  
syntax region           minimQuotedSymbol     start=;\<[']; end=;\>; contains=minimQuote
syntax match            minimBoundSymbol       ;@\h\w*; contains=minimBinding
syntax match            minimSymbol           ;[a-zA-Z_][a-zA-Z0-9/!?_-]*;

syntax match            minimParen            ;(\|); 



" Highlighting
hi default link         minimComment          Comment
hi default link         minimCommentTodo      Todo
hi default link         minimString           String
hi default link         minimSigilSymbol      String
hi default link         minimNumber           Number
hi default link         minimBoolean          Boolean
hi default link         minimDefaultSymbol    Statement
hi default link         minimQuote            Delimiter
hi default link         minimDefaultSigil     Delimiter
hi default link         minimSymbol           Identifier
hi default link         minimBoundSymbol      Identifier
hi default link         minimQuotedSymbol     Special
hi default link         minimParen            Special

let b:current_syntax = "minim"
