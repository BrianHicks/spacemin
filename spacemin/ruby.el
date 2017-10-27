(use-package enh-ruby-mode
  :mode ("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode)
  :interpreter ("ruby" . enh-ruby-mode)
  :config
  (setq enh-ruby-add-encoding-comment-on-save nil

	;; https://github.com/zenspider/enhanced-ruby-mode/issues/36
	enh-ruby-comment-column 32
	enh-ruby-bounce-deep-indent t
	enh-deep-indent-parent t
	enh-ruby-hanging-brace-deep-indent-level 1
	enh-ruby-hanging-brace-indent-level 2
	enh-ruby-hanging-indent-level 2
	enh-ruby-hanging-paren-indent-level 2
	enh-ruby-indent-level 2)

  (use-package rbenv
    :config
    (add-hook 'enh-ruby-mode-hook 'rbenv-mode))

  ;; TODO: robe mode (https://github.com/dgutov/robe)
  ;; TODO: yard mode (https://github.com/pd/yard-mode.el)
    )
