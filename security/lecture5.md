# Miscellaneous Topics in Security

## Inconsistencies due to Power failures
Money debited from account but not credited to another account. How is that prevented?  A disk write is assumed to be the smallest atomic unit of stable storage update.

## Data-leaks due to Crashes/Crash-Recovery
In case the ordering is not respected. Talk about soft-updates

## Data lifetime
- Device buffers
- Application buffers and swap space
- Compiler removing dead code

## Capabilities and ACLs
- capabilities
  - file descriptors, secret keys/passwords, document URL, fingerprints
    - easy to share
    - opaque
    - hard to review and revoke
- access-control lists
  - user-group-other r/w/x for files/devices, admission/membership list, friend list on social media, etc.
  - easier to review and revoke

## User/kernel errors
