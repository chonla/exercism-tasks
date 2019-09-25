(ns armstrong-numbers)

(defn digits [num]
  (map #(- (int %) (int \0)) (str num)))

(defn len [num] 
  (count (digits num)))

(defn power [num pow]
  (reduce * (repeat pow num)))

(defn sum-power [num pow]
  (reduce + (map #(power % pow) (digits num))))

(defn armstrong? [num] ;; <- arglist goes here
  (= (sum-power num (len num)) num))
