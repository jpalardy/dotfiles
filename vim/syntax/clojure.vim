" Vim syntax file
" Language:	   Clojure
" Last Change: 2008-05-14
" Maintainer:  Toralf Wittner <toralf.wittner@gmail.com>

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

setl iskeyword+=?,-,*,!,+,/,=,<,>

syn match clojureComment ";.*$"
syn match clojureKeyword ":\a[a-zA-Z0-9?!\-_+*\./=<>]*"
syn region clojureString start=/"/ end=/"/ skip=/\\"/
syn match clojureCharacter "\\."
syn match clojureCharacter "\\[0-7]\{3\}"
syn match clojureCharacter "\\u[0-9]\{4\}"
syn match clojureCharacter "\\space"
syn match clojureCharacter "\\tab"
syn match clojureCharacter "\\newline"
syn match clojureCharacter "\\backspace"
syn match clojureCharacter "\\formfeed"

syn match clojureNumber "\<-\?[0-9]\+\>"
syn match clojureRational "\<-\?[0-9]\+/[0-9]\+\>"
syn match clojureFloat "\<-\?[0-9]\+\.[0-9]\+\([eE][-+]\=[0-9]\+\)\=\>"

syn keyword clojureSyntax fn fn* if def let let* loop* new recur loop do quote the-var identical? throw set! monitor-enter monitor-exit try catch finally in-ns
syn match clojureSyntax "(\s*\(\.\.\|\.\)"hs=s+1

syn region clojureDef matchgroup=clojureSyntax start="(\s*\(defmethod\|defmulti\|defmacro\|defstruct\|defn\|def\)\(\s\|\n\)\+"hs=s+1 end="\ze[\[('":)]\|\ze\(#^\)\@<!{" contains=ALLBUT,clojureFunc
syn match clojureDefName "\<[^0-9][a-zA-Z0-9\?!\-\+\*\./<>=]*\>" contained

syn region clojureVector matchgroup=Delimiter start="\[" matchgroup=Delimiter end="\]" contains=ALLBUT,clojureDefName
syn region clojureMap matchgroup=Delimiter start="{" matchgroup=Delimiter end="}" contains=ALLBUT,clojureDefName

syn match clojureNil "\<nil\>"
syn match clojureQuote "\('\|`\)"
syn match clojureUnquote "\(\~@\|\~\)"
syn match clojureDispatch "\(#^\|#'\)"
syn match clojureAnonFn "#\ze("
syn match clojurePattern /#\ze"/
syn match clojureSet "#\ze{"
syn match clojureVarArg "&" containedin=clojureVector
syn keyword clojureBoolean true false

highlight link clojureComment Comment
highlight link clojureString String
highlight link clojureCharacter Character
highlight link clojureNumber Number
highlight link clojureFloat Number
highlight link clojureRational Number
highlight link clojureKeyword PreProc
highlight link clojureSyntax Statement
highlight link clojureDefName Function
highlight link clojureNil Constant
highlight link clojureQuote Macro
highlight link clojureAnonFn Macro
highlight link clojurePattern Macro
highlight link clojureSet Macro
highlight link clojureUnquote Delimiter
highlight link clojureDispatch Constant
highlight link clojureVarArg Number
highlight link clojureBoolean Constant

if exists("g:clj_highlight_builtins")
    "Highlight Clojure's predefined functions"
    syn keyword clojureFunc ! * *agent* *command-line-args* *in* *macro-meta* *ns* *out* *print-meta* *print-readably* *proxy-classes* *warn-on-reflection* + - -> .. / < <= = == > >= accessor agent agent-errors aget alength all-ns alter and apply array-map aset aset-boolean aset-byte aset-char aset-double aset-float aset-int aset-long aset-short assert assoc await await-for bean binding bit-and bit-not bit-or bit-shift-left bit-shift-right bit-xor boolean butlast byte cast char class clear-agent-errors comment commute comp comparator complement concat cond conj cons constantly construct-proxy contains? count create-ns create-struct cycle dec defmacro defmethod defmulti defn defn- defstruct deref destructure disj dissoc distinct doall doc dorun doseq dosync dotimes doto double drop drop-while ensure eval every? false? ffirst file-seq filter find find-doc find-ns find-var first float flush fnseq for frest gensym get get-proxy-class hash-map hash-set identity if-let import inc instance? int interleave into into-array iterate key keys keyword keyword? last lazy-cat lazy-cons line-seq list list* load load-file locking long macroexpand macroexpand-1 make-array map map? mapcat max max-key memfn merge merge-with meta min min-key name namespace neg? newline nil? not not-any? not-every? not= ns-imports ns-interns ns-map ns-name ns-publics ns-refers ns-resolve ns-unmap nth nthrest or partial peek pmap pop pos? pr pr-str print print-doc print-str println println-str prn prn-str proxy proxy-mappings quot rand rand-int range re-find re-groups re-matcher re-matches re-pattern re-seq read read-line reduce ref ref-set refer rem remove-method remove-ns repeat replace replicate require resolve rest resultset-seq reverse rfirst rrest rseq scan second select-keys send send-off seq seq? set short slurp some sort sort-by sorted-map sorted-map-by sorted-set special-symbol? split-at split-with str string? struct struct-map subs subvec symbol symbol? sync take take-nth take-while test time to-array to-array-2d touch tree-seq true? update-proxy val vals var-get var-set var? vector vector? when when-first when-let when-not with-local-vars with-meta with-open with-out-str xml-seq zero? zipmap repeatedly add-classpath vec hash
    highlight link clojureFunc Special
endif

let b:current_syntax = "clojure"

