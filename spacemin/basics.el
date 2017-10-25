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

(use-package popwin
  :config
  (popwin-mode 1))

(use-package smartparens
  :config
  (require 'smartparens-config)
  (smartparens-global-mode 1))

;; which-key helps me remember random keybindings and rediscover
;; things I had lost.
(use-package which-key
  :config
  (which-key-mode 1))
