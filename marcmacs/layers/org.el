;;;; Org-Mode ;;;;
(use-package org-modern
  :defer t
  :config
  (add-hook 'org-mode-hook #'org-modern-mode)
  (add-hook 'org-agenda-finalize-hook #'org-modern-agenda))

(use-package ox-gfm
  :after org)
