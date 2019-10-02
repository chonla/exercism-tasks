(ns reverse-string)

(defn reverse-string [s]
  (loop [ss s acc ""]
    (if (= (count ss) 0) acc
        (recur (rest ss) (str (first ss) acc)))))
