;;;; Org-Mode ;;;;
(use-package org-modern
  :after org-mode
  :config
  (add-hook 'org-mode-hook #'org-modern-mode)
  (add-hook 'org-agenda-finalize-hook #'org-modern-agenda)
  (org-modern-mode))

(use-package ox-gfm
  :after org)
