# Put memcached server setting file:
  config/memserver.yml

# file body

COMMON: &COMMON
  memservers:
    production:
      - "mslb05:11211"
      - "mslb06:11211"
    development:
      - "localhost:11211"
development:
  <<: *COMMON
test:
  <<: *COMMON
production:
  <<: *COMMON
