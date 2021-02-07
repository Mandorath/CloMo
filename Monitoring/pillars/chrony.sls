chrony:
  pool:
    - '0.nl.pool.ntp.org'
    - '1.nl.pool.ntp.org'
    - '2.nl.pool.ntp.org'
    - '3.nl.pool.ntp.org'
  allow:
    - '192.168/16'
  otherparams:
    - 'rtcsync'
    - 'makestep 10 3'
    - 'logchange 0.5'
