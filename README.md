# UDF Repository for MariaDB

A UDF library with functions to interact with the operating system. These functions allow you to interact with the execution environment in which MariaDB runs.

## Build

```bash
docker build .
CID=$(docker create lib_mariadbudf_sys)
docker cp ${CID}:/build/lib_mysqludf_sys/lib_mariaudf_sys.so .
docker rm ${CID}
```

## Install

copy `lib_mariaudf_sys.so` to mariadb's plugin directory, then run:

```sql
create function sys_exec returns int soname 'lib_mysqludf_sys.so';
create function sys_eval returns string soname 'lib_mysqludf_sys.so';
```

## Using

```sql
select sys_eval('uname -a')
```

## Security Precautions

UDFs are available to all database users - you cannot grant EXECUTE privileges for them.
As the command string passed to `sys_exec` or `sys_eval` can do pretty much everything,
exposing the function poses a real security hazard.
