;;; csv.el --- comma separated text files

;;; Commentary:
;;; I don't open these in Emacs very much, but when I do I really really want this.

;;; Code:

(use-package csv-mode
  :bind-prefix-local
  ("e" '(:ignore t :which-key "edit")
   "et" 'csv-transpose
   "ek" 'csv-kill-fields
   "es" 'csv-sort-fields
   "eS" 'csv-reverse-region
   "ef" 'csv-align-fields
   "eF" 'csv-unalign-fields))

;;; csv.el ends here
