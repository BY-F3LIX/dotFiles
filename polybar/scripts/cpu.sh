vmstat -n 1 | \
    awk '{used=$13+$14;total=used+$15
          if(total>0){ print "CPU:" used*100/total "%" }}'
