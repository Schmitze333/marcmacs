;;;; Entertainment Stuff ;;;;

;;; Reading epub
(use-package nov)

;;; Play all sorts of media ;;;
(use-package mpv)
(use-package emms
  :config
  (require 'emms-setup)
  (emms-all)
  (emms-default-players)
  (setq emms-source-file-default-directory "~/Music/Musik")
  (keymap-global-set "s-e" 'emms))

;;; Show media info in the mode-line ;;;
(use-package emms-mode-line-cycle
  :after emms
  :config
  (emms-mode-line-mode t))
