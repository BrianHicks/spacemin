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
  )
