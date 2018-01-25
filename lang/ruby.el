;;; ruby --- mine some gems

;;; Commentary:
;;; enh-ruby-mode seemed nicer than builtin, but is giving me
;;; issues.  I don't know that it's long for this config.

;;; Code:
(use-package enh-ruby-mode
  :mode "\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'"
  :interpreter ("ruby" . enh-ruby-mode)
  :general
  (general-nvmap :keymaps 'enh-ruby-mode-map
                 :prefix ","
                 "e" '(:ignore t :which-key "edit")
                 "eb" 'enh-ruby-toggle-block
                 "ei" 'enh-ruby-indent-exp

                 "m" '(:ignore t :which-key "meta")
                 "mR" 'erm-reset
                 "mF" 'enh-ruby-fontify-buffer)

  :config
  (setq enh-ruby-add-encoding-comment-on-save nil

        ;; https://github.com/zenspider/enhanced-ruby-mode/issues/36
        enh-ruby-comment-column 32
        enh-ruby-bounce-deep-indent t
        enh-ruby-deep-indent-paren t
        enh-ruby-deep-indent-construct t
        enh-ruby-hanging-paren-deep-indent-level 1
        enh-ruby-hanging-brace-deep-indent-level 1
        enh-ruby-hanging-brace-indent-level 2
        enh-ruby-hanging-indent-level 2
        enh-ruby-hanging-paren-indent-level 2
        enh-ruby-indent-level 2))

(use-package robe
  :after enh-ruby-mode
  :config
  (add-hook 'enh-ruby-mode-hook 'robe-mode)
  ;; TODO: keybindings
  )

(use-package rspec-mode
  :after enh-ruby-mode
  :general
  (general-nvmap :keymaps 'enh-ruby-mode-map
                 :prefix ","
                 "t" '(:ignore t :wk "test")
                 "tt" 'rspec-rerun
                 "tv" 'rspec-verify
                 "ts" 'rspec-verify-single
                 "tA" 'rspec-verify-all
                 "tf" 'rspec-run-last-failed

                 ;; edit already defined
                 "ep" 'rspec-toggle-example-pendingness

                 "g" '(:ignore t :wd "go")
                 "gt" 'rspec-toggle-spec-and-target
                 "gT" 'rspec-find-spec-or-target-other-window)
  ;; TODO: more keybindings!
  :config
  ;; look in spec for lib test files by removing it from 'rspec-primary-source-dirs
  (setq rspec-primary-source-dirs '("app")))

(use-package rbenv
  :after enh-ruby-mode
  :config
  (add-hook 'enh-ruby-mode-hook 'rbenv-mode))

(use-package yard-mode
  :after enh-ruby-mode
  :config
  (add-hook 'enh-ruby-mode-hook 'yard-mode))

(provide 'ruby)

;;; ruby.el ends here
