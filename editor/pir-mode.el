;;; pir-mode.el --- pir-mode.el --- editing IMCC source files under Emacs

;;; Commentary:

;; This package provides Emacs support for PIR.
;; It defines PIR mode, a major mode for editing PIR code.

;; See the documentation of `octave-mode' and `octave-help' for further
;; information. 

(require 'regexp-opt)
;;; Code:
(add-to-list 'auto-mode-alist '("\\.imc\\'" . pir-mode))

(defvar pir-mode-hook nil)

(defgroup pir nil
  "Mode for editing PIR code."
  :group 'languages)

(defcustom pir-comment-char ?#
  "*The `comment-start' character assumed by PIR mode."
  :type 'character
  :group 'pir)

(defcustom pir-comment-column comment-column
  "*The default comment column for PIR code."
  :type 'integer
  :group 'pir)
  
(defvar pir-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map "\C-c;"     'pir-comment-region)
    (define-key map "\C-c:"     'pir-uncomment-region)
    (define-key map (kbd "C-j") 'newline-and-indent)
    (define-key map " "         'pir-electric-space)
    (define-key map (kbd ":")   'pir-electric-colon)
    (define-key map (kbd "RET") 'pir-reindent-then-newline-and-indent)
    (define-key map (kbd "TAB") 'indent-according-to-mode)
    (define-key map "\e\t"      'pir-complete-symbol)
    (define-key map "\M-\C-a"   'pir-beginning-of-defun)
    (define-key map "\M-\C-e"   'pir-end-of-defun)
    (define-key map "\M-\C-h"   'pir-end-of-defun)
    (define-key map "\M-\C-q"   'pir-indent-defun)
    (define-key map "\C-c\C-p" 'pir-previous-code-line)
    (define-key map "\C-c\C-n" 'pir-next-code-line)
    (define-key map "\C-c\C-a" 'pir-beginning-of-line)
    (define-key map "\C-c\C-e" 'pir-end-of-line)
    (define-key map "\C-c\M-\C-n" 'pir-forward-block)
    (define-key map "\C-c\M-\C-p" 'pir-backward-block)
    (define-key map "\C-c\M-\C-u" 'pir-backward-up-block)
    (define-key map "\C-c\M-\C-d" 'pir-down-block)
    (define-key map "\C-c\M-\C-h" 'pir-mark-block)
    (define-key map "\C-c]" 'pir-close-block)
    (define-key map "\C-c\C-f" 'pir-insert-defun)
    
    map)
  "Keymap for PIR major mode.")

(defvar pir-mode-menu
  (list "PIR"
	(list "Lines"
	      ["Previous Code Line"	pir-previous-code-line t]
	      ["Next Code Line"		pir-next-code-line t]
	      ["Begin of Continuation"	pir-beginning-of-line t]
	      ["End of Continuation"	pir-end-of-line t]
	      ["Split Line at Point"	pir-indent-new-comment-line t])
	(list "Blocks"
	      ["Next Block"		pir-forward-block t]
	      ["Previous Block"		pir-backward-block t]
	      ["Down Block"		pir-down-block t]
	      ["Up Block"		pir-backward-up-block t]
	      ["Mark Block"		pir-mark-block t]
	      ["Close Block"		pir-close-block t])
	(list "Functions"
	      ["Begin of Function"	pir-beginning-of-defun t]
	      ["End of Function"	pir-end-of-defun t]
	      ["Mark Function"		pir-mark-defun t]
	      ["Indent Function"	pir-indent-defun t]
	      ["Insert Function"	pir-insert-defun t])
	"-"
	["Indent Line"			indent-according-to-mode t]
	["Complete Symbol"		pir-complete-symbol t]
	"-"
	["Toggle Abbrev Mode"		abbrev-mode t]
	"-"
	["Describe PIR Mode"		pir-describe-major-mode t])
  "Menu for PIR mode.")


(defvar pir-mode-syntax-table nil
  "Syntax table for PIR major mode.")
(setq   pir-mode-syntax-table
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?_  "w"  st)
    (modify-syntax-entry ?\\ "\\" st)
    (modify-syntax-entry ?#  "<"  st)
    (modify-syntax-entry ?\n ">"  st)
    (modify-syntax-entry ?$  "'" st)
    (modify-syntax-entry ?,  "."  st)
    (modify-syntax-entry ?.  ". p"  st)
    st))

(defvar pir-PMC-keyword-symbols
  '("Array" "Boolean" "Compiler" "Continuation" "Coroutine" "CSub"
    "Eval" "IntList" "Iterator" "Key" "ManagedStruct" "MultiArray"
    "NCI" "PerlArray" "PerlHash" "PerlInt" "PerlNum" "PerlString"
    "PerlUndef" "Pointer" "Scratchpad" "Sub" "UnManagedStruct"))

(defvar pir-ops
  '("call" "goto" "if" "unless" "global" "clone" "addr"
    "band" "bands" "bnot" "bnots" "bor" "bors" "shl" "shr" "lsr" "bxor" "bxors"
    "eq" "eq_str" "eq_num" "eq_addr" "isnull" "ne" "ne_str" "ne_num"
    "ne_addr" "lt" "lt_str" "lt_num" "le" "le_str" "le_num" "gt" "gt_str"
    "gt_num" "ge" "ge_str" "ge_num" "cmp" "cmp_str" "cmp_num" "and" "not" "or"
    "xor" "end" "noop" "cpu_ret" "check_events" "check_events__"
    "wrapper__" "prederef__" "reserved" "load_bytecode" "branch"
    "branch_cs" "bsr" "ret" "jsr" "jump" "enternative" "if" "unless" "invoke"
    "invokecc" "updatecc" "set_addr" "get_addr" "newsub" "set_eh"
    "clear_eh" "throw" "rethrow" "die_hard" "exit" "debug" "bounds"
    "profile" "trace" "gc_debug" "interpinfo" "warningson"
    "warningsoff" "errorson" "errorsoff" "runinterp" "getinterp"
    "setline" "getline" "setfile" "getfile" "setpackage" "getpackage"
    "sweep" "collect" "sweepoff" "sweepon" "collectoff" "collecton"
    "needs_destroy" "foldup" "loadlib" "dlfunc" "dlvar" "compile"
    "compreg" "bogus" "new_callback" "debug_init" "debug_load"
    "debug_break" "debug_print" "die" "conv_i1" "conv_i1_ovf" "conv_u1"
    "conv_u1_ovf" "conv_i2" "conv_i2_ovf" "conv_u2" "conv_u2_ovf"
    "conv_i4" "conv_u4" "conv_i8" "conv_r4" "conv_r8" "gcd" "issame"
    "isntsame" "istrue" "isgt" "isge" "isle" "islt" "iseq" "isne" "rand"
    "srand" "close" "fdopen" "getfd" "getstdin" "getstdout" "getstderr"
    "pioctl" "open" "print" "write" "printerr" "read" "readline" "peek"
    "stat" "seek" "tell" "socket" "sockaddr" "connect" "recv" "send" "poll"
    "abs" "add" "cmod" "dec" "div" "fdiv" "ceil" "floor" "inc" "mod" "mul" "neg"
    "pow" "sub" "sqrt" "acos" "asec" "asin" "atan" "cos" "cosh" "exp" "ln" "log10"
    "log2" "sec" "sech" "sin" "sinh" "tan" "tanh" "lcm" "fact" "callmethod"
    "callmethodcc" "fetchmethod" "can" "does" "isa" "newclass" "subclass"
    "findclass" "getclass" "singleton" "class" "classname" "addparent"
    "removeparent" "addattribute" "getattribute" "setattribute"
    "classoffset" "covers" "exsec" "hav" "vers" "new" "morph" "typeof"
    "find_type" "valid_type" "find_method" "defined" "exists" "delete"
    "elements" "push" "pop" "unshift" "shift" "splice" "setprop" "getprop"
    "delprop" "prophash" "freeze" "thaw" "mmdvtregister" "mmdvtfind"
    "register" "unregister" "print_item" "print_newline" "rx_compile"
    "rx_pushindex" "rx_initstack" "rx_clearstack" "rx_pushmark"
    "rx_popindex" "rx_advance" "rx_literal" "rx_char" "rx_is_w"
    "rx_is_d" "rx_is_s" "rx_oneof" "rx_oneof_bmp" "rx_dot"
    "rx_zwa_boundary" "rx_zwa_atend" "rx_search" "rx_search_char"
    "rx_literal_all" "rx_char_all" "rx_oneof_bmp_all" "rx_makebmp"
    "clone" "exchange" "set" "assign" "setref" "deref" "setp_ind"
    "setn_ind" "sets_ind" "seti_ind" "slice" "iter" "null" "cleari"
    "clearn" "clears" "clearp" "popi" "popn" "pops" "popp" "popbottomi"
    "popbottomn" "popbottoms" "popbottomp" "poptopi" "poptopn"
    "poptops" "poptopp" "pushi" "pushn" "pushs" "pushp" "pushtopi"
    "pushtopn" "pushtops" "pushtopp" "pushbottomi" "pushbottomn"
    "pushbottoms" "pushbottomp" "saveall" "restoreall" "savetop"
    "restoretop" "entrytype" "depth" "lookback" "save" "savec" "restore"
    "rotate_up" "intsave" "intrestore" "intdepth" "ord" "chr" "chopn"
    "concat" "repeat" "length" "pin" "unpin" "substr" "substr_r" "index"
    "pack" "sprintf" "find_encoding" "stringinfo" "upcase" "downcase"
    "titlecase" "join" "split" "spawnw" "exec" "err" "time" "gmtime"
    "localtime" "decodetime" "decodelocaltime" "sysinfo" "sleep"
    "sizeof" "new_pad" "push_pad" "pop_pad" "peek_pad" "store_lex"
    "find_lex" "store_global" "find_global"))

(defvar pir-mode-abbrev-table nil
  "Abbrev table used when in PIR mode.")

(defvar pir-completion-alist nil
  "Completion table used for PIR mode.")

(defvar pir-type-keywords
  '("int" "float" "string" "pmc" "object"))

(defvar pir-register-regexp "[INPS]\\([12][0-9]\\|3[01]\\|[0-9]\\)")
(defvar pir-dollar-register-regexp "\\$[INPS][0-9]+")

(defvar pir-directives)
(setq pir-directives
      '("method" "non_prototyped" "prototyped" "@LOAD" "@MAIN"))

(defvar pir-dotted-directives)
(setq pir-dotted-directives
  '(".sub" ".pcc_sub" ".end" ".emit" ".eom" ".const" ".namespace"
    ".endnamespace" ".result" ".arg" ".return" ".include"
    ".pcc_begin" ".pcc_end" ".pcc_begin_return" ".pcc_end_return"
    ".pcc_begin_yield" ".pcc_end_yield"))

(defvar pir-variable-declarations)
(setq pir-variable-declarations
      '(".local" ".sym" ".param"))

(defvar pir-begin-keywords)
(setq pir-begin-keywords
  '(".sub" ".emit" ".pcc_begin_yield" ".pcc_begin_return"
    ".pcc_begin" ".namespace"))

(defvar pir-end-keywords)
(setq pir-end-keywords
  '(".end" ".eom" ".pcc_end_yield" ".pcc_end_return"
    ".pcc_end" ".endnamespace"))

(defvar pir-block-match-alist)
(setq   pir-block-match-alist
  '((".sub" ".end" 1)
    (".emit" ".eom" 1)
    (".pcc_begin_yield" ".pcc_end_yield" 0)
    (".pcc_begin_return" ".pcc_end_return" 0)
    (".pcc_begin" ".pcc_end" 0)
    (".namespace" ".endnamespace" 0)))
;  "Alist with IMCC's matching block keywords.
;Has IMCC's begin keywords as keys and a list of the matching end keywords as
;associated values.")

(defvar pir-block-offset-alist)
(setq pir-block-offset-alist
      (mapcan (lambda (blockspec)
		(let ((offset (caddr blockspec)))
		  `((,(car blockspec) . ,offset)
		    (,(cadr blockspec) . ,offset))))
	      pir-block-match-alist))

(defvar pir-open-directives)
(setq pir-open-directives
  (mapcar #'car pir-block-match-alist))

(defvar pir-close-directives)
(setq pir-close-directives
  (mapcar #'cadr pir-block-match-alist))

(defvar pir-block-begin-regexp)
(setq pir-block-begin-regexp
      (regexp-opt pir-begin-keywords 'paren))
(defvar pir-block-end-regexp)
(setq pir-block-end-regexp
  (regexp-opt pir-end-keywords 'paren))
(defvar pir-block-begin-or-end-regexp)
(setq pir-block-begin-or-end-regexp
   (concat "\\(?:"pir-block-begin-regexp "\\|"
	          pir-block-end-regexp "\\)"))

(defvar pir-function-header-regexp)
(setq pir-function-header-regexp
  "\\.\\(.sub\\)\\s-+\\(\\sw+\\)")
;  "Regexp to match a PIR function header.")


(defvar pir-font-lock-keywords)
(setq pir-font-lock-keywords
      `((,(concat "^\\s *\\(.sub\\)\\s +\\(\\sw+\\)"
		  "\\(\\s +" (regexp-opt pir-directives 'paren) "\\)?")
	 (1 font-lock-keyword-face)
	 (2 font-lock-function-name-face t t)
	 (4 font-lock-keyword-face t t))
	(,(concat "\\s-*" (regexp-opt pir-variable-declarations 'paren)
		  "\\(?:\\s +" (regexp-opt pir-type-keywords 'paren)
		  "\\(?:\\s +\\(\\sw+\\)\\)?\\)?")
	 (1 font-lock-keyword-face)
	 (2 font-lock-type-face nil t)
	 (3 font-lock-variable-name-face nil t))
	(,(concat "^\\s *\\(.const\\)\\s +"
		  (regexp-opt pir-type-keywords 'paren)
		  "\\(\\s +\\(\\sw+\\)\\)?")
	 (1 font-lock-keyword-face)
	 (2 font-lock-type-face nil t)
	 (4 font-lock-constant-face nil t))
	(,pir-block-begin-or-end-regexp . font-lock-keyword-face)
	  
	(,pir-dollar-register-regexp . font-lock-variable-name-face)
	(,pir-register-regexp . font-lock-variable-name-face)
	(,(regexp-opt pir-dotted-directives 'paren) . font-lock-keyword-face)
	(,(regexp-opt pir-ops 'words) . font-lock-keyword-face)
	("\\s-*\\(\\sw+\\)\\s=*"
	 (1 font-lock-variable-name-face))
	))

(defcustom pir-auto-indent-flag nil
  "*Non-nil means indent line after a semicolon or space in PIR mode."
  :type 'boolean
  :group 'pir)

(defcustom pir-blink-matching-block t
  "*Control the blinkin of matching PIR block keywords.
Non-nil means show matching begin of block when inserting a space,
newline or semicolon after an end keyword."
  :type 'boolean
  :group 'pir)

(defcustom pir-basic-indent 8
  "*Extra indentation applied to statements in PIR block structures."
  :type 'integer
  :group 'pir)

(defvar pir-imenu-generic-expression
  (list
   (list nil pir-function-header-regexp 2))
  "Imenu expression for PIR mode.  See `imenu-generic-expression'.")
  
(defun pir-comment ()
  "Convert an empty comment to a `larger' kind, or start a new one.
These are the known comment classes:

   1 -- comment to the right of the code (at the `comment-column')
   2 -- comment on its own line, indented like code
   3 -- comment on its own line, beginning at the left-most column.

Suggested usage: while writing your code, trigger asm-comment
repeatedly until you are satisfied with the kind of comment."
  (interactive)
  (comment-normalize-vars)
  (let (comempty comment)
    (save-excursion
      (beginning-of-line)
      (setq comment (comment-search-forward (line-end-position) t))
      (setq comempty (looking-at "[ \t]*$")))

    (cond

     ;; Blank line, start comment at code indent level.
     ((save-excursion (beginning-of-line) (looking-at "^[ \t]*$"))
      (indent-according-to-mode)
      (insert pir-comment-char pir-comment-char ?\ ))

     ;; Nonblank line w/o comment => start a comment at comment-column
     ;; Also: point before the comment => jump inside.
     ((or (null comment) (< (point) comment))
      (indent-for-comment))

     ;; Empty code-level comment => upgrade to next comment level.
     ((save-excursion (goto-char comment) (skip-chars-backward " \t") (bolp))
      (goto-char comment)
      (insert pir-comment-char)
      (indent-for-comment))

     ;; Empty comment ends non-empty code line => new comment above.
     (t
      (goto-char comment)
      (skip-chars-backward " \t")
      (delete-region (point) (line-end-position))
      (beginning-of-line) (insert "\n") (backward-char)
      (pir-comment)))))

(defun pir-electric-colon ()
  "Automatically indent labels as soon as the colon is added."
  (interactive)
  (let ((labelp nil))
    (save-excursion
      (skip-syntax-backward "w_")
      (skip-syntax-backward " ")
      (if (setq labelp (bolp)) (delete-horizontal-space)))
    (call-interactively 'self-insert-command)
    (when labelp
      (delete-horizontal-space)
      (tab-to-tab-stop))))

(defmacro setlocalq (sym val)
  "Localize SYM and set it to the value of VAL."
  `(set (make-local-variable (quote ,sym)) ,val))

(defun pir-mode ()
  "Major mode for editing PIR files.

This mode makes it easier to write PIR code by helping with
indentation, doing some of the typing for you (with Abbrev mode) and by
showing keywords, comments, strings etc. in different faces (with Font
Lock mode on terminals that support it).

PIR (Parrot Intermediate Representation) is a friendlier way of
programming parrot than raw PASM (Parrot Assembly). In general,
compilers (and certainly humans) should code in PIR and let Parrot
handle register allocation and all that good stuff.

To find out more, hie thee to `http://www.parrotcode.org/'.

Type \\[list-abbrevs] to display the built in abbrevs for PIR
keywords. (When I've set them up.)

Keybindings
===========
\\{octave-mode-map}

Variables you can use to customize PIR mode
===========================================

pir-auto-indent
  Non-nil means indent current line after a space.
  Default is nil.

pir-blink-matching-block
  Non-nil means show matching begin of block when inserting a space or
  newline after the end of a block.  Default is t.

pir-basic-indent
  PIR mode's basic level of indentation. Default is 8.

Turning on PIR mode runs the hook `pir-mode-hook'.

To begin using this mode for all `.imc' files that you edit, add the
following lines to your `.emacs' file:

  (autoload 'pir-mode \"pir-mode\" nil t)
  (setq auto-mode-alist
        (cons '(\"\\\\.imc$\" . pir-mode) auto-mode-alist))

If you have any problems with this, you're on your own. You could always
try asking on perl6-internals@perl.org."
  (interactive)
  (kill-all-local-variables)
  (use-local-map pir-mode-map)
  (setq major-mode 'pir-mode)
  (setq mode-name "PIR")
  
  (set-syntax-table pir-mode-syntax-table)
  
  (setlocalq font-lock-defaults '(pir-font-lock-keywords))
  (setlocalq indent-line-function 'pir-indent-line)
  (setlocalq pir-mode-basic-indent 'pir-mode-basic-indent)
  (setlocalq require-final-newline t)
  
  (setlocalq comment-start "# ")
  (setlocalq comment-end "")
  (setlocalq comment-column pir-comment-column)
  (setlocalq comment-start-skip "#+ *")
  (setlocalq comment-indent-function 'pir-comment-indent)

  (setlocalq parse-sexp-ignore-comments t)
  (setlocalq paragraph-start (concat "\\s-*$\\|" page-delimiter))
  (setlocalq paragraph-separate paragraph-start)
  (setlocalq paragraph-ignore-fill-prefix t)
  (setlocalq fill-paragraph-function 'pir-fill-paragraph)
  (setlocalq adaptive-fill-regexp nil)
  (setlocalq fill-column 72)
  
  (setlocalq font-lock-defaults '(pir-font-lock-keywords))

  (setlocalq imenu-generic-expression pir-imenu-generic-expression)
  (setq      imenu-case-fold-search nil)

  (setlocalq defun-prompt-regexp "^\\s_*\\.\\(sub\\|emit\\)\\s_+")

  (pir-initialize-completions)
  (pir-add-pir-menu)
  
  (run-hooks 'pir-mode-hook))

(defun pir-describe-major-mode ()
  "Describe the current major mode."
  (interactive)
  (describe-function major-mode))

(defsubst pir-in-comment-p ()
  "Return t if point is inside a PIR comment, nil otherwise."
  (interactive)
  (save-excursion
    (nth 4 (parse-partial-sexp (line-beginning-position) (point)))))

(defsubst pir-in-string-p ()
  "Return t if point is inside a PIR string, nil otherwise."
  (interactive)
  (save-excursion
    (nth 3 (parse-partial-sexp (line-beginning-position) (point)))))

(defsubst pir-not-in-string-or-comment-p ()
  "Return t iff point is not inside a PIR string or comment."
  (let ((pps (parse-partial-sexp (line-beginning-position) (point))))
    (not (or (nth 3 pps) (nth 4 pps)))))

(defun pir-in-block-p ()
  "Return t if point is inside a PIR block, nil otherwise.
The block is taken to start at the first letter of the begin keyword and
to end after the end keyword."
  (let ((pos (point)))
    (save-excursion
      (condition-case nil
	  (progn
	    (skip-syntax-forward "w")
	    (pir-up-block -1)
	    (pir-forward-block)
	    t)
	(error nil))
      (< pos (point)))))

(defun pir-in-defun-p ()
  "Return t iff point is inside a PIR function declaration.
The function is taken to start at the `.' of `.sub' and to end after
the `.end' keyword."
  (let ((pos (point)))
    (save-excursion
      (or (and (looking-at "\\<.sub\\>")
	       (pir-not-in-string-or-comment-p))
	  (and (pir-beginning-of-defun)
	       (condition-case nil
		   (progn
		     (pir-forward-block)
		     t)
		 (error nil))
	       (< pos (point)))))))


;;; Comments
(defun pir-comment-region (beg end &optional arg)
  "Comment or uncomment each line in the region as PIR code.
See `comment-region'."
  (interactive "r\nP")
  (let ((comment-start (char-to-string pir-comment-char)))
    (comment-region beg end arg)))

(defun pir-uncomment-region (beg end &optional arg)
  "Uncomment each line in the region as PIR code."
  (interactive "r\nP")
  (or arg (setq arg1))
  (octave-comment-region beg end (- arg)))


;;; Indentation
(defun calculate-pir-indent (&optional ignore-labelp)
  "Calculate the correct indentation for a line of PIR code.
Optional argument IGNORE-LABELP if set, labels are ignored for the purposes of calculating the indent."
  (let ((icol 0))
    (save-excursion
      (beginning-of-line)
      (cond ((condition-case nil
		 (progn (up-list -1)
			t)
	       (error nil))
	     (setq icol (1+ (current-column))))
	    ((and (not ignore-labelp)
		  (looking-at "\\s-*\\sw+:"))
	     (setq icol 0))
	    ((zerop (pir-previous-code-line))
	     (let ((labelp (looking-at "\\s-*\\sw+:")))
	       (pir-beginning-of-line)
	       (back-to-indentation)
	       (setq icol (current-column))
	       (let ((bot (point))
		     (eol (line-end-position)))
		 (while (< (point) eol)
		   (if (pir-not-in-string-or-comment-p)
		       (cond
			((looking-at pir-block-begin-regexp)
			 (setq icol (+ icol
				       (pir-block-offset (match-string 1)))))
			((looking-at pir-block-end-regexp)
			 (if (not (= bot (point)))
			     (setq icol (- icol
					   (pir-block-offset
					    (match-string 1))))))))
		   (forward-char))
		 (if (and labelp
			  (= 0 icol))
		     (setq icol (calculate-pir-indent 'ignore-label)))
		 )))))
    (save-excursion
	(back-to-indentation)
	(cond
	 ((and (looking-at pir-block-end-regexp)
	       (pir-not-in-string-or-comment-p))
	  (looking-at pir-block-end-regexp)
	  (setq icol (- icol (pir-block-offset (match-string 1)))))
	 ((or (looking-at "\\s<\\s<\\s<\\S<")
	      (pir-before-magic-comment-p))
	  (setq icol (list 0 icol)))
	 ((looking-at "\\s\\S<")
	  (setq icol (list comment-column icol)))))
      icol))

(defun pir-block-offset (string)
  (* pir-basic-indent
     (cdr (assoc string pir-block-offset-alist))))

(defun pir-before-magic-comment-p ()
  "Return t if point is before the shebang."
  (save-excursion
    (beginning-of-line)
    (and (bobp) (looking-at "\\s-*#!"))))

(defun pir-comment-indent ()
  "Calculate the correct comment indent."
  (if (or (looking-at "\\s<\\s<\\s<")
	  (pir-before-magic-comment-p))
      0
    (if (looking-at "\\<\\<")
	(calculate-pir-indent)
      (skip-syntax-backward " ")
      (max (if (bolp) 0 (1+ (current-column)))
	   comment-column))))

(defun pir-indent-for-comment ()
  "Maybe insert and indent a PIR comment.
If there is no comment already on this line, create a code-level comment
\(started by two comment characters) if the line is empty, or an in-line
comment (started by one comment character) otherwise.
Point is left after the start of the comment which is properly aligned."
  (interactive)
  (indent-for-comment)
  (indent-according-to-mode))

(defun pir-indent-line (&optional arg)
  "Indent current line as PIR code.
With optional ARG, use this as offset unless this line is a comment with
fixed goal column."
  (interactive)
  (or arg (setq arg 0))
  (let ((icol (calculate-pir-indent))
	(relpos (- (current-column) (current-indentation))))
    (if (listp icol)
	(setq icol (car icol))
      (setq icol (+ icol arg)))
    (if (< icol 0)
	(error "Unmatched end keyword")
      (indent-line-to icol)
      (if (> relpos 0)
	  (move-to-column (+ icol relpos))))))

(defun pir-indent-new-comment-line ()
  "Break PIR line at point, continuing comment if within one.
If within code, insert `pir-continuation-string' before breaking the
line.  If within a string, signal an error.
The new line is properly indented."
  (interactive)
  (delete-horizontal-space)
  (cond
   ((pir-in-comment-p)
    (indent-new-comment-line))
   (t
    (error "Don't know how to split this code line"))))

(defun pir-indent-defun ()
  "Properly indent the PIR function which contains point."
  (interactive)
  (save-excursion
    (pir-mark-defun)
    (message "Indenting function...")
    (indent-region (point) (mark) nil))
  (message "Indenting function...done."))


;;; Motion
(defun pir-next-code-line (&optional arg)
  "Move ARG lines of PIR code forward (backward if ARG is negative).
Skips past all empty and comment lines.  Default for ARG is 1.

On success, return 0.  Otherwise, go as far as possible and return -1."
  (interactive "p")
  (or arg (setq arg 1))
  (beginning-of-line)
  (let ((n 0)
	(inc (if (> arg 0) 1 -1)))
    (while (and (/= arg 0) (= n 0))
      (setq n (forward-line inc))
      (while (and (= n 0)
		  (looking-at "\\s-*\\($\\|\\s<\\)"))
	(setq n (forward-line inc)))
      (setq arg (- arg inc)))
    n))

(defun pir-previous-code-line (&optional arg)
  "Move ARG lines of PIR code backward (forward if ARG is negative).
Skips past all empty and comment lines.  Default for ARG is 1.

On success, return 0.  Otherwise, go as far as possible and return -1."
  (interactive "p")
  (or arg (setq arg 1))
  (pir-next-code-line (- arg)))

(defun pir-beginning-of-line ()
  "Move point to beginning of current PIR line.
If on an empty or comment line, go to the beginning of that line."
  (interactive)
  (beginning-of-line)
  (if (not (looking-at "\\s-*\\($\\|\\s<\\)"))
      (while (or (condition-case nil
		     (progn
		       (up-list -1)
		       (beginning-of-line)
		       t)
		   (error nil))
		 (and (looking-at "\\s-*\\($\\|\\s<\\)")
		      (zerop (forward-line -1)))))))

(defun pir-end-of-line ()
  "Move point to end of current PIR line.
If on an empty or comment line, go to the end of that line.
Otherwise, move forward to the end of the first PIR code line which
does not end in `...' or `\\' or is inside an open parenthesis list."
  (interactive)
  (end-of-line)
  (if (save-excursion
	(beginning-of-line)
	(looking-at "\\s-*\\($\\|\\s<\\)"))
      ()
    (while (or (condition-case nil
		   (progn
		     (up-list 1)
		     (end-of-line)
		     t)
		 (error nil))
	       (and (save-excursion
		      (beginning-of-line)
		      (looking-at "\\s-*\\($\\|\\s<\\)"))
		    (zerop (forward-line 1)))))
    (end-of-line)))

(defun pir-scan-blocks (from count depth)
  "Scan from character number FROM by COUNT PIR begin-end blocks.
Returns the character number of the position thus found.

If DEPTH is nonzero, block depth begins counting from that value.
Only places where the depth in blocks becomes zero are candidates for
stopping; COUNT such places are counted.

If the beginning or end of the buffer is reached and the depth is wrong,
an error is signaled."
  (let ((min-depth (if (> depth 0) 0 depth))
	(inc (if (> count 0) 1 -1)))
    (save-excursion
      (while (/= count 0)
	(catch 'foo
	  (while (or (re-search-forward
		      pir-block-begin-or-end-regexp nil 'move inc)
		     (if (/= depth 0)
			 (error "Unbalanced block")))
	    (if (pir-not-in-string-or-comment-p)
		(progn
		  (cond
		   ((match-end 1)
		    (setq depth (+ depth inc)))
		   ((match-end 2)
		    (setq depth (- depth inc))))
		  (if (< depth min-depth)
		      (error "Containing expression ends prematurely"))
		  (if (= depth 0)
		      (throw 'foo nil))))))
	(setq count (- count inc)))
      (point))))

(defun pir-forward-block (&optional arg)
  "Move forward across one balanced PIR begin-end block.
With argument, do it that many times.
Negative arg -ARG means move backward across ARG blocks."
  (interactive "p")
  (or arg (setq arg 1))
  (goto-char (or (pir-scan-blocks (point) arg 0) (buffer-end arg))))

(defun pir-backward-block (&optional arg)
  "Move backward across one balanced PIR begin-end block.
With argument, do it that many times.
Negative arg -ARG means move forward across ARG blocks."
  (interactive "p")
  (or arg (setq arg 1))
  (pir-forward-block (- arg)))

(defun pir-down-block (arg)
  "Move forward down one begin-end block level of PIR code.
With ARG, do this that many times.
A negative ARG means move backward but still go down a level.
In Lisp programs, an argument is required."
  (interactive "p")
  (let ((inc (if (> arg 0) 1 -1)))
    (while (/= arg 0)
      (goto-char (or (pir-scan-blocks (point) inc -1)
		     (buffer-end arg)))
      (setq arg (- arg inc)))))

(defun pir-backward-up-block (arg)
  "Move backward out of one begin-end block level of PIR code.
With ARG, do this that many times.
A negative ARG means move forward but still to a less deep spot.
In Lisp programs, an argument is required."
  (interactive "p")
  (pir-up-block (- arg)))

(defun pir-up-block (arg)
  "Move forward out of one begin-end block level of PIR code.
With ARG, do this that many times.
A negative ARG means move backward but still to a less deep spot.
In Lisp programs, an argument is required."
  (interactive "p")
  (let ((inc (if (> arg 0) 1 -1)))
    (while (/= arg 0)
      (goto-char (or (pir-scan-blocks (point) inc 1)
		     (buffer-end arg)))
      (setq arg (- arg inc)))))

(defun pir-mark-block ()
  "Put point at the beginning of this PIR block, mark at the end.
The block marked is the one that contains point or follows point."
  (interactive)
  (let ((pos (point)))
    (if (or (and (pir-in-block-p)
		 (skip-syntax-forward "w"))
	    (condition-case nil
		(progn
		  (pir-down-block 1)
		  (pir-in-block-p))
	      (error nil)))
	(progn
	  (pir-up-block -1)
	  (push-mark (point))
	  (pir-forward-block)
	  (exchange-point-and-mark))
      (goto-char pos)
      (message "No block to mark found"))))

(defun pir-close-block ()
  "Close the current PIR block on a separate line.
An error is signaled if no block to close is found."
  (interactive)
  (let (bb-keyword)
    (condition-case nil
	(progn
	  (save-excursion
	    (pir-backward-up-block 1)
	    (setq bb-keyword (buffer-substring-no-properties
			      (match-beginning 1) (match-end 1))))
	  (if (save-excursion
		(beginning-of-line)
		(looking-at "^\\s-*$"))
	      (indent-according-to-mode)
	    (pir-reindent-then-newline-and-indent))
	  (insert (cadr (assoc bb-keyword
			       pir-block-match-alist)))
	  (pir-reindent-then-newline-and-indent)
	  t)
      (error (message "No block to close found")))))

(defun pir-blink-matching-block-open ()
  "Blink the matching PIR begin block keyword.
If point is right after a PIR else or end type block keyword, move
cursor momentarily to the corresponding begin keyword.
Signal an error if the keywords are incompatible."
  (interactive)
  (let (bb-keyword bb-arg eb-keyword pos eol)
    (if (and (pir-not-in-string-or-comment-p)
	     (looking-at "\\>")
	     (save-excursion
	       (skip-syntax-backward "w_.")
	       (looking-at pir-block-end-regexp)))
	(save-excursion
	  (setq eb-keyword
		(buffer-substring-no-properties
		 (match-beginning 1) (match-end 1)))
	  (pir-backward-block)
	  (setq pos (match-end 1)
		bb-keyword
		(buffer-substring-no-properties
		 (match-beginning 1) pos)
		pos (+ pos 1)
		eol (line-end-position))
	  (if (member eb-keyword
		      (cdr (assoc bb-keyword pir-block-match-alist)))
	      (progn
		(message "Matches `.%s'" bb-keyword)
		(if (pos-visible-in-window-p)
		    (sit-for blink-matching-delay)))
	    (error "Block keywords `%s' and `%s' do not match"
		   bb-keyword eb-keyword))))))

(defun pir-beginning-of-defun (&optional arg)
  "Move backward to the beginning of a PIR function.
With positive ARG, do it that many times.  Negative argument -N means
move forward to Nth following beginning of a function.
Returns t unless search stops at the beginning or end of the buffer."
  (interactive "p")
  (let* ((arg (or arg 1))
	 (inc (if (> arg 0) 1 -1))
	 (found))
    (and (not (eobp))
	 (not (and (> arg 0) (looking-at "\\<function\\>")))
	 (skip-syntax-forward "w"))
    (while (and (/= arg 0)
		(setq found
		      (re-search-backward "\\<function\\>" nil 'move inc)))
      (if (pir-not-in-string-or-comment-p)
	  (setq arg (- arg inc))))
    (if found
	(progn
	  (and (< inc 0) (goto-char (match-beginning 0)))
	  t))))

(defun pir-end-of-defun (&optional arg)
  "Move forward to the end of a PIR function.
With positive ARG, do it that many times.  Negative argument -N means
move back to Nth preceding end of a function.

An end of a function occurs right after the end keyword matching the
`function' keyword that starts the function."
  (interactive "p")
  (or arg (setq arg 1))
  (and (< arg 0) (skip-syntax-backward "w"))
  (and (> arg 0) (skip-syntax-forward "w"))
  (if (pir-in-defun-p)
      (setq arg (- arg 1)))
  (if (= arg 0) (setq arg -1))
  (if (pir-beginning-of-defun (- arg))
      (pir-forward-block)))

(defun pir-mark-defun ()
  "Put point at the beginning of this PIR function, mark at its end.
The function marked is the one containing point or following point."
  (interactive)
  (let ((pos (point)))
    (if (or (pir-in-defun-p)
	    (and (pir-beginning-of-defun -1)
		 (pir-in-defun-p)))
	(progn
	  (skip-syntax-forward "w")
	  (pir-beginning-of-defun)
	  (push-mark (point))
	  (pir-end-of-defun)
	  (exchange-point-and-mark))
      (goto-char pos)
      (message "No function to mark found"))))


;;; Filling

(defun pir-fill-paragraph (&optional arg)
 "Fill paragraph of PIR code, handling PIR comments.
Optional argument ARG appears to be ignored.  Um..."
 (interactive "P")
 (save-excursion
   (let ((end (progn (forward-paragraph) (point)))
	 (beg (progn
		(forward-paragraph -1)
		(skip-chars-forward " \t\n")
		(beginning-of-line)
		(point)))
	 (cfc (current-fill-column))
	 (ind (calculate-pir-indent))
	 comment-prefix)
     (save-restriction
       (goto-char beg)
       (narrow-to-region beg end)
       (if (listp ind) (setq ind (nth 1 ind)))
       (while (not (eobp))
	 (condition-case nil
	     (pir-indent-line ind)
	   (error nil))
	 (if (and (> ind 0)
		  (not
		   (save-excursion
		     (beginning-of-line)
		     (looking-at "^\\s-*\\($\\|\\s<+\\)"))))
	     (setq ind 0))
	 (move-to-column cfc)
	 ;; First check whether we need to combine non-empty comment lines
	 (if (and (< (current-column) cfc)
		  (pir-in-comment-p)
		  (not (save-excursion
			 (beginning-of-line)
			 (looking-at "^\\s-*\\s<+\\s-*$"))))
	     ;; This is a nonempty comment line which does not extend
	     ;; past the fill column.  If it is followed by a nonempty
	     ;; comment line with the same comment prefix, try to
	     ;; combine them, and repeat this until either we reach the
	     ;; fill-column or there is nothing more to combine.
	     (progn
	       ;; Get the comment prefix
	       (save-excursion
		 (beginning-of-line)
		 (while (and (re-search-forward "\\s<+")
			     (not (pir-in-comment-p))))
		 (setq comment-prefix (match-string 0)))
	       ;; And keep combining ...
	       (while (and (< (current-column) cfc)
			   (save-excursion
			     (forward-line 1)
			     (and (looking-at
				   (concat "^\\s-*"
					   comment-prefix
					   "\\S<"))
				  (not (looking-at
					(concat "^\\s-*"
						comment-prefix
						"\\s-*$"))))))
		 (delete-char 1)
		 (re-search-forward comment-prefix)
		 (delete-region (match-beginning 0) (match-end 0))
		 (fixup-whitespace)
		 (move-to-column cfc))))
	 ;; We might also try to combine continued code lines>  Perhaps
	 ;; some other time ...
	 (skip-chars-forward "^ \t\n")
	 (delete-horizontal-space)
	 (if (or (< (current-column) cfc)
		 (and (= (current-column) cfc) (eolp)))
	     (forward-line 1)
	   (if (not (eolp)) (insert " "))
	       (forward-line 1))))
     t)))


;;; Electric characters && friends
(defun pir-reindent-then-newline-and-indent ()
  "Reindent current PIR line, insert newline, and indent the new line.
If Abbrev mode is on, expand abbrevs first."
  (interactive)
  (if abbrev-mode (expand-abbrev))
  (if pir-blink-matching-block
      (pir-blink-matching-block-open))
  (save-excursion
    (delete-region (point) (progn (skip-chars-backward " \t") (point)))
    (indent-according-to-mode))
  (insert "\n")
  (indent-according-to-mode))

(defun pir-electric-semi ()
  "Insert a semicolon in PIR mode.
Maybe expand abbrevs and blink matching block open keywords.
Reindent the line of `pir-auto-indent-flag' is non-nil.
Insert a newline if `pir-auto-newline' is non-nil."
  (interactive)
  (if (not (pir-not-in-string-or-comment-p))
      (insert ";")
    (if abbrev-mode (expand-abbrev))
    (if pir-blink-matching-block
	(pir-blink-matching-block-open))
    (if pir-auto-indent-flag
	(indent-according-to-mode))
    (insert ";")
    (if pir-auto-newline
	(newline-and-indent))))

(defun pir-electric-space ()
  "Insert a space in PIR mode.
Maybe expand abbrevs and blink matching block open keywords.
Reindent the line of `pir-auto-indent-flag' is non-nil."
  (interactive)
  (setq last-command-char ? )
  (if (not (pir-not-in-string-or-comment-p))
      (progn
	(indent-according-to-mode)
	(self-insert-command 1))
    (if abbrev-mode (expand-abbrev))
    (if pir-blink-matching-block
	(pir-blink-matching-block-open))
    (if (and pir-auto-indent-flag
	     (save-excursion
	       (skip-syntax-backward " ")
	       (not (bolp))))
	(indent-according-to-mode))
    (self-insert-command 1)))

(defun pir-abbrev-start ()
  "Start entering a PIR abbreviation.
If Abbrev mode is turned on, typing ` (grave accent) followed by ? or
\\[help-command] lists all PIR abbrevs.  Any other key combination is
executed normally.
Note that all PIR mode abbrevs start with a grave accent."
  (interactive)
  (if (not abbrev-mode)
      (self-insert-command 1)
    (let (c)
      (insert last-command-char)
      (if ;(if pir-xemacs-p
	  ;    (or (eq (event-to-character (setq c (next-event))) ??)
	  ;	  (eq (event-to-character c) help-char))
	  (or (eq (setq c (read-event)) ??)
	      (eq c help-char))
	  (let ((abbrev-table-name-list '(pir-abbrev-table)))
	    (list-abbrevs))
	(setq unread-command-events (list c))))))

(defun pir-insert-defun (name args vals)
  "Insert a PIR function skeleton.
Prompt for the function's NAME, ARGS and return VALS (to be
entered without parens)."
  (interactive
   (list
    (read-from-minibuffer "Function name: "
			  (substring (buffer-name) 0 -2))
    (read-from-minibuffer "Arguments: ")
    (read-from-minibuffer "Return values: ")))
  (let ((string (format "%s %s (%s)"
			(cond
			 ((string-equal vals "")
			  vals)
			 ((string-match "[ ,]" vals)
			  (concat " [" vals "] ="))
			 (t
			  (concat " " vals " =")))
			name
			args))
	(prefix pir-block-comment-start))
    (if (not (bobp)) (newline))
    (insert "function" string)
    (indent-according-to-mode)
    (newline 2)
    (insert prefix "usage: " string)
    (reindent-then-newline-and-indent)
    (insert prefix)
    (reindent-then-newline-and-indent)
    (insert prefix)
    (indent-according-to-mode)
    (save-excursion
      (newline 2)
      (insert "endfunction")
      (indent-according-to-mode))))


;;; Completions
(defun pir-initialize-completions ()
  "Initialize the completion table for PIR symbols."
  (if pir-completion-alist
      ()
    (setq pir-completion-alist
	  (mapcar '(lambda (var) (cons var var))
		  (append pir-PMC-keyword-symbols
			  pir-ops pir-dotted-directives
			  pir-variable-declarations)))))

(defun pir-complete-symbol ()
  "Perform completion on PIR symbol preceding point.
Compare that symbol against PIR's reserved words and builtin
variables."
  ;; This code taken from lisp-complete-symbol
  (interactive)
  (let* ((end (point))
	 (beg (save-excursion (backward-sexp 1) (point)))
	 (string (buffer-substring-no-properties beg end))
	 (completion (try-completion string pir-completion-alist)))
    (cond ((eq completion t))		; ???
	  ((null completion)
	   (message "Can't find completion for \"%s\"" string)
	   (ding))
	  ((not (string= string completion))
           (delete-region beg end)
           (insert completion))
	  (t
	   (let ((list (all-completions string pir-completion-alist))
		 (conf (current-window-configuration)))
	     ;; Taken from comint.el
	     (message "Making completion list...")
	     (with-output-to-temp-buffer "*Completions*"
	       (display-completion-list list))
	     (message "Hit space to flush")
	     (let (key first)
	       (if (save-excursion
		     (set-buffer (get-buffer "*Completions*"))
		     (setq key (read-key-sequence nil)
			   first (aref key 0))
		     (and (consp first) (consp (event-start first))
			  (eq (window-buffer (posn-window (event-start
							   first)))
			      (get-buffer "*Completions*"))
			  (eq (key-binding key) 'mouse-choose-completion)))
		   (progn
		     (mouse-choose-completion first)
		     (set-window-configuration conf))
		 (if (eq first ?\ )
		     (set-window-configuration conf)
		   (setq unread-command-events
			 (listify-key-sequence key))))))))))


;;; Menu
(defun pir-add-pir-menu ()
  "Add the `PIR' menu to the menu bar in PIR mode."
  (require 'easymenu)
  (easy-menu-define pir-mode-menu-map pir-mode-map
    "Menu keymap for PIR mode." pir-mode-menu)
  (easy-menu-add pir-mode-menu-map pir-mode-map))



(provide 'pir-mode)
(provide 'pir-mode)

;;; pir-mode.el ends here
