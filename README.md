[![GPLv3 license](https://img.shields.io/badge/License-GPLv3-blue.svg)](http://perso.crans.org/besson/LICENSE.html)
[![Ask Me Anything !](https://img.shields.io/badge/Ask%20me-anything-1abc9c.svg)](https://GitHub.com/Naereen/ama)

# process-killer
Kill a linux process in a defined memory condition.

- A local file pkill.log is created, recording wich process was killed;
- A notification is shown with the main command that was killed;

## Running once
`$ sh ./pkill.sh <cpu-usage-limit>`

## Running forever
The script can kept running with using the linux command `watch`, for example:

`$ watch -n 10 sh ./pkill.sh 90`

meaning that the scrippt should run at each 10 seconds and kill any process that exceeds 90% of CPU usage.

## Exceptions
The script is limited to not kill processes from the root user (pid=0) neither from the root group admin (gid=0)
