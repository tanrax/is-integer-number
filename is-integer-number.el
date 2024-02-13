(require 'seq)

;; Test
;; Run M-x ert

(ert-deftest test-is-integer-number ()
  (seq-doseq (i (number-sequence 0 100))
    (should (is-integer-number i))))

(ert-deftest test-is-integer-number-float ()
  (seq-doseq (i (number-sequence 0 100))
    (should (is-integer-number (float i)))))

(ert-deftest test-is-integer-number-float-false ()
  (seq-doseq (i (number-sequence 0 100))
    (should (not (is-integer-number (+ i (/ (1+ (random 8)) 10.0)))))))

;; Code

(defun is-integer-number (num)
  "Return t if NUM is an integer number, nil otherwise."
  (or (zerop num)
      (integerp num)
      (and (floatp num) (equal num (float (truncate num))))))
