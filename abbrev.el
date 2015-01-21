(define-abbrev-table 'global-abbrev-table '(
    ("eee", "emysql:execute(")
    ))

;; stop asking whether to sapve newly added abbrev when quitting emacs
(setq save-abbrevs nil)

;; turn on abbrev mode globally
(setq-default abbrev-mode t)
