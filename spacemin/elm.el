(use-package elm-mode
  :mode "\\.elm\\'"
  :config
  (setq elm-tags-on-save t
	elm-sort-imports-on-save t
	elm-format-on-save t)

  ;; TODO: add keybindings listed at https://github.com/jcollard/elm-mode
  ;; but TBH it's not a super high priority for me since I mostly use
  ;; jetpack at work and elm reactor or other watchers for OSS
  ;; stuff. As long as I (eventually) get flycheck working I think
  ;; I'll be fine.
  )
