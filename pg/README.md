# Postgresql setup

The `ansible` scripts here can be used to set up a postgresql in a master-slave
topology.

## Notes

### PG
- WAL maintained in `pg_xlog/` subdirectory of data directory
- If recovery is required,  restore system backup and replay WAL logs to bring
  system up to current state

### Generic
- update master and slave entries in /etc/hosts
- ansible templating happens on the controller before the task is sent and
  executed on the host
- Install `ansible` roles

```
$ export ANSIBLE_NOCOWS=1
$ ansible-galaxy install -p roles ANXS.postgresql
$ sudo mv roles/ANXS.postgresql roles/postgresql
```
