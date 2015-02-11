(require 'package)
(package-initialize)

;; My packages
(setq prelude-packages (append '(
                                 fill-column-indicator
                                 ) prelude-packages))

;; Install my packages
(prelude-install-packages)
