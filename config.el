;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Sebastian Callh"
      user-mail-address "sebastian.callh@gmailcom")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-zenburn)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; ==============================
;;      Personal config
;; ==============================

;; Needed for magit forge
(setq auth-sources '("~/.authinfo"))

(setq line-number-mode 'nil)

;;      Custom keybinds
;; ==============================

(defun org-visit ()
  (interactive)
  (find-file (concat org-directory "/main.org")))

(defun kill-current-buffer ()
  "Kills the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))

(global-set-key (kbd "C-c f o") 'org-visit)
(global-set-key (kbd "C-x k") 'kill-current-buffer)
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "M-;") 'comment-dwim)

(use-package! avy
  :config
  (setq avy-all-windows t)
  :bind
  ("C-:" . avy-goto-char))

;;         Locale
;; ==============================

(setq system-time-locale "C")

;;         org-babel
;; ==============================

(after! ess
  (setq inferior-julia-program "/usr/local/bin/julia"))

(after! org
  (setq org-startup-folded t))

;;            tramp
;; ==============================

(use-package! tramp
  :config
  (setq recentf-auto-cleanup 'never)
  (setq tramp-verbose 3))


;;          projectile
;; ==============================
;; We disable projectile mode line since
;; it slows everything down when used together with tramp
(use-package! projectile
  :config
  (setq projectile-mode-line "Projectile"))


;; this might fuck stuff up when using external display
(set-face-attribute 'default nil :height 130)

(setq fancy-splash-image "~/.doom.d/images/lambda.png")
