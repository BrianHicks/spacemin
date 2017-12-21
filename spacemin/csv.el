;;; csv.el --- comma separated text files

;;; Commentary:
;;; I don't open these in Emacs very much, but when I do I really really want this.

;;; Code:

(use-package csv-mode
  :mode "\\.\\(c\\|t\\)sv\\'"
  :config
  (localleader :keymaps 'csv-mode-map
               "e" '(:ignore t :which-key "edit")
               "et" 'csv-transpose
               "mek" 'csv-kill-fields
               "mes" 'csv-sort-fields
               "meS" 'csv-reverse-region
               "mef" 'csv-align-fields
               "meF" 'csv-unalign-fields)
  )

;;; csv.el ends here
