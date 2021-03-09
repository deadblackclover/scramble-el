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

(provide 'scramble)

;;; scramble.el ends here
