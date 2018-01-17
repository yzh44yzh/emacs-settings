;; -------------
;; erlang mode
;; -------------


(if (eq system-type 'darwin)
    (add-to-list
     'load-path
     (car (file-expand-wildcards "/Users/y_zhloba/.erlangInstaller/19.2/lib/tools-*/emacs")))
    (add-to-list
     'load-path
     (car (file-expand-wildcards "/usr/local/lib/erlang/lib/erlang/lib/tools-*/emacs"))))

(add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '(".*\\.app\\'" . erlang-mode))
(add-to-list 'auto-mode-alist '(".*app\\.src\\'" . erlang-mode))
(add-to-list 'auto-mode-alist '(".*\\.config\\'" . erlang-mode))
(add-to-list 'auto-mode-alist '(".*\\.rel\\'" . erlang-mode))
(add-to-list 'auto-mode-alist '(".*\\.script\\'" . erlang-mode))

(setq erlang-root-dir "/Users/y_zhloba/.erlangInstaller/19.2/")
(setq erlang-electric-commands nil) ;; http://www.erlang.org/doc/apps/tools/erlang_mode_chapter.html#id63595
(setq erlang-compile-outdir "../ebin")

(defvar erlang-compile-extra-opts
  '(bin_opt_info debug_info
                 (i . "../include")
                 ))

(require 'erlang-start)


;; -------------
;; flymake
;; -------------

(require 'erlang-flymake)

(setq flymake-log-level 1)

(defun flymake-compile-script-path (path)
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list path (list local-file))))


;; https://github.com/ten0s/syntaxerl/
;; syntax checker tool for Erlang
(defun flymake-syntaxerl ()
  (flymake-compile-script-path "~/bin/syntaxerl"))

(add-hook 'erlang-mode-hook
  '(lambda()
     (add-to-list 'flymake-allowed-file-name-masks '("\\.erl\\'" flymake-syntaxerl))
     (add-to-list 'flymake-allowed-file-name-masks '("\\.hrl\\'" flymake-syntaxerl))
     (add-to-list 'flymake-allowed-file-name-masks '("\\.app\\'" flymake-syntaxerl))
     (add-to-list 'flymake-allowed-file-name-masks '("\\.app.src\\'" flymake-syntaxerl))
     (add-to-list 'flymake-allowed-file-name-masks '("\\.config\\'" flymake-syntaxerl))
     (add-to-list 'flymake-allowed-file-name-masks '("\\.rel\\'" flymake-syntaxerl))
     (add-to-list 'flymake-allowed-file-name-masks '("\\.script\\'" flymake-syntaxerl))

     ;; should be the last.
     (flymake-mode 1)
))
