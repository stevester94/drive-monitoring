disks=(sda sdb)

for i in "${!disks[@]}"; do
    disk=${disks[$i]}
    res=`sudo smartctl -a /dev/$disk | grep "test result"`
    echo /dev/$disk: $res
done
