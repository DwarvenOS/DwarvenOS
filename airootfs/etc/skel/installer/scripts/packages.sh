#/bin/bash
l(){
read -n1 -p "Minimal or Full package installation? [F/m]: " package
echo

package=$(echo "$package" | tr '[:upper:]' '[:lower:]')

if [ "$package" == "f" ] || [ "$package" == "" ]; then
	pacstrap -K /mnt/dwarf $(cat ./full_pkg)	
	else if [ "$package" == "m" ]; then
		pacstrap -K /mnt/dwarf $(cat ./min_pkg)
		else
			echo "Wrong input"
			l
	fi
fi
}

l
