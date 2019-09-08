(ns armstrong-numbers)


(defn digits [num]
  (loop [n num]
    (if (< n 10)
      [n]
      (do (conj (digits (/ (- num (rem num 10)) 10)) (rem num 10))))))

(defn power-of [num pow]
  (reduce * (repeat pow num)))

(defn sum-of [num]
  (reduce + num))

(defn sum-power [num pow]
  (sum-of (map #(power-of % pow) (digits num))))

(defn armstrong? [num] ;; <- arglist goes here
  (= (sum-power num (count (digits num))) num))
