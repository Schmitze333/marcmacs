;;;; Supercollider ;;;;

;; used to visit documentation
;; (use-package w3m)

(use-package sclang
  :load-path "/Users/marcschmitz/Library/Application Support/SuperCollider/downloaded-quarks/scel/el"
  :init
  (setq exec-path (append exec-path '("/Applications/SuperCollider.app/Contents/MacOS/"))))
(use-package sclang-extensions)
(use-package sclang-snippets)
