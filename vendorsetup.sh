for combo in $(curl -s https://raw.githubusercontent.com/KCUFRom/android_vendor_kcuf/p/kcuf.devices | sed -e 's/#.*$//' | awk '{printf "kcuf_%s-%s\n", $1, $2}')
do
    add_lunch_combo $combo
done
