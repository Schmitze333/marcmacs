;;;; Entertainment Stuff ;;;;

;;; Reading epub
(use-package nov)

;;; Play all sorts of media ;;;
(use-package mpv)
(use-package emms
  :after hydra
  :config
  (require 'emms-setup)
  (emms-all)
  (emms-default-players)
  (setq emms-source-file-default-directory "~/Music/Musik")

  ;;; Make a nice interface
  (require 'hydra)
  (defhydra emms-hydra (global-map "s-e")
    "EMMS"
    ("e" emms)
    ("SPC" emms-pause)
    ("n" emms-next)
    ("p" emms-previous))
  )

;;; Show media info in the mode-line ;;;
(use-package emms-mode-line-cycle
  :after emms
  :config
  (emms-mode-line-mode t))
