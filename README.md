##The utility creates a network based on the input option for v1 release 01/31/2017.

There are three network options for this release:

- option 1: a network with 1 orderer (solo) and 1 peer
- option 2: a network with 1 orderer(kafka) and 1 peer
- option 3: a network with 1 cop, 1 orderer(kafka) and 1 peer


#Usage

    ./driver_opt.sh create [option]

- option: network option number
 - 1: create the network option 1
 - 2: create the network option 2
 - 3: create the network option 3


##Examples

####example 1: the following command will create the network option 2 which contains 1 orderer (solo) and 1 peer

    ./driver_opt.sh create 1

####example 2: the following command will create the network option 2 which contains 1 orderer (kafka) and 1 peer

    ./driver_opt.sh create 2


####example 3: the following command will create the network option 2 which contains 1 cop, 1 orderer (kafka) and 1 peer

    ./driver_opt.sh create 3
