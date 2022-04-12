
## setting replica set
k exec -it mongo-0 -n production -- /bin/bash

mongo

rs.initiate()
