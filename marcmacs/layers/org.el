;;;; Org-Mode ;;;;

;; Always redisplay images when org-babel executed
;; useful e.g. for usage with mermaid.
(eval-after-load 'org
  (add-hook 'org-babel-after-execute-hook #'org-redisplay-inline-images))

;;; Modern Look & Feel
(use-package org-modern
  :hook (org-mode . org-modern-mode)
  :config
  ;; (add-hook 'org-mode-hook #'org-modern-mode)
  (add-hook 'org-agenda-finalize-hook #'org-modern-agenda)
  (org-modern-mode))

(use-package ox-gfm
  :after org)

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "~/org-roam")
  (org-roam-completion-everywhere t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         :map org-mode-map
         ("C-M-i" . completion-at-point)
         :map org-roam-dailies-map
         ("Y" . org-roam-dailies-capture-yesterday)
         ("T" . org-roam-dailies-capture-tomorrow))
  :bind-keymap
  ("C-c n d" . org-roam-dailies-map)
  :config
  ;;; Org-Roam
  (require 'org-roam-dailies)
  (org-roam-db-autosync-mode))

;; MermaidJS in Org files
(use-package ob-mermaid
  :defer t
  :custom
  (ob-mermaid-cli-path "/opt/homebrew/bin/mmdc"))

;; Edit Mermaid files
(use-package mermaid-mode
  :defer t)
