# redis-ha-labs
Setting up HA redis clusters


# AWS Lab

## Lab 1 Sentinels

```
AZ-1                  AZ-2                  AZ-3
+---------+           +---------+           +---------+
| Redis   |           | Redis   |           | Redis   |
| Master  |           | Replica |           | Replica |
+---------+           +---------+           +---------+
     |                     |                     |
     |-------------------Replication-------------|
     |                     |                     |
+---------+           +---------+           +---------+
| Sentinel|           | Sentinel|           | Sentinel|
+---------+           +---------+           +---------+

```

## Lab 2 Migration to DragonFly

wip


# GCP Lab

wip