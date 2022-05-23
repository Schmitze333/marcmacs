;;;; Custom function definitions ;;;;

(defun transparency (value)
  "Set the frame transperancy (0=transp, 100=opaque)"
  (interactive "nTransparency Value 0 - 100 (opaque):")
  (set-frame-parameter (selected-frame) 'alpha value))



(defun ms/google-it (search-string)
  (interactive "sWhat you looking for? ")
  (xwidget-webkit-browse-url (concat "https://www.google.com" "/search?q=" (url-hexify-string
									    search-string))))
