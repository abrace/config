(setq inferior-lisp-program "/usr/local/bin/sbcl")
(load (expand-file-name "~/quicklisp/slime-helper.el"))

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms
   (quote
    (("\\`/[^/]*:\\([^/]*/\\)*\\([^/]*\\)\\'" "/var/folders/cq/b97mkllj0z58tzn3lk43ch3000010f/T/\\2" t)
     (".*" "~/.emacs-tmp/" t))))
 '(backup-directory-alist (quote (("." . "~/.emacs-tmp"))))
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(display-buffer-alist
   (quote
    (("\\\\*Completions\\\\*"
      (display-buffer-pop-up-window display-buffer-use-some-window)
      (inhibit-same-window . t)))))
 '(evil-emacs-state-modes
   (quote
    (archive-mode bbdb-mode biblio-selection-mode bookmark-bmenu-mode bookmark-edit-annotation-mode browse-kill-ring-mode bzr-annotate-mode calc-mode cfw:calendar-mode completion-list-mode custom-theme-choose-mode debugger-mode delicious-search-mode desktop-menu-blist-mode desktop-menu-mode doc-view-mode dvc-bookmarks-mode dvc-diff-mode dvc-info-buffer-mode dvc-log-buffer-mode dvc-revlist-mode dvc-revlog-mode dvc-status-mode dvc-tips-mode ediff-mode ediff-meta-mode efs-mode Electric-buffer-menu-mode emms-browser-mode emms-mark-mode emms-metaplaylist-mode emms-playlist-mode ess-help-mode etags-select-mode fj-mode gc-issues-mode gdb-breakpoints-mode gdb-disassembly-mode gdb-frames-mode gdb-locals-mode gdb-memory-mode gdb-registers-mode gdb-threads-mode gist-list-mode git-commit-mode git-rebase-mode gnus-article-mode gnus-browse-mode gnus-group-mode gnus-server-mode gnus-summary-mode google-maps-static-mode ibuffer-mode jde-javadoc-checker-report-mode magit-cherry-mode magit-diff-mode magit-log-mode magit-log-select-mode magit-popup-mode magit-popup-sequence-mode magit-process-mode magit-reflog-mode magit-refs-mode magit-revision-mode magit-stash-mode magit-stashes-mode magit-status-mode magit-mode magit-branch-manager-mode magit-commit-mode magit-key-mode magit-rebase-mode magit-wazzup-mode mh-folder-mode monky-mode mu4e-main-mode mu4e-headers-mode mu4e-view-mode notmuch-hello-mode notmuch-search-mode notmuch-show-mode notmuch-tree-mode occur-mode org-agenda-mode pdf-outline-buffer-mode pdf-view-mode proced-mode rcirc-mode rebase-mode recentf-dialog-mode reftex-select-bib-mode reftex-select-label-mode reftex-toc-mode sldb-mode slime-inspector-mode slime-thread-control-mode slime-xref-mode sr-buttons-mode sr-mode sr-tree-mode sr-virtual-mode tar-mode tetris-mode tla-annotate-mode tla-archive-list-mode tla-bconfig-mode tla-bookmarks-mode tla-branch-list-mode tla-browse-mode tla-category-list-mode tla-changelog-mode tla-follow-symlinks-mode tla-inventory-file-mode tla-inventory-mode tla-lint-mode tla-logs-mode tla-revision-list-mode tla-revlog-mode tla-tree-lint-mode tla-version-list-mode twittering-mode urlview-mode vc-annotate-mode vc-dir-mode vc-git-log-view-mode vc-hg-log-view-mode vc-svn-log-view-mode vm-mode vm-summary-mode w3m-mode wab-compilation-mode xgit-annotate-mode xgit-changelog-mode xgit-diff-mode xgit-revlog-mode xhg-annotate-mode xhg-log-mode xhg-mode xhg-mq-mode xhg-mq-sub-mode xhg-status-extra-mode)))
 '(evil-ex-search-highlight-all nil)
 '(evil-ex-search-persistent-highlight nil)
 '(evil-mode t)
 '(evil-move-beyond-eol t)
 '(evil-overriding-maps
   (quote
    ((Buffer-menu-mode-map)
     (color-theme-mode-map)
     (comint-mode-map)
     (compilation-mode-map)
     (grep-mode-map)
     (dictionary-mode-map)
     (ert-results-mode-map . motion)
     (Info-mode-map . motion)
     (speedbar-key-map)
     (speedbar-file-key-map)
     (speedbar-buffers-key-map)
     (slime-mode-indirect-map))))
 '(evil-search-module (quote evil-search))
 '(evil-want-C-u-scroll t)
 '(global-paren-face-mode t)
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (evil-paredit evil paredit paren-face)))
 '(paren-face-modes
   (quote
    (lisp-mode emacs-lisp-mode lisp-interaction-mode ielm-mode scheme-mode inferior-scheme-mode clojure-mode cider-repl-mode nrepl-mode arc-mode inferior-arc-mode slime-repl-mode)))
 '(show-paren-mode t)
 '(tab-always-indent (quote complete))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "White" :foreground "Black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "nil" :family "Menlo"))))
 '(cursor ((t (:background "gray70"))))
 '(font-lock-comment-face ((t (:foreground "SkyBlue3"))))
 '(font-lock-function-name-face ((t (:foreground "black"))))
 '(font-lock-keyword-face ((t (:foreground "dark slate blue"))))
 '(font-lock-string-face ((t (:foreground "coral4"))))
 '(font-lock-type-face ((t (:foreground "dark slate blue"))))
 '(parenthesis ((t (:foreground "gray40"))))
 '(show-paren-match ((t (:background "light goldenrod")))))

