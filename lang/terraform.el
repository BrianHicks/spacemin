;;; terraform.el --- edit .tf and .hcl files

;;; Commentary:

;;; Code:

(use-package hcl-mode
  :mode "\\.hcl\\'")

(use-package terraform-mode
  :mode "\\.tf\\'")

(provide 'terraform)

;;; terraform.el ends here
