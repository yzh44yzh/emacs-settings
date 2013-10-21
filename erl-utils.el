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


(defun erl-spec () 
  "add -spec to erlang function"
  (interactive)
  (duplicate-line)
  (previous-line)
  (beginning-of-line)
  (insert "-spec(")
  (skip-chars-forward "^(")
  (forward-char)
  (kill-line)
  (setq kill-ring nil))
(global-set-key (kbd "C-c C-d") 'erl-spec)


(defun erl-gen-server (call-str handle-str) 
  "help to generate gen_server code"
  (duplicate-line)
  (beginning-of-line)
  (skip-chars-forward "^(")
  (delete-char 1)
  (insert ", ")
  (skip-chars-forward "^)")
  (kill-line)
  (beginning-of-line)
  (kill-line)
  (setq args (car kill-ring))
  (insert (format call-str args))
  (newline 2)
  (insert (format handle-str args)) ;TODO put handle-str to proper position (before last handle_call)
  (previous-line)
  (beginning-of-line)
  (setq kill-ring nil))


(defun erl-gen-server-call ()
  "generate gen_server:call"
  (interactive)
  (erl-gen-server 
   "    gen_server:call(?MODULE, {%s})."
   "handle_call({%s}, _From, State) ->\n    {reply, Reply, State};"))
(global-set-key (kbd "C-c C-g") 'erl-gen-server-call)


(defun erl-gen-server-cast ()
  "generate gen_server:cast"
  (interactive)
  (erl-gen-server 
   "    gen_server:cast(?MODULE, {%s}),\n    ok."
   "handle_cast({%s}, State) ->\n    {noreply, State};"))
(global-set-key (kbd "C-c M-g") 'erl-gen-server-cast)

