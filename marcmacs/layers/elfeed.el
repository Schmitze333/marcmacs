;;;; Configure Elfeed & Co ;;;;
(use-package elfeed
  :init
  (setq elfeed-feeds
	'(
	  ("http://nullprogram.com/feed/" blog)
	  ("https://planet.emacslife.com/atom.xml" emacs blog)
	  ("https://martinfowler.com/updates.atom" martinfowler updates)
	  ("https://martinfowler.com/bliki/bliki.atom" martinfowler bliki)
	  ("https://feed.infoq.com/RSS/articles/" innoq blog)
	  ("https://feeds.simplecast.com/7y1CbAbN" maintainable podcast)
	  ("https://innoq.podigee.io/feed/aac" innoq podcast)
	  ("https://protesilaos.com/codelog.xml" patros blog)
	  ("https://systemcrafters.net/rss/news.xml" emacs dawil blog)
	  )))
