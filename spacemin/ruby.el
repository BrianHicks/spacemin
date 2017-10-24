(use-package enh-ruby-mode
  :mode ("\\.rb\\'" . enh-ruby-mode)
  :interpreter ("ruby" . enh-ruby-mode)
  :config

  (use-package rbenv
    :config
    ;; TODO: put this in a hook... probably when loading a ruby file
    (global-rbenv-mode))

  ;; TODO: robe mode (https://github.com/dgutov/robe)
  ;; TODO: yard mode (https://github.com/pd/yard-mode.el)
    )
