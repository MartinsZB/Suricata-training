HOME_NET: "[192.168.0.0/16,10.0.0.0/8,172.16.0.0/12]"

af-packet:
  - interface: eth0
    cluster-id: 99
    cluster-type: cluster_flow
    defrag: yes
    
    RULES
