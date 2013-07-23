;; create new
(defun erl-new-file (module-name tpl-file)
  "create new erlang module from template"
  (setq new-file (format "%s.erl" module-name))
  (copy-file tpl-file new-file)
  (switch-to-buffer (find-file new-file))
  (search-forward "(")
  (setq begin (point))
  (search-forward ")")
  (backward-char)
  (kill-region begin (point))
  (insert module-name))

(defun erl-new-module (module-name)
  "create simple erlang module"
  (interactive "MModule name:")
  (erl-new-file module-name "~/.emacs.d/tpl/module_tpl.erl"))

(defun erl-new-supervisor (module-name)
  "create supervisor erlang module"
  (interactive "MModule name:")
  (erl-new-file module-name "~/.emacs.d/tpl/supervisor_tpl.erl"))

(defun erl-new-gen-server (module-name)
  "create gen-server erlang module"
  (interactive "MModule name:")
  (erl-new-file module-name "~/.emacs.d/tpl/gen_server_tpl.erl"))

(defun clone-line-at-point ()
  (kill-region (line-beginning-position) (+ 1 (line-end-position)))
  (yank)
  (yank))

(defun erl-spec ()
  "add -spec to erlang function"
  (interactive)
  (clone-line-at-point)
  (previous-line 2)
  (beginning-of-line)
  (insert "-spec(")
  (skip-chars-forward "^(")
  (forward-char)
  (delete-region (point) (line-end-position)))
(global-set-key (kbd "C-c C-s") 'erl-spec)

(defun erl-gen-server (S1 S2 S3 S4 S5)
  "help to generate gen_server code"
  (clone-line-at-point)
  (previous-line)
  (beginning-of-line)
  (insert S1)
  (skip-chars-forward "^(")
  (delete-char 1)
  (insert ", ")
  (skip-chars-forward "^)")
  (delete-region (point) (line-end-position))
  (insert S2)
  (skip-chars-backward "^}")
  (setq p1 (point))
  (skip-chars-backward "^{")
  (backward-char)
  (setq p2 (point))
  (kill-ring-save p2 p1)
  (end-of-line)
  (newline 2)
  (insert S3)
  (yank)
  (insert S4)
  (newline)
  (insert S5)
  (previous-line)
  (beginning-of-line))

(defun erl-gen-server-call ()
  "generate gen_server:call"
  (interactive)
  (erl-gen-server 
  "    gen_server:call(?MODULE, {" "})."
  "handle_call(" ", _From, State) ->"
  "    {reply, Reply, State};"))
(global-set-key (kbd "C-c C-g") 'erl-gen-server-call)

(defun erl-gen-server-cast ()
  "generate gen_server:cast"
  (interactive)
  (erl-gen-server 
  "    gen_server:cast(?MODULE, {" "}), ok."
  "handle_cast(" ", State) ->"
  "    {noreply, State};"))
(global-set-key (kbd "C-c M-g") 'erl-gen-server-cast)

