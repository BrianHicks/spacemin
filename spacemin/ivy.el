(use-package ivy
  :config
  (setq ivy-use-selectable-prompt t
	ivy-re-builders-alist '((t . ivy--regex-fuzzy)))

  (ivy-mode 1)

  (evil-leader/set-key
    ;; *b*uffers
    "bb" 'ivy-switch-buffer

    ;; *h*elp
    "hdf" 'counsel-describe-function
    "hdv" 'counsel-describe-variable
    "hdl" 'counsel-find-library
    "hdi" 'counsel-lookup-symbol

    ;; *i*nsertions
    "iu" 'counsel-unicode-char

    ;; *m*eta
    "mr" 'ivy-resume
    )

  (use-package hydra)
  (use-package flx))
