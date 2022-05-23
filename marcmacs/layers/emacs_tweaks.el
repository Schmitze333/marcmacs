;;;; Configure emacs internal stuff ;;;;

;;; Emacs
(use-package emacs
  :init
  ;; TAB cycle if there are only few candidates
  (setq completion-cycle-threshold 3)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setq tab-always-indent 'complete)
  (setq ediff-merge-split-window-function #'split-window-vertically)
  (if (fboundp 'xwidget-webkit-browse-url)
      (setq browse-url-browser-function #'xwidget-webkit-browse-url))

  :bind
  ("s-/" . #'hippie-expand)
  ("s-," . #'previous-buffer)
  ("s-." . #'next-buffer)
  ("C-x G" . #'ms/google-it))

;;; Dired
(use-package dired
  :ensure nil
  :bind
  (("M-g d" . dired-jump)
   (:map dired-mode-map
   ("-" . dired-up-directory))))
