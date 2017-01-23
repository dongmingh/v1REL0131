The utility creates a network for v1 release 01/31.


#Code Base

    fabric commit level: 


#Usage

    ./driver_opt.sh [action] [option]

- action: create or add
 - create: to create a new network with n peers
- option: network option number to be created
 - 1: 1 orderer (solo) and 1 peer
 - 2: 1 orderer(kafka) and 1 peer
 - 3: 1 cop, 1 orderer(kafka) and 1 peer


##Examples

####example 1: create a network with 1 orderer (solo), and 1 peers

    ./driver_opt.sh create 2

