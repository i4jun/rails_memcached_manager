# Put memcached server setting file:
  config/memserver.yml

# file body

<pre>
COMMON: &COMMON
  memservers:
    production:
      - "xxxx1:11211"
      - "xxxx2:11211"
    development:
      - "localhost:11211"
development:
  <<: *COMMON
test:
  <<: *COMMON
production:
  <<: *COMMON
</pre>
