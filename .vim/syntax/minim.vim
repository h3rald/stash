" Vim syntax file
" Language: MiNiM
" Maintainer: Fabio Cevasco
" Last Change: 11 September 2016
" Version: 1.0.0

if exists("b:current_syntax")
  finish
endif

syntax keyword          minimDefaultSymbol ROOT aes and append apply at atime b bind bool bury1 bury2 bury3 c call capitalize cd chmod clear-stack concat cons cp cpu crypto ctime datetime ddel debug decode define delete dget dig1 dig2 dig3 dip div dprint dset dump-stack dup dupd echo encode eq eval exit fappend filter first float fperms fread from-json fs fsize fstats ftype fwrite get get-stack getenv gt gte hardlink i id ifte import indent inspect int interpolate interval io join k keys length linrec load load-symbol logic lowercase ls ls-r lt lte map match md5 mkdir mod module mtime mv newline not noteq now num or os pop popd pred prepend print put putenv q quit quote raise regex remove-symbol repeat replace rest rm rmdir run save-symbol scope seal search select set-stack sha1 sha224 sha256 sha384 sha512 sigil sigils sip size sleep split stored-symbols str string strip succ swap swapd swons symbols symlink sys system tab-print take tformat time timeinfo times timestamp titleize to-json try unit unquote uppercase values version which while with xor zap 

syntax match            minimDefaultSymbol    ;\(dir\|dictionary\|bool\|debug\|env\|even\|file\|float\|hidden\|int\|number\|odd\|quotation\|string\|symlink\)\?;
syntax match            minimDefaultSymbol    ;\<\(call\|dprint\|print\|put\)\!\>;
syntax match            minimDefaultSymbol    ;\<contains\>;


"! != $ & ' * + - -> . .. / : < <= == => =~ > >= @ 
syntax match            minimDefaultSigil     ;[:'~!$%&$@=<>*]; contained

syntax keyword          minimCommentTodo      TODO FIXME XXX TBD contained
syntax match            minimComment          /;.*$/ contains=minimCommentTodo

syntax match            minimNumber           /\<-\=\d\+L\=\>\|\<0[xX]\x\+\>/

syntax region           minimString           start=+"+ skip=+\\\\\|\\$"+  end=+"+  
syntax region           minimSigilSymbol      start=;[:'~!$%&$@=<>*]; end=;)\|(\|\s\|\n;me=e-1 contains=minimDefaultSigil  
syntax region           minimQuotedSymbol     start=;[']; end=;)\|(\|\s\|\n;me=e-1 

syntax match            minimSymbol           ;[a-zA-Z_][a-zA-Z0-9_-]*;
syntax match            minimParen            ;(\|); 



" Highlighting
hi default link         minimComment          Comment
hi default link         minimCommentTodo      Todo
hi default link         minimString           String
hi default link         minimNumber           Number
hi default link         minimDefaultSymbol    Statement
hi default link         minimSigilSymbol      Special
hi default link         minimSymbol           Function
hi default link         minimDefaultSigil     Special
hi default link         minimQuotedSymbol     Constant
hi default link         minimParen            Delimiter

let b:current_syntax = "minim"
