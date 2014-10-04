;;; package -- Summary:

;;; Commentary:

;;; CODE:

(add-hook 'after-change-major-mode-hook 'clean-mode-line)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "red"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "dark orange"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "gold"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "green yellow"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "green"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "medium spring green"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "cyan"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "blue"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "dark violet"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "OliveDrab2"))))
 '(window-number-face ((t (:foreground "#A59ACA"))))
 '(success ((t (:foreground "#69821B"))))
 )

;;; 07_visual.el ends here
