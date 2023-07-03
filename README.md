# Install
```shell
sudo apt install smartmontools
```

# Manually Checking
```shell
smartctl -a /dev/sdX
# Look for SMART overall-health self-assessment test result: PASSED
```


# Manually Scheduling
```shell
smartctl -t short /dev/sd<whatever>
```

# Automatic Tests
smartd comes with smartmontools, make sure it's enabled
```shell
sudo systemctl enable --now smartd
```

From https://wiki.archlinux.org/title/S.M.A.R.T.#smartd

Replace `/etc/smartd.conf` with 
```text
DEVICESCAN -a -o on -S on -n standby,q -s (S/../.././02|L/../../6/03) -W 4,35,40
```
schedules a short test every day at 2AM and a long test every weekend at 3AM

```shell
sudo systemctl restart smartd
```

## MOTD status reporting
Copy the motd scripts into `/etc/update-motd.d`
These basically scrape journal for smartd notifications
