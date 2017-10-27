;;; ruby --- mine some gems

;;; Commentary:
;;; enh-ruby-mode seemed nicer than builtin, but is giving me
;;; issues.  I don't know that it's long for this config.

;;; Code:
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

  (evil-leader/set-key-for-mode 'enh-ruby-mode
    ;; *e*diting
    "meb" 'enh-ruby-toggle-block
    "mei" 'enh-ruby-indent-exp

    ;; *g*o
    ;; TODO: these feel like they should be in a hydra
    "mgu" 'enh-ruby-forward-sexp
    "mgU" 'enh-ruby-backward-sexp
    "mgb" 'enh-ruby-beginning-of-block
    "mgB" 'enh-ruby-end-of-defun
    "mgd" 'enh-ruby-beginning-of-defun
    "mgD" 'enh-ruby-end-of-defun

    ;; *m*eta
    "mmR" 'erm-reset
    "mmF" 'enh-ruby-fontify-buffer)

  (use-package rbenv
    :config
    (add-hook 'enh-ruby-mode-hook 'rbenv-mode))

  ;; TODO: robe mode (https://github.com/dgutov/robe)
  ;; TODO: yard mode (https://github.com/pd/yard-mode.el)
    )

;;; ruby.el ends here
