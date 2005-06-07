;;;; pasm.el
;;;;
;;;; this is a simple major mode for working with parrot assembler
;;;; (and, to a certain extent, parrot imc) files.
;;;;
;;;; first off: this file is 'it works for me' quality, use at your
;;;; own risk
;;;;
;;;; offerings:
;;;;
;;;; 1) highlighting for labels, comments and ops which modify program
;;;; flow (if, bsr, jsr, etc.). I have intentionally kept the
;;;; highlighting to a minimum (highlighitng loses it's point when you
;;;; highlight _everything_), however if someone wants i'll add in
;;;; different highlighting levels ala cperl-mode.
;;;;
;;;; 2) simple indentation (but it kills tabs, which i think is a good
;;;; thing so i'm not going to fix it (yes, it'm just justifying my
;;;; lazyness (i just realized that this is going to create a *lot* of
;;;; whitespace diffs ... hmmm ...)))
;;;;
;;;; 3) a simple function for following branches. see the doc string
;;;; for pasm-follow-branch. By default this is bound to "C-c C-j".
;;;;
;;;; 4) a function for passing the curent buffer to assembler.pl and
;;;; passing the output of that to the parrot interpreter and putting
;;;; the output in another window. see the doc string for
;;;; pasm-assemble-and-run-buffer (dont't forget to set PERL5LIB). By
;;;; default this is bound to "C-c C-c".
;;;;
;;;; COPYRIGHT (C) 2002 Edward Marco Baringer. All Rights Reserved.
;;;; This file is free software. It may be used, redistributed
;;;; and/or modified under the terms of the Perl Artistic License
;;;; (see http://www.perl.com/perl/misc/Artistic.html)
;;;;

(defvar *pasm-mode-syntax-table* nil)

(defvar *pasm-mode-keymap* nil)

(defvar *pasm-labeled-branching-ops*
  '("bsr" "branch" "jsr" "jump" "eq" "ne" "lt" "le" "gt" "ge" "if" "unless")
  "All the pasm ops which jump to a particular label, in other words
all the ops which can change control flow minus 'ret' and 'end'")

(defvar *pasm-label-regexp* "[A-Za-z_][A-Za-z_0-9]*:")

(defvar *pasm-assembler-path* nil
  "The path of the assembler. This will be passed as is to your shell,
so either assembler.pl is in PATH or you need to use an absolute name")

(defvar *pasm-parrot-path* nil
  "The path of the parrot interpreter. As in *pasm-assembler-path*
this will be passed as is to your shell (via shell-command-on-region's
third arg) and so unless parrot in your PATH this should be an
absolute path")

(unless *pasm-mode-syntax-table*
  (setq *pasm-mode-syntax-table* (make-syntax-table))
  (modify-syntax-entry ?\\ "\\" *pasm-mode-syntax-table*)
  (modify-syntax-entry ?#  "<"  *pasm-mode-syntax-table*)
  (modify-syntax-entry ?\n ">"  *pasm-mode-syntax-table*)
  (modify-syntax-entry ?:  "_"  *pasm-mode-syntax-table*))

(unless *pasm-mode-keymap* 
  ;; please, someone tell how i should really do this...
  (let ((inner-keymap (make-sparse-keymap)))
    (define-key inner-keymap (kbd "C-c") 'pasm-assemble-and-run-buffer)
    (define-key inner-keymap (kbd "C-j") 'pasm-follow-branch)
    (setq *pasm-mode-keymap* (make-sparse-keymap))
    (define-key *pasm-mode-keymap* (kbd "\C-c") inner-keymap)
    (define-key *pasm-mode-keymap* (kbd "TAB") 'pasm-indent-function)))

(setq pasm-font-lock-keywords `(;; labels
                                ;; NB: i hearby decree that labels
                                ;; must be the first thing on a line,
                                ;; the assembler be damned.
                                (,(concat "^" *pasm-label-regexp*) . font-lock-constant-face)
                                ;; assembler directives
                                ("^\\s-*\\.[a-zA-Z]*" . font-lock-builtin-face)
                                ;; ops that jump: bsr, branch, jsr,
                                ;; jump, eq, ne, lt, le, gt, ge, if,
                                ;; unless, ret and goto
                                ("\\<\\(b\\(sr\\|ranch\\)\\|e\\(q\\|nd\\)\\|g[te]\\|if\\|j\\(ump\\|sr\\)\\|l[te]\\|ne\\|ret\\|unless\\|goto\\)\\>" .
                                 font-lock-keyword-face)
                                ;; imcc temporary registers
                                ("\\$\\(I\\|S\\|P\\|N\\)[0-9]+" .
                                 font-lock-variable-name-face)
                                ;; pasm registers
                                ("\\<\\(I\\|S\\|P\\|N\\)\\([0-9]\\|[12][0-9]\\|3[01]\\)\\>" .
                                 font-lock-variable-name-face)
                                ;; basic types: int, string, pmc and float 
                                ("\\<\\(int\\|string\\|pmc\\|float\\)\\>" .
                                 font-lock-type-face)))
                                
(defun pasm-mode ()
  "Simple Emacs mode for editing Parrot Assembler"
  (interactive)
  (kill-all-local-variables)
  (setq major-mode 'pasm-mode)
  (setq mode-name "PASM")
  (set-syntax-table *pasm-mode-syntax-table*)
  (make-local-variable 'paragraph-start)
  (setq paragraph-start (concat "^$\\|" page-delimiter))
  (make-local-variable 'paragraph-separate)
  (setq paragraph-separate paragraph-start)
  (make-local-variable 'indent-line-function)
  (setq indent-line-function 'pasm-indent-line-function)
  (make-local-variable 'require-final-newline)
  (setq require-final-newline t)
  (make-local-variable 'comment-start)
  (setq comment-start "# ")
  (make-local-variable 'comment-end)
  (setq comment-end "")
  (make-local-variable 'comment-start-skip)
  (setq comment-start-skip "#+ *")
  (make-local-variable 'font-lock-defaults)
  (setq font-lock-defaults '(pasm-font-lock-keywords))
  (font-lock-mode 1)
  (use-local-map *pasm-mode-keymap*)
  (run-hooks 'pasm-mode-hook))

(defun pasm-indent-line-function ()
  (interactive)
  (save-excursion
    (beginning-of-line)
    ;;(delete-region (point) (+ (point) (current-indentation)))
    (delete-horizontal-space)
    (cond
     ((looking-at "[A-Za-z_][A-Za-z_0-9]*:")
      (indent-to 0))
     (t
      (indent-to 8)))))

(defun beginning-of-line-point (&optional n)
  "Return the point at the beginning of the current line. N gets
passed to beginning-of-line if you want"
  (save-excursion 
    (beginning-of-line n)
    (point)))

(defun pasm-indent-function ()
  "This differs from pasm-indent-line-function in that if we end up at
the beginning of a line (which doesn't have a label) we want to be
moved forward to column 8"
  (interactive)
  (pasm-indent-line-function)
  ;; how do we check if we're at the beginnign of a line? there must
  ;; be a function for this
  (unless (or (looking-at "[A-Za-z_][A-Za-z_0-9]*:") 
              (/= (beginning-of-line-point) (point)))
      (forward-char 8)))

(defun pasm-assemble-and-run-buffer ()
  "Pretend the current buffer is pasm code and send it to assemble.pl,
send the output of that to parrot and send the output of that to the
*Parrot* buffer.

This relies on the variables *pasm-assembler-path* to find
assembler.pl and *pasm-parrot-path* to find the parrot interpreter. If
there are any args you want passed to the assembler or the parrot
interpreter just append them to the respective variable. Note that to
whatever value these vars have the string \" -- - \" will be appended.

NB: You need to add <parrot-root-dir>/lib to your PERL5LIB var for
this to work (or you need to be lucky (which i guess we could say
about anything))."
  (interactive)
  (let ((max-mini-window-height 0))
    (shell-command-on-region (point-min)
                             (point-max)
                             (concat *pasm-assembler-path* " -- - | "
                                     *pasm-parrot-path* " -- -")
                             (get-buffer-create "*Parrot output*")))
  (let ((current-buffer (current-buffer)))
    (switch-to-buffer-other-window (get-buffer "*Parrot output*"))
    (switch-to-buffer-other-window current-buffer)))

(defun pasm-follow-branch ()
  "Look at the current op, it it's a branching op we jump to the
proper label (assuming it exists). In order to determine whether the
current op is branching or not we rely on the value of
*pasm-labeled-branching-ops*"
  (interactive)
  (let ((jump-to-point nil))
    ;; jump-to-point and the save-excursion are so that if we're not
    ;; on a branching op line or if the op to jump to isn't defined we
    ;; don't move the point around unneccessarily (this would be very
    ;; confusing, trust me)
    (save-excursion
      (beginning-of-line)
      (save-match-data
        (when (looking-at (concat "^" *pasm-label-regexp*))
          (search-forward ":")))
      (let ((op (buffer-substring (1- (search-forward-regexp "[^ \t\n\r]"))
                                  (1- (search-forward-regexp "[^a-z_]")))))
        (when (member op *pasm-labeled-branching-ops*)
          ;; the label to jump to is the last sequence of [a-zA-Z_0-9]+
          ;; chars in this instruction
          (end-of-line)
          (search-backward-regexp "[^a-zA-Z_0-9]")
          (forward-char)
          (let ((label (buffer-substring (point) (1- (search-forward-regexp "[^a-zA-Z_0-9]")))))
            ;; label is the name (minus the traling ':') of the label
            ;; to jump to
            (beginning-of-buffer)
            (setq jump-to-point (search-forward (concat label ":")))))))
    (if jump-to-point
      (goto-char jump-to-point)
      (message "Not on branching op or undefined label"))))
