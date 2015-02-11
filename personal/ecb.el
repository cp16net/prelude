;;; Package --- loading ecb module
;;; Commentary:
;;; Set up the paths for ecb

;;; code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(font-use-system-font t)
 '(ecb-layout-name "left3")
 '(ecb-tip-of-the-day nil)
 '(line-number-mode t)
 '(column-number-mode t)
 '(ecb-auto-activate t)
 '(completion-ignored-extensions (quote (".bin" ".elc" ".pyc")))
 '(ecb-source-file-regexps (quote ((".*" ("\\(^\\(\\.\\|#\\)\\|\\(~$\\|\\.\\(pyc\\|elc\\|obj\\|o\\|class\\|lib\\|dll\\|a\\|so\\|cache\\)$\\)\\)") ("^\\.\\(emacs\\|gnus\\)$")))))
 '(ecb-layout-window-sizes
   (quote
    (("left3"
      (ecb-directories-buffer-name 0.1828358208955224 . 0.5925925925925926)
      (ecb-sources-buffer-name 0.1828358208955224 . 0.14814814814814814)
      (ecb-methods-buffer-name 0.1828358208955224 . 0.24691358024691357)))))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(cond
 ((string-equal system-type "darwin")   ; Mac OS X
  (setq ecb-source-path
        (quote
         (("~/code/private/Cloud-Database" "Cloud-Database"))))
  )
 ((string-equal system-type "gnu/linux") ; linux
  (setq ecb-source-path
        (quote
         (("~/code" "code")
          ("/home/cp16net/code/etherpy" "etherpy")
          )))
  )
 )

(add-to-list 'load-path "~/.emacs.d/sites-lisp/ecb")
(require 'ecb)
(semantic-mode 1)

;;Give the methods buffer a buffer-menu like feeling
(add-hook 'ecb-methods-buffer-after-create-hook
          '(lambda ()
             (local-set-key (kbd "\C-x\C-r") 'ecb-rebuild-methods-buffer)
             (local-set-key (kbd "f") 'my-ecb-select-tree-item)
             (local-set-key (kbd "q") 'my-ecb-quit-window)
             (local-set-key (kbd "p") 'my-ecb-prev-tree-item)
             (local-set-key (kbd "n") 'my-ecb-next-tree-item)))


;;; ecb.el ends here