(font-lock-add-keywords
 'lisp-mode
 '(("(\\(check-\\(\\s_\\|\\w\\)*\\)" 1 font-lock-keyword-face)
   ("(\\(assert-\\(\\s_\\|\\w\\)*\\)" 1 font-lock-keyword-face)
   ("(\\(a\\(?:\\(?:bo\\|sse\\)rt\\)\\|c\\(?:error\\|heck-type\\)\\|error\\|signal\\|warn\\)\\_>"
    (1 font-lock-keyword-face))))

(setq-default line-spacing 4)
(setq-default indent-tabs-mode nil)
;; (menu-bar-mode -1)


;;; Paredit hooks for Lisp-like modes.

(defun both-paredit-modes ()
  (paredit-mode)
  (evil-paredit-mode))

;; Should include eval-expression-minibuffer-setup-hook and ielm-mode-hook?
(add-hook 'emacs-lisp-mode-hook #'both-paredit-modes)
(add-hook 'lisp-mode-hook #'both-paredit-modes)
(add-hook 'lisp-interaction-mode-hook #'both-paredit-modes)
(add-hook 'scheme-mode-hook #'both-paredit-modes)
;; Using both-paredit-modes with slime-repl-mode causes Evil mode not to work in
;; the REPL.
(add-hook 'slime-repl-mode-hook #'paredit-mode)

;(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

(define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line)
(define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)

;; Make x act on selections.
(define-key evil-visual-state-map "x" 'evil-paredit-delete)

;; make cw respect evil-want-change-word-to-end
(add-to-list 'evil-change-commands #'evil-paredit-change)

(global-set-key (kbd "C-c m") 'show-paren-mode)

(defun toggle-cursor ()
  (interactive)
  (setq cursor-type (not cursor-type))
  (force-window-update)) ; otherwise cursor doesn't change until you move it

(global-set-key (kbd "C-c h") 'toggle-cursor)


;;; Compilation
;;; Commands for compiling with maximal debug settings by calling the Slime commands
;;; with the prefix argument '(4), which would be produced by entering C-u before
;;; calling the Slime command interactively.

(define-key slime-mode-map (kbd "C-c c")
  (lambda ()
    "Compile the current toplevel form with maximal debug settings."
    (interactive)
    (slime-compile-defun '(4))))

(define-key slime-mode-map (kbd "C-c k")
  (lambda ()
    "Compile and load the buffer’s file with maximal debug settings."
    (interactive)
    (slime-compile-and-load-file '(4))))


(define-key slime-repl-mode-map (kbd "C-c d") 'slime-repl-delete-current-input)

(eval-after-load 'slime
  '(progn
     (define-key slime-mode-indirect-map (kbd "M-?") nil)))
(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "M-?") 'paredit-convolute-sexp)))
(eval-after-load 'evil
  '(progn
     (define-key evil-normal-state-map (kbd "M-.") nil)))

(add-to-list 'slime-contribs 'slime-cl-indent)
(command-execute 'slime-setup) ; needed for slime-cl-indent to take effect


;;; acb-convert-if-to-cond
;;; assumes only one else form, Common Lisp-style

(defun acb-convert-if-to-cond ()
  (interactive)
  (save-excursion
    (when (acb-find-if)
      (acb-replace-symbol-with-cond)
      (acb-wrap-forms 2) ; test and then
      (forward-sexp)
      (acb-wrap-forms 1) ; else
      (right-char)
      (insert "t\n")
      (mark-defun)
      (indent-region (region-beginning) (region-end))
      (deactivate-mark))))

(defun acb-find-if ()
  (right-char) ; could be on starting paren
  (if (string= (thing-at-point 'symbol) "if")
      (point)
    (search-backward "if")))

(defun acb-replace-symbol-with-cond ()
  (let ((bounds (bounds-of-thing-at-point 'symbol)))
    (delete-region (car bounds) (cdr bounds))
    (insert "cond")))

(defun acb-wrap-forms (n)
  (skip-chars-forward " \t\n")
  (mark-sexp n)
  (paredit-wrap-round)
  (left-char))


;; SLIME repl gets hidden now that slime-setup is executed.
;; (command-execute 'split-window-right)
;; (command-execute 'other-window)
;; (command-execute 'slime)

(command-execute 'toggle-frame-maximized)
