;; all the icons!
(use-package all-the-icons
  :config
  (use-package all-the-icons-dired
    :config
    (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)))
