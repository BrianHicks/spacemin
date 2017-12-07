(use-package projectile
  :config
  (projectile-mode 1)

  ;; workaround for https://github.com/bbatsov/projectile/issues/1183
  (setq projectile-mode-line
	'(:eval (format " %s " (projectile-project-name))))

  (evil-leader/set-key
   "p!" 'projectile-run-shell-command-in-root
   "p&" 'projectile-run-async-shell-command-in-root
   "pE" 'projectile-edit-dir-locals
   "pD" 'projectile-dired
   "pF" 'projectile-find-file-in-known-projects
   "pT" 'projectile-test-project
   "pR" 'projectile-regenerate-tags
   "pS" 'projectile-save-project-buffers
   "pt" 'projectile-toggle-between-implementation-and-test
   "pV" 'projectile-browser-dirty-projects
   "pa" 'projectile-find-other-file
   "pb" 'projectile-switch-to-buffer
   "pc" 'projectile-compile-project
   "pd" 'projectile-find-dir
   "pe" 'projectile-recentf
   "pf" 'projectile-find-file
   "pg" 'projectile-find-file-dwim
   "pI" 'projectile-invalidate-cache
   "pj" 'projectile-find-tag
   "pk" 'projectile-kill-buffers
   "pl" 'projectile-find-file-in-directory
   "pm" 'projectile-commander
   "po" 'projectile-multi-occur
   "pp" 'projectile-switch-project
   "pq" 'projectile-switch-open-project
   "pr" 'projectile-replace
   "pu" 'projectile-run-project
   "ps" 'projectile-ag))

(use-package ag)
