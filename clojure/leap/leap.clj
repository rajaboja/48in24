(ns leap)

(defn leap-year?
  [year]
  (if (or (= (mod year 400) 0) (and (= (mod year 4) 0) (not= (mod year 100) 0)))
    true
    false)
  )