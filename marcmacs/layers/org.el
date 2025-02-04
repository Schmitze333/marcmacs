;;;; Org-Mode ;;;;

(use-package ob-restclient)

(use-package org
  :config
  (define-key global-map (kbd "C-x j") #'org-capture)
  (define-key global-map (kbd "s-a") #'org-agenda)
  ;; active Babel languages
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((shell . t)
     (emacs-lisp . t)
     (restclient . t)))

  ;; capture template
  (setq org-directory "~/org")
  (setq org-capture-templates
	`(
	  ("g" "GTD-Eingang" entry (file+headline, (concat org-directory "/GTD.org") "Eingang") "** %?")
	  ("t" "Todo" entry (file+headline ,(concat org-directory "/captures.org") "Inbox") "** TODO %?\n  %i\n  %a")
	  ("i" "Idea" entry (file+headline ,(concat org-directory "/captures.org") "Ideas") "** 💡: %?\n  %i\n  %a")
	  ("r" "Template for retrospective stuff")
	  ("rg" "Retro good" item (file+regexp ,(concat org-directory "/captures.org") "** Good"))
	  ("rb" "Retro bad" item (file+regexp ,(concat org-directory "/captures.org") "** Bad"))
	  ("rt" "Retro try" item (file+regexp ,(concat org-directory "/captures.org") "** Try"))
	  ("rp" "Retro puzzles" item (file+regexp ,(concat org-directory "/captures.org") "** Puzzles"))
	  ("w" "Templates to clock-in/out work")
	  ("wi" "Clock-in work" plain (file+olp+datetree ,(concat org-directory "/captures.org") "Worktime")
	   "" :clock-in t :clock-keep t :tree-type "week" :immediate-finish t)
	  ("wo" "Clock-out work"  plain (file+olp+datetree ,(concat org-directory "/captures.org") "Worktime")
	   "" :after-finalize (org-clock-out) :tree-type "week" :immediate-finish t)
	  ("wj" "Work-journal"  entry (file+headline ,(concat org-directory "/work.org") "Work items") "** WORK_TODO %? %U\n %i\n %a")
	  ("j" "Jounal" entry (file+datetree ,(concat org-directory "/journal.org")) "* %?\nEntered on %U\n  %i\n  %a")
	  ))

  (setq org-agenda-custom-commands
	'(
	  ("w" "Work tasks"
	   ((todo "WORK_WAITING")
	    (todo "WORK_TODO"))))))


;; ALWAYS redisplay images when org-babel executed
;; useful e.g. for usage with mermaid.
(eval-after-load 'org
  (add-hook 'org-babel-after-execute-hook #'org-redisplay-inline-images))

;;; Modern Look & Feel
(use-package org-modern
  :hook (org-mode . org-modern-mode)
  :custom
  (org-modern-star 'replace)
  :config
  (add-hook 'org-agenda-finalize-hook #'org-modern-agenda))

(use-package ox-gfm
  :after org)

(use-package ox-slack
  :after org)

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "~/org-roam")
  (org-roam-completion-everywhere t)
  :bind (("s-r l" . org-roam-buffer-toggle)
         ("s-r f" . org-roam-node-find)
         ("s-r i" . org-roam-node-insert)
         :map org-mode-map
         ("C-M-i" . completion-at-point)
         :map org-roam-dailies-map
         ("Y" . org-roam-dailies-capture-yesterday)
         ("T" . org-roam-dailies-capture-tomorrow))
  :bind-keymap
  ("s-r d" . org-roam-dailies-map)
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

(add-to-list 'load-path (concat user-emacs-directory "el-igo"))
(with-eval-after-load "org"
  (require 'igo-org)
  (igo-org-setup))
