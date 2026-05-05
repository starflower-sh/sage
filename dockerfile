ARG PG_VERSION

FROM postgres:${PG_VERSION}

ARG PG_VERSION

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    postgresql-contrib-${PG_VERSION} \
  && rm -rf /var/lib/apt/lists/*

COPY init-extensions.sql /docker-entrypoint-initdb.d/

CMD ["postgres", \
  "-c", "shared_preload_libraries=pg_stat_statements,auto_explain", \
  "-c", "pg_stat_statements.max=10000", \
  "-c", "pg_stat_statements.track=all", \
  "-c", "pg_stat_statements.track_planning=on", \
  "-c", "track_io_timing=on", \
  "-c", "track_wal_io_timing=on", \
  "-c", "track_functions=pl", \
  "-c", "auto_explain.log_min_duration=1000", \
  "-c", "auto_explain.log_analyze=on", \
  "-c", "auto_explain.log_buffers=on", \
  "-c", "auto_explain.log_wal=on", \
  "-c", "auto_explain.log_timing=off", \
  "-c", "auto_explain.log_nested_statements=on", \
  "-c", "log_min_duration_statement=1000", \
  "-c", "log_checkpoints=on", \
  "-c", "log_connections=on", \
  "-c", "log_disconnections=on", \
  "-c", "log_lock_waits=on", \
  "-c", "log_temp_files=0", \
  "-c", "deadlock_timeout=1s" \
]
