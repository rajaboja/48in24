def steps:
  if .<=0 then "Only positive integers are allowed" | halt_error(1)
  elif .==1 then 0 
  elif .%2==0 then 1+(./2 | steps)
  else 1+ ((.*3)+1 | steps) end;