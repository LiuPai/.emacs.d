;;; package -- Summary:

;;; Commentary:

;;; CODE:


;; Defined functions
(require 'windmove)
(require 'uuid)

;; Defined variables
(defvar mode-line-cleaner-alist '(
				  (auto-complete-mode . "")
				  (anzu-mode . "")
				  (eldoc-mode . "")
				  (abbrev-mode . "")
				  (fic-mode . "")
				  (view-mode . "")
				  (color-identifiers-mode . "")
				  (auto-indent-mode . "")
				  (yas-minor-mode . "")
				  (paredit-mode . "")
				  (paredit-everywhere-mode . "")
				  (undo-tree-mode . "")
				  (projectile-mode . "")
				  (ggtags-mode . "")
				  (cmake-project-mode . "")
				  (magit-auto-revert-mode . "")
				  (smart-cursor-color-mode . ""))
  "Alist for `clean-mode-line'.

When you add a new element to the alist, keep in mind that you
must pass the correct minor/major mode symbol and a string you
want to use in the modeline *in lieu of* the original.")



(defun toggle-window-split ()
  "Switch Window split mode."
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))

(defun toggle-frame-split ()
  "If the frame is split vertically, split it horizontally or vice versa.
Assumes that the frame is only split into two."
  (interactive)
  (unless (= (length (window-list)) 2) (error "Can only toggle a frame split in two"))
  (let ((split-vertically-p (window-combined-p)))
    (delete-window) ; closes current window
    (if split-vertically-p
        (split-window-horizontally)
      (split-window-vertically)) ; gives us a split with the other window twice
    (switch-to-buffer nil))) ; restore the original window in this part of the frame

(defun window-toggle-split-direction ()
  "Switch window split from horizontally to vertically, or vice versa.

i.e. change right window to bottom, or change bottom window to right."
  (interactive)
  (require 'windmove)
  (let ((done))
    (dolist (dirs '((right . down) (down . right)))
      (unless done
        (let* ((win (selected-window))
               (nextdir (car dirs))
               (neighbour-dir (cdr dirs))
               (next-win (windmove-find-other-window nextdir win))
               (neighbour1 (windmove-find-other-window neighbour-dir win))
               (neighbour2 (if next-win (with-selected-window next-win
                                          (windmove-find-other-window neighbour-dir next-win)))))
          ;;(message "win: %s\nnext-win: %s\nneighbour1: %s\nneighbour2:%s" win next-win neighbour1 neighbour2)
          (setq done (and (eq neighbour1 neighbour2)
                          (not (eq (minibuffer-window) next-win))))
          (if done
              (let* ((other-buf (window-buffer next-win)))
                (delete-window next-win)
                (if (eq nextdir 'right)
                    (split-window-vertically)
                  (split-window-horizontally))
                (set-window-buffer (windmove-find-other-window neighbour-dir) other-buf))))))))

(defun uuid-insert ()
  "Insert new random uuid into current position."
  (interactive)
  (insert (upcase (uuid-string))))
(defun uuid-delete ()
  "Delete uuid at point."
  (interactive)
  (kill-word 5))

(defun clean-mode-line ()
  "Clean mode line display."
  (interactive)
  (loop for cleaner in mode-line-cleaner-alist
        do (let* ((mode (car cleaner))
                  (mode-str (cdr cleaner))
                  (old-mode-str (cdr (assq mode minor-mode-alist))))
             (when old-mode-str
               (setcar old-mode-str mode-str))
             ;; major mode
             (when (eq mode major-mode)
               (setq mode-name mode-str)))))

(defun uuid-create ()
  "Create a new UUID object.

Using version 4 (random) because it's likely easiest to
implement, plus it satisifies the privicy concerns of
wackos."
  (let ((bits
         (apply           ; Note: Could use bit-vector under xemacs,
          'vector         ; but gnuemacs doesn't have it.
          (loop for i upto 127 collect (uuid-random-bit)))))
    ;; Version field: byte 7, bits 0-4 set to 4
    (aset bits 48 0)
    (aset bits 49 1)
    (aset bits 50 0)
    (aset bits 51 0)
    ;; byte 9, bits 0-4 set to 8,9,A,B
    (aset bits 72 1)
    (aset bits 73 0)
    bits))
(defun lock-all ()
  "Lock all terminal."
  (interactive)
  (call-process "vlock" nil nil nil "-na"))

(defun time-stamp-insert ()
  "Insert time stamp at point."
  (interactive)
  (insert (format-time-string "%Y-%m-%d %H:%M:%S.%N %Z" nil t)))

;; org-todo
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
;; bbdb
(defun bbdb-vcard-import-directory (directory)
  "Import vcards from directory."
  (interactive)
  (let ((vcardlist (directory-files directory t "[^\.$]" nil))
        value)
    (dolist (vcard vcardlist value)
      (bbdb-vcard-import-file vcard))))

;;{{{ Shortcut a few commonly used functions
(defalias 'cr            'comment-region)
(defalias 'ucr           'uncomment-region)
(defalias 'eb            'eval-buffer)
(defalias 'er            'eval-region)
(defalias 'ee            'eval-expression)
;;}}}

;;; 04_user-define.el ends here
