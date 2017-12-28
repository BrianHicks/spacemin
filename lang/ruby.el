;;; ruby --- mine some gems

;;; Commentary:
;;; enh-ruby-mode seemed nicer than builtin, but is giving me
;;; issues.  I don't know that it's long for this config.

;;; Code:
(use-package enh-ruby-mode
  :mode "\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'"
  :interpreter ("ruby" . enh-ruby-mode)
  :general
  (general-nvmap :keymaps 'ruby-mode-map
		 :prefix ","
		 "e" '(:ignore t :which-key "edit")
		 "eb" 'enh-ruby-toggle-block
		 "ei" 'enh-ruby-indent-exp

		 "g" 'hydra-ruby-navigation/body

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
	enh-ruby-indent-level 2)

  (defhydra hydra-ruby-navigation (:foreign-keys nil :hint "navigate")
    "navigate ruby code"
    ("n" enh-ruby-forward-sexp "forward sexp")
    ("p" enh-ruby-backward-sexp "backward sexp")
    ("b" enh-ruby-end-of-block "forward block")
    ("B" enh-ruby-beginning-of-block "backward block")
    ("d" enh-ruby-end-of-defun "forward defun")
    ("D" enh-ruby-beginning-of-defun "backward defun")
    ("q" nil "quit"))

  ;; TODO: robe mode (https://github.com/dgutov/robe)
  )

(use-package rspec-mode
  :after enh-ruby-mode
  ;; TODO: keybindings
  )

(use-package rbenv
  :after enh-ruby-mode
  :config
  (add-hook 'enh-ruby-mode-hook 'rbenv-mode))

(use-package yard-mode
  :after enh-ruby-mode
  :config
  (add-hook 'ruby-mode-hook 'yard-mode))

(provide 'ruby)

;;; ruby.el ends here
