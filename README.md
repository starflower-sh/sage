## Sage
Postgres images with useful monitoring extensions pre-configured 

### What is this for?
Postgres has many useful extensions for monitoring your database, but they're not always available out of the box.\
Sage aims to provide a setup for Postgres so that you have most of what you need straight away.\
This involves configuring the extensions I (Charlie) believe are useful in all databases, so you can extend the config with your database-specific requirements.

### Extensions
The extensions currently configured are:
- [pg_stat_statements](https://www.postgresql.org/docs/current/pgstatstatements.html)
- [pg_buffercache](https://www.postgresql.org/docs/current/pgbuffercache.html)
- [pgstattuple](https://www.postgresql.org/docs/current/pgstattuple.html)
- [pg_visibility](https://www.postgresql.org/docs/current/pgvisibility.html)
- [pageinspect](https://www.postgresql.org/docs/current/pageinspect.html)

### Usage
Sage currently provides docker images for amd64/arm64 for PG versions 15,16,17, and 18.\
This is publically hosted at: https://ghcr.io/starflower-sh/sage-postgres \
You can find a compose file with an example of usage in the repo root.
