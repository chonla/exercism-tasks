(ns armstrong-numbers)

(defn digitize [num]
  (map #(- (int %) (int \0)) (str num)))

(defn power [num pow]
  (reduce * (repeat pow num)))

(defn sum-power [digits pow]
  (reduce + (map #(power % pow) digits)))

(defn armstrong? [num] ;; <- arglist goes here
  (let [digits (digitize num)]
    (= (sum-power digits (count digits)) num)))
