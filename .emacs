;;; Don't show multiple files as file<n> but instead file<dirname>
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-after-kill-buffer-p t)


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(describe-char-unicodedata-file "/home/gustav/elisp/UnicodeData.txt")
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen (quote t))
 '(line-number-display-limit 100000000)
 '(next-line-add-newlines nil)
 '(require-final-newline (quote ask))
 '(show-trailing-whitespace (quote t))
 '(stgit-default-show-patch-names nil)
 '(tab-width 4)
 '(tool-bar-mode nil nil (tool-bar))
 '(truncate-partial-width-windows nil))

(defun kill-query ()
 (y-or-n-p "Really kill Emacs? "))
(add-hook 'kill-emacs-query-functions 'kill-query)

(setq minibuffer-max-depth nil)

(setq load-path (cons "/home/tholmber/emacs/vt-elisp" load-path))
(load "vt-elisp-start")

(setq load-path (cons "/home/tholmber/emacs" load-path))
(autoload 'dml-mode "dml-mode" "DML mode" t)
(add-to-list 'auto-mode-alist '("\\.dml\\'" . dml-mode))

;; git/stgit
;(setq load-path (cons "/home/th/progs/stgit/contrib/" load-path))
;(setq load-path (cons "/home/th/progs/git/git-1.6.4.2/" load-path))
;(when (>= emacs-major-version 22)
;  (require 'stgit))
;(when (>= emacs-major-version 22)
;  (require 'git-utils))
;;(when (= emacs-major-version 22)
;;  (require 'repair-vc-git))
;;(when (>= emacs-major-version 22)
;;  (load "git-grep"))

;(setq load-path (cons "/usr/share/doc/git-core/contrib/emacs" load-path))
;(require 'git)

(defun linux-c-mode ()
  "Linux/BSD/Solaris/Simics c-mode."
  (interactive)
  (c-mode)
  (font-lock-mode 1)
  (setq c-indent-level 8)
  (setq c-brace-imaginary-offset 0)
  (setq c-brace-offset -8)
  (setq c-argdecl-indent 8)
  (setq c-label-offset -8)
  (setq c-continued-statement-offset 8)
  (setq indent-tabs-mode nil)
  (setq tab-width 4)
  (c-set-style "linux"))

(setq auto-mode-alist (cons '(".*/simics.*/.*\\.[ch]$" . linux-c-mode)
                            auto-mode-alist))

(setq diff-switches "-u")

(global-font-lock-mode 1)
(global-set-key [M-return] 'goto-line)

(setq perl-brace-offset 8)
(setq perl-continued-brace-offset 8)
(setq perl-continued-statement-offset 8)
(setq perl-label-offset 8)
(setq perl-brace-imaginary-offset 8)
(setq perl-brace-offset 8)

(setq show-trailing-whitespace t)


;; disable toolbar
(tool-bar-mode -1)
(blink-cursor-mode -1)

(setq compilation-scroll-output t)

;; verilog mode
(defun prepend-path ( my-path )
(setq load-path (cons (expand-file-name my-path) load-path)))
(defun append-path ( my-path )
(setq load-path (append load-path (list (expand-file-name my-path)))))
;; Look first in the directory ~/elisp for elisp files
(prepend-path "~/elisp")
;; Load verilog mode only when needed
(autoload 'verilog-mode "verilog-mode" "Verilog mode" t )
;; Any files that end in .v should be in verilog mode
(setq auto-mode-alist (cons '("\\.v\\'" . verilog-mode) auto-mode-alist))
;; Any files in verilog mode should have their keywords colorized
(add-hook 'verilog-mode-hook '(lambda () (font-lock-mode 1)))

;(setq directory-abbrev-alist
;      '(("/.automount/thelma/root/disk01" . "/home")))


(put 'downcase-region 'disabled nil)

(put 'upcase-region 'disabled nil)
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#ffffff" :foreground "#141312" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

(defun wr-simgen-mode ()
  "C mode with adjusted defaults for use with simcis."
  (interactive)
  (simgen-mode)
  (setq tab-width 4)
  (setq show-trailing-whitespace t)
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 4))
(setq auto-mode-alist
      (cons '("\\.sg$" . wr-simgen-mode)
            auto-mode-alist))
