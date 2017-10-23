;; exec-path-from-shell looks for environment variables set in SHELL
;; and brings them into emacs. This stops having to set things like
;; PATH twice. It's useful for me in particular because git is set to
;; sign each commit with GPG, which is installed in a non-default
;; (homebrewed) path.
;;
;; we do this here instead of in a sub-file because
(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))
