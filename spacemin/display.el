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
