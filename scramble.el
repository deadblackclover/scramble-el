;;; scramble.el --- Generate random states for Rubik's cubes puzzles

;; Author: DEADBLACKCLOVER <deadblackclover@protonmail.com>
;; Version: 0.1
;; URL: https://github.com/deadblackclover/scramble-el
;; Package-Requires: ((emacs "25.1"))

;; Copyright (c) 2021, DEADBLACKCLOVER. This file is
;; licensed under the GNU General Public License version 3 or later. See
;; the LICENSE file.

;;; Commentary:

;; Generate random states for Rubik's cubes puzzles

;;; Code:
(defgroup scramble nil
  "Generate random states for Rubik's cubes puzzles"
  :group 'scramble)

(defvar scramble-string ""
  "Current set of movements.")

(defvar scramble-new-move ""
  "New move.")

(defvar scramble-prev-move ""
  "Previous move.")

(defvar scramble-moves-list (list "R" "R'" "R2" "L" "L'" "L2" "U" "U'" "U2" "D" "D'" "D2" "F" "F'" "F2" "B" "B'" "B2")
  "List of movements.")

(defun scramble-length ()
  "Number of movements."
  (+ (random 4) 25))

(defun scramble-random-move (list)
  "Return random movement of LIST."
  (nth (random (1- (1+ (length list)))) list))

(defun scramble-generate-string (counter)
  "Generate random states for Rubik's cubes puzzles.  Argument COUNTER."
  (if (not (eq counter 0))
      (progn
        (setq scramble-new-move (scramble-random-move scramble-moves-list))
        (if (string= scramble-new-move scramble-prev-move)
            (scramble-generate-string counter)
          (progn
            (setq scramble-prev-move scramble-new-move)
            (setq scramble-string (concat scramble-string " " scramble-new-move))
            (scramble-generate-string (- counter 1)))))))

(defun scramble-generate ()
  "Show random states for Rubik's cubes puzzles."
  (interactive)
  (setq scramble-string "")
  (scramble-generate-string (scramble-length))
  (message scramble-string))

(global-set-key (kbd "C-x C-s") 'scramble-generate)

(provide 'scramble)
;;; scramble.el ends here
