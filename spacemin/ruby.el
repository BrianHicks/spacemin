(use-package enh-ruby-mode
  :mode ("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode)
  :interpreter ("ruby" . enh-ruby-mode)
  :config
  (setq enh-ruby-add-encoding-comment-on-save nil)

  (use-package rbenv
    :config
    (add-hook 'enh-ruby-mode-hook 'rbenv-mode))

  ;; TODO: robe mode (https://github.com/dgutov/robe)
  ;; TODO: yard mode (https://github.com/pd/yard-mode.el)
    )
