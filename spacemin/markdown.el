(use-package markdown-mode
  :mode ("\\.md\\'" . markdown-mode)
  :config
  (use-package markdown-toc
    :config
    (evil-leader/set-key-for-mode 'markdown-mode
      "met" 'markdown-toc-generate-or-refresh-toc)))
