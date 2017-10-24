;; turn off scroll bars (it's in modeline)
(scroll-bar-mode -1)

;; turn off the tool bar (which-key works fine and I've been vimming
;; for long enough that I never use it.)
(tool-bar-mode -1)

;; themes!
(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)

  (doom-themes-visual-bell-config)

  ;; (doom-themes-neotree-config) ;: TODO: try neotree
  (doom-themes-org-config)

  (load-theme 'doom-one)
  ;; TODO: theme switcher

  (use-package solaire-mode
    :config
    (add-hook 'after-change-major-mode-hook #'turn-on-solaire-mode)
    (add-hook 'after-revert-hook #'turn-on-solaire-mode)
    (add-hook 'minibuffer-setup-hook #'solaire-mode-in-minibuffer)

    (solaire-mode-swap-bg)))

;; pretty modeline
(use-package telephone-line
  :config
  (telephone-line-evil-config))
