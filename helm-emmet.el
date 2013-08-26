;;; helm-emmet.el --- helm sources for emmet-mode's snippets

;; Copyright (C) 2013 Yasuyuki Oka <yasuyk@gmail.com>

;; Author: Yasuyuki Oka <yasuyk@gmail.com>
;; Version: DEV
;; URL: https://github.com/yasuyk/helm-emmet
;; Package-Requires: ((helm "1.0") (emmet-mode "1.0.2"))
;; Keywords: convenience, helm, emmet

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Provides helm sources for emmet-mode

;;; Usage:

;;     (require 'helm-emmet) ;; Not necessary if using ELPA package

;;; Code:

(require 'helm)
(require 'emmet-mode)

(defvar helm-emmet-html-snippets-hash
  (gethash "snippets" (gethash "html" emmet-snippets)))

(defvar helm-emmet-html-snippets-keys
  (loop for k being hash-key in helm-emmet-html-snippets-hash collect k))

(defvar helm-emmet-html-aliases-hash
  (gethash "aliases" (gethash "html" emmet-snippets)))

(defvar helm-emmet-html-aliases-keys
  (loop for k being hash-key in helm-emmet-html-aliases-hash collect k))

(defvar helm-emmet-css-snippets-hash
  (gethash "snippets" (gethash "css" emmet-snippets)))

(defvar helm-emmet-css-snippets-keys
  (loop for k being hash-key in helm-emmet-css-snippets-hash collect k))

(define-helm-type-attribute 'emmet
  '((action . (("Preview" . (lambda (c)
                              (insert c)
                              (call-interactively 'emmet-expand-line)))
               ("Expand" . (lambda (c)
                             (insert c)
                             (emmet-expand-line c)))))))
;; TODO persistent-action

(defvar helm-source-emmet-html-snippets
  '((name . "emmet html snippets")
    (candidates . helm-emmet-html-snippets-keys)
    (type . emmet))
  "Show emmet-mode's html snippets.")

(defvar helm-source-emmet-html-aliases
  '((name . "emmet html aliases")
    (candidates . helm-emmet-html-aliases-keys)
    (type . emmet))
  "Show emmet-mode's html aliases.")

(defvar helm-source-emmet-css-snippets
  '((name . "emmet css snippets")
    (candidates . helm-emmet-css-snippets-keys)
    (type . emmet))
  "Show emmet-mode's css snippets.")

;;;###autoload
(defun helm-emmet ()
  "Helm to preview or expand emmet-mode's snippets."
  (interactive)
  (helm-other-buffer '(helm-source-emmet-html-snippets
                       helm-source-emmet-html-aliases
                       helm-source-emmet-css-snippets)
                     "*helm emmet*"))

(provide 'helm-emmet)

;; Local Variables:
;; coding: utf-8
;; End:

;;; helm-emmet.el ends here
