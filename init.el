(setq inhibit-startup-message t)
(global-linum-mode) ;; show line numbers
(show-paren-mode 1) ;; highlight matching parensesis
(setq show-paren-style 'expression)
(setq-default indent-tabs-mode nil) ;; spaces instead of tabs
(setq-default tab-width 4)
(setq make-backup-files nil)
(setq auto-save-default t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)
(global-auto-revert-mode t) ;; reverts any buffer associated with a file when the file changes on disk
(setq-default sgml-basic-offset 4)

(global-font-lock-mode t) ;; need for org-mode

(set-face-attribute 'default nil :font "Ubuntu Mono-13")
;;(set-frame-size (selected-frame) 100 33)

;;(load-theme 'tango t)       ;; 5 light
(load-theme 'tango-dark t)  ;; 5 dark
;;(load-theme 'tsdh-dark t)   ;; 5 dark
;;(load-theme 'wombat t)      ;; 5 dark
;;(load-theme 'wheatgrass t)  ;; 4 dark
;;(load-theme 'misterioso t)  ;; 4 dark
;;(load-theme 'deeper-blue t) ;; 3 dark
;;(load-theme 'manoj-dark t)  ;; 3 dark
;;(load-theme 'dichromacy t)  ;; 3 light
;;(load-theme 'tsdh-light t)  ;; 3 light
;;(load-theme 'whiteboard t)  ;; 3 light
;;(load-theme 'adwaita t)     ;; 2 light
;;(load-theme 'light-blue t)  ;; 2 light

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(load-file "~/.emacs.d/erl-utils.el")
(load-file "~/.emacs.d/hotkeys.el")
(load-file "~/.emacs.d/plugins/ecmascript-mode.el")

;; ------------
;; packages
;; ------------

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)


;; -------------
;; ido, ibuffer
;; -------------

(require 'ido)
(ido-mode t)

(autoload 'ibuffer "ibuffer" "List buffers." t)

;; https://github.com/purcell/ibuffer-vc
;; Let Emacs' ibuffer-mode group files by git project etc., and show file state
(load-file "~/.emacs.d/elpa/cl-lib-0.5/cl-lib.el")
(load-file "~/.emacs.d/ibuffer-vc.el")

(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-vc-set-filter-groups-by-vc-root)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))))

;; -------------
;; erlang mode
;; -------------

(add-to-list
   'load-path
       (car (file-expand-wildcards "/usr/local/lib/erlang/lib/tools-*/emacs")))

(add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '(".*\\.app\\'" . erlang-mode))
(add-to-list 'auto-mode-alist '(".*app\\.src\\'" . erlang-mode))
(add-to-list 'auto-mode-alist '(".*\\.config\\'" . erlang-mode))
(add-to-list 'auto-mode-alist '(".*\\.rel\\'" . erlang-mode))
(add-to-list 'auto-mode-alist '(".*\\.script\\'" . erlang-mode))

(setq erlang-root-dir "/usr/local/lib/erlang")
(setq erlang-electric-commands nil) ;; http://www.erlang.org/doc/apps/tools/erlang_mode_chapter.html#id63595
(setq erlang-compile-outdir "../ebin")

(defvar erlang-compile-extra-opts
  '(bin_opt_info debug_info (i . "../include") (i . "../../include") (i . "../deps") (i . "../../") (i . "../../../deps")))

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


;; -------------
;; markdown
;; -------------

(load-file "~/.emacs.d/plugins/markdown-mode.el")
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(put 'downcase-region 'disabled nil)


;; -------------
;; org-mode
;; -------------

(setq org-agenda-files (list
                        "~/Dropbox/org/beug.org"
                        "~/Dropbox/org/education.org"
                        "~/Dropbox/org/emacs.org"
                        "~/Dropbox/org/home.org"
                        "~/Dropbox/org/root.org"))

;; -------------
;; haskell-mode
;; -------------

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-unicode-input-method)

;; -------------
;; c++-mode
;; -------------

(c-add-style "my-cpp-style"
	     '("stroustrup"
	       (indent-tabs-mode . nil)        ; use spaces rather than tabs
	       (c-basic-offset . 4)            ; indent by four spaces
           ))

(defun my-c++-mode-hook ()
  (c-set-style "my-cpp-style")
  (auto-fill-mode)
  (c-toggle-auto-hungry-state 1)
  (c-toggle-auto-newline -1)
  )

(add-hook 'c++-mode-hook 'my-c++-mode-hook)


;; -------------
;; other stuff :)
;; -------------

(setq tetris-score-file "~/.emacs.d/tetris-scores")
